use v6;

use NativeCall;

use GIMP::Raw::Types;

use GLib::Roles::StaticClass;
use GIMP::PDB::Roles::Assumable;

class GIMP::PDB::PaletteSelect {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method close_popup (Str() $palette_callback) {
    so gimp_palettes_close_popup($palette_callback);
  }

  method popup (
    Str() $palette_callback,
    Str() $popup_title,
    Str() $initial_palette
  ) {
    so gimp_palettes_popup($palette_callback, $popup_title, $initial_palette);
  }

  method set_popup (Str() $palette_callback, Str() $palette_name) {
    so gimp_palettes_set_popup($palette_callback, $palette_name);
  }
}

### /usr/include/gimp-2.0/libgimp/gimppaletteselect_pdb.h

sub gimp_palettes_close_popup (Str $palette_callback)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palettes_popup (
  Str $palette_callback,
  Str $popup_title,
  Str $initial_palette
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palettes_set_popup (Str $palette_callback, Str $palette_name)
  returns uint32
  is native(gimp)
  is export
{ * }
