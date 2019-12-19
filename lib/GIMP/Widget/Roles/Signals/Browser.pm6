use v6;

use NativeCall;

use GIMP::Raw::Types;

role GIMP::Widget::Roles::Signals::Browser {
  has %!signals-gb;

  # GimpBrowser, gchar, gint, gpointer
  method connect-search (
    $obj,
    $signal = 'search',
    &handler?
  ) {
    my $hid;
    %!signals-gb{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-search($obj, $signal,
        -> $, $s, $i, $ud {
          CATCH {
            default { $s.note($_) }
          }

          $s.emit( [self, $s, $i, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-gb{$signal}[0].tap(&handler) with &handler;
    %!signals-gb{$signal}[0];
  }

}

# GimpBrowser, gchar, gint, gpointer
sub g-connect-search(
  Pointer $app,
  Str $name,
  &handler (Pointer, gchar, gint, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
