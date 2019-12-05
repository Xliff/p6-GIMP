use v6;

use NativeCall;

use GIMP::Raw::Types;

use GLib::Roles::StaticClass;

class GIMP::PDB::Brushes {
  also does GLib::Roles::StaticClass;

  method close_popup (Str() $brush_callback) {
    so gimp_brushes_close_popup($brush_callback);
  }

  method popup (
    Str() $brush_callback,
    Str() $popup_title,
    Str() $initial_brush,
    Num() $opacity,
    Int() $spacing,
    Int() $paint_mode
  ) {
    my gdouble $o = $opacity;
    my gint $s = $spacing;
    my GimpLayerMode $p = $paint_mode;

    so gimp_brushes_popup(
      $brush_callback,
      $popup_title,
      $initial_brush,
      $o,
      $s,
      $p
    );
  }

}

### /usr/include/gimp-2.0/libgimp/gimpbrushselect_pdb.h

sub gimp_brushes_close_popup (Str $brush_callback)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_brushes_popup (
  Str $brush_callback,
  Str $popup_title,
  Str $initial_brush,
  gdouble $opacity,
  gint $spacing,
  GimpLayerMode $paint_mode
)
  returns uint32
  is native(gimp)
  is export
{ * }
