use v6;

use NativeCall;

use GIMP::Raw::Types;

role GIMP::Widget::Roles::Signals::Button {
  has %!signals-gb;

  # GimpButton, GdkModifierType, gpointer
  method connect-extended-clicked (
    $obj,
    $signal = 'extended-clicked',
    &handler?
  ) {
    my $hid;
    %!signals-gb{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-extended-clicked($obj, $signal,
        -> $, $gmt, $ud {
          CATCH {
            default { $s.note($_) }
          }

          $s.emit( [self, $gmt, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-gb{$signal}[0].tap(&handler) with &handler;
    %!signals-gb{$signal}[0];
  }

}

# GimpButton, GdkModifierType, gpointer
sub g-connect-extended-clicked(
  Pointer $app,
  Str $name,
  &handler (Pointer, GdkModifierType, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
