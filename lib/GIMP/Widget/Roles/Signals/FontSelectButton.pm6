use v6;

use NativeCall;

use GIMP::Raw::Types;

role GIMP::Widget::Roles::Signals::FontSelectButton {
  has %!signals-gfsb;

  # GimpFontSelectButton, gchar, gboolean, gpointer
  method connect-font-set (
    $obj,
    $signal = 'font-set',
    &handler?
  ) {
    my $hid;
    %!signals-gfsb{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-font-set($obj, $signal,
        -> $, $s, $b, $ud {
          CATCH {
            default { $s.note($_) }
          }

          $s.emit( [self, $s, $b, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-gfsb{$signal}[0].tap(&handler) with &handler;
    %!signals-gfsb{$signal}[0];
  }

}

# GimpFontSelectButton, gchar, gboolean, gpointer
sub g-connect-font-set(
  Pointer $app,
  Str $name,
  &handler (Pointer, gchar, gboolean, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
