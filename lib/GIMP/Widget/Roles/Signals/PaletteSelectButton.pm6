use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

role GIMP::Widget::Roles::Signals::PaletteSelectButton {
  has %!signals-gpsb;

  # GimpPaletteSelectButton, gchar, gboolean, gpointer
  method connect-palette-set (
    $obj,
    $signal = 'palette-set',
    &handler?
  ) {
    my $hid;
    %!signals-gpsb{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-palette-set($obj, $signal,
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
    %!signals-gpsb{$signal}[0].tap(&handler) with &handler;
    %!signals-gpsb{$signal}[0];
  }

}

# GimpPaletteSelectButton, gchar, gboolean, gpointer
sub g-connect-palette-set(
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
