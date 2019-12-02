use v6;

use NativeCall;

use GTK::Compat::Types;

use GLib::Roles::StaticClass;

class GIMP::PDB::Fonts {
  also does GLib::Roles::StaticClass;

  method close_popup (Str() $font_callback) {
    gimp_fonts_close_popup($font_callback);
  }

  method popup (Str() $font_callback, Str() $popup_title, Str() $initial_font) {
    gimp_fonts_popup($font_callback, $popup_title, $initial_font);
  }

  method set_popup (Str() $font_callback, Str() $font_name) {
    gimp_fonts_set_popup($font_callback, $font_name);
  }

}

### /usr/include/gimp-2.0/libgimp/gimpfontselect_pdb.h

sub gimp_fonts_close_popup (Str() $font_callback)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_fonts_popup (Str() $font_callback, Str() $popup_title, Str() $initial_font)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_fonts_set_popup (Str() $font_callback, Str() $font_name)
  returns uint32
  is native(gimp)
  is export
{ * }
