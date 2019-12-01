use v6;

use NativeCall;

use GTK::Compat::Types;

unit package GIMP::Raw::Brush;

### /usr/include/gimp-2.0/libgimp/gimpbrush_pdb.h

sub gimp_brush_delete (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_brush_duplicate (Str $name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_brush_get_angle (Str $name)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_brush_get_aspect_ratio (Str $name)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_brush_get_hardness (Str $name)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_brush_get_info (Str $name, gint $width, gint $height, gint $mask_bpp, gint $color_bpp)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_brush_get_pixels (Str $name, gint $width, gint $height, gint $mask_bpp, gint $num_mask_bytes, guint8 $mask_bytes, gint $color_bpp, gint $num_color_bytes, guint8 $color_bytes)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_brush_get_radius (Str $name)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_brush_get_shape (Str $name)
  returns GimpBrushGeneratedShape
  is native(gimp)
  is export
{ * }

sub gimp_brush_get_spacing (Str $name, gint $spacing)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_brush_get_spikes (Str $name)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_brush_new (Str $name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_brush_rename (Str $name, Str $new_name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_brush_set_spacing (Str $name, gint $spacing)
  returns uint32
  is native(gimp)
  is export
{ * }
