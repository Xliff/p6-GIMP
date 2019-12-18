use v6;

use NativeCall;

use GIMP::Raw::Types;

role GIMP::Widget::Roles::Signals::PatternSelectButton {
  has %!signals-gpsb;

  # GimpPatternSelectButton, gchar, gint, gint, gint, gpointer, gboolean, gpointer
  method connect-pattern-set (
    $obj,
    $signal = 'pattern-set',
    &handler?
  ) {
    my $hid;
    %!signals-gpsb{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-pattern-set($obj, $signal,
        -> $, $i1, $i2, $i3, $i4, $p, $b, $ud {
          CATCH {
            default { $s.note($_) }
          }

          $s.emit( [self, $i1, $i2, $i3, $i4, $p, $b, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-gpsb{$signal}[0].tap(&handler) with &handler;
    %!signals-gpsb{$signal}[0];
  }

}

# GimpPatternSelectButton, gchar, gint, gint, gint, gpointer, gboolean, gpointer
sub g-connect-pattern-set(
  Pointer $app,
  Str $name,
  &handler (Pointer, gchar, gint, gint, gint, gpointer, gboolean, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
