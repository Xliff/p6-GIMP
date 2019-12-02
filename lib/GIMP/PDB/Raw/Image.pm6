use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;
use GIMP::Raw::Structs;

unit package GIMP::PDB::Raw::Image;

### /usr/include/gimp-2.0/libgimp/gimpimagecolorprofile_pdb.h

sub gimp_image_convert_color_profile_from_file (
  gint32 $image_ID,
  Str $uri,
  GimpColorRenderingIntent $intent,
  gboolean $bpc
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_color_profile_from_file (gint32 $image_ID, Str $uri)
  returns uint32
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimpimageconvert_pdb.h

sub gimp_image_convert_grayscale (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_convert_indexed (
  gint32 $image_ID,
  GimpConvertDitherType $dither_type,
  GimpConvertPaletteType $palette_type,
  gint $num_cols,
  gboolean $alpha_dither,
  gboolean $remove_unused,
  Str $palette
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_convert_precision (gint32 $image_ID, GimpPrecision $precision)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_convert_rgb (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_convert_set_dither_matrix (
  gint $width,
  gint $height,
  gint $matrix_length,
  CArray[guint8] $matrix
)
  returns uint32
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimpimagegrid_pdb.h

sub gimp_image_grid_get_background_color (gint32 $image_ID, GimpRGB $bgcolor)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_grid_get_foreground_color (gint32 $image_ID, GimpRGB $fgcolor)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_grid_get_offset (
  gint32 $image_ID,
  gdouble $xoffset,
  gdouble $yoffset
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_grid_get_spacing (
  gint32 $image_ID,
  gdouble $xspacing,
  gdouble $yspacing
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_grid_get_style (gint32 $image_ID)
  returns GimpGridStyle
  is native(gimp)
  is export
{ * }

sub gimp_image_grid_set_background_color (gint32 $image_ID, GimpRGB $bgcolor)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_grid_set_foreground_color (gint32 $image_ID, GimpRGB $fgcolor)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_grid_set_offset (
  gint32 $image_ID,
  gdouble $xoffset,
  gdouble $yoffset
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_grid_set_spacing (
  gint32 $image_ID,
  gdouble $xspacing,
  gdouble $yspacing
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_grid_set_style (gint32 $image_ID, GimpGridStyle $style)
  returns uint32
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimpimageguides_pdb.h

sub gimp_image_add_hguide (gint32 $image_ID, gint $yposition)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_add_vguide (gint32 $image_ID, gint $xposition)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_delete_guide (gint32 $image_ID, gint32 $guide_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_find_next_guide (gint32 $image_ID, gint32 $guide_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_guide_orientation (gint32 $image_ID, gint32 $guide_ID)
  returns GimpOrientationType
  is native(gimp)
  is export
{ * }

sub gimp_image_get_guide_position (gint32 $image_ID, gint32 $guide_ID)
  returns gint
  is native(gimp)
  is export
{ * }
