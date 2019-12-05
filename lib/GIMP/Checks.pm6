use v6;

use NativeCall;

use GIMP::Raw::Types;

use GLib::Roles::StaticClass;

class GIMP::Checks {
  also does GLib::Roles::StaticClass;

  method get_shades (Int() $type, Str() $light, Str() $dark) {
    my GimpCheckType $t = $type;

    gimp_checks_get_shades($type, $light, $dark);
  }

}

### /usr/include/gimp-2.0/libgimpbase/gimpchecks.h

sub gimp_checks_get_shades (GimpCheckType $type, Str $light, Str $dark)
  is native(gimpbase)
  is export
{ * }
