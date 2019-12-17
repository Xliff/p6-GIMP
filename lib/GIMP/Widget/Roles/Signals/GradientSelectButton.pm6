use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

role GIMP::Widget::Roles::Signals::GradientSelectButton {
  has %!signals-ggsb;

  # GimpGradientSelectButton, gchar, gint, gpointer, gboolean, gpointer
  method connect-gradient-set (
    $obj,
    $signal = 'gradient-set',
    &handler?
  ) {
    my $hid;
    %!signals-ggsb{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-gradient-set($obj, $signal,
        -> $, $s, $i, $gp, $b, $ud {
          CATCH {
            default { $s.note($_) }
          }

          $s.emit( [self, $s, $i, $gp, $b, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-ggsb{$signal}[0].tap(&handler) with &handler;
    %!signals-ggsb{$signal}[0];
  }

}

# GimpGradientSelectButton, gchar, gint, gpointer, gboolean, gpointer
sub g-connect-gradient-set(
  Pointer $app,
  Str $name,
  &handler (GimpGradientSelectButton, gchar, gint, gpointer, gboolean, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
