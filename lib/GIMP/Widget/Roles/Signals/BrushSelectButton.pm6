use v6;

use NativeCall;

use GIMP::Raw::Types;

role GIMP::Widget::Roles::Signals::BrushSelectButton {
  has %!signals-gbsb;

    # GimpBrushSelectButton, gchar, gdouble, gint, gint, gint, gint, gpointer, gboolean, gpointer
  method connect-brush-set (
    $obj,
    $signal = 'brush-set',
    &handler?
  ) {
    my $hid;
    %!signals-gbsb{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-brush-set($obj, $signal,
        -> $, $s, $d, $i1, $i2, $i3, $i4, $p, $b, $ud {
          CATCH {
            default { $s.note($_) }
          }

          $s.emit( [self, $s, $d, $i1, $i2, $i3, $i4, $p, $b, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-gbsb{$signal}[0].tap(&handler) with &handler;
    %!signals-gbsb{$signal}[0];
  }

}

# GimpBrushSelectButton, gchar, gdouble, gint, gint, gint, gint, gpointer, gboolean, gpointer
sub g-connect-brush-set(
  Pointer $app,
  Str $name,
  &handler (Pointer, gchar, gdouble, gint, gint, gint, gint, gpointer, gboolean, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
