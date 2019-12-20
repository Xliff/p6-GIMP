use v6;

use NativeCall;

use GIMP::Raw::Types;

use GTK::Roles::Signals::Generic;

role GIMP::Widget::Roles::Signals::ColorSelector {
  also does GTK::Roles::Signals::Generic;

  has %!signals-gcs;

  # GimpColorSelector, gpointer, gpointer, gpointer
  method connect-color-changed (
    $obj,
    $signal = 'color-changed',
    &handler?
  ) {
    my $hid;
    %!signals-gcs{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-color-changed($obj, $signal,
        -> $, $p1, $p2, $ud {
          CATCH {
            default { $s.note($_) }
          }

          $s.emit( [self, $p1, $p2, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-gcs{$signal}[0].tap(&handler) with &handler;
    %!signals-gcs{$signal}[0];
  }

}

# GimpColorSelector, gpointer, gpointer, gpointer
sub g-connect-color-changed(
  Pointer $app,
  Str $name,
  &handler (Pointer, gpointer, gpointer, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
