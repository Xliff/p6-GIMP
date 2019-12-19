use v6;

use NativeCall;

use GIMP::Raw::Types;

role GIMP::Widget::Roles::Signals::CellRendererToggle {
  has %!signals-gcrt;

  # GimpCellRendererToggle, gchar, GdkModifierType, gpointer
  method connect-clicked (
    $obj,
    $signal = 'clicked',
    &handler?
  ) {
    my $hid;
    %!signals-gcrt{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-clicked($obj, $signal,
        -> $, $g, $gmt, $ud {
          CATCH {
            default { $s.note($_) }
          }

          $s.emit( [self, $g, $gmt, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-gcrt{$signal}[0].tap(&handler) with &handler;
    %!signals-gcrt{$signal}[0];
  }

}

# GimpCellRendererToggle, gchar, GdkModifierType, gpointer
sub g-connect-clicked(
  Pointer $app,
  Str $name,
  &handler (Pointer, gchar, guint, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
