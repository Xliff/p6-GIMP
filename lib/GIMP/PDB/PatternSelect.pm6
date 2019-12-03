use v6;

use NativeCall;

use GTK::Compat::Types;

use GLib::Roles::StaticClass;

class GIMP::PDB::PatternSelect {
  also does GLib::Roles::StaticClass;

  method close_popup (Str() $pattern_callback) {
    gimp_patterns_close_popup($pattern_callback);
  }

  method popup (
    Str() $pattern_callback,
    Str() $popup_title,
    Str() $initial_pattern
  ) {
    gimp_patterns_popup($pattern_callback, $popup_title, $initial_pattern);
  }

}

### /usr/include/gimp-2.0/libgimp/gimppatternselect_pdb.h

sub gimp_patterns_close_popup (Str $pattern_callback)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_patterns_popup (
  Str $pattern_callback,
  Str $popup_title,
  Str $initial_pattern
)
  returns uint32
  is native(gimp)
  is export
{ * }
