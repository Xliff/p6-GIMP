use v6;

use NativeCall;

use GIMP::Raw::Types;

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

### /usr/include/gimp-2.0/libgimp/gimpimagesamplepoints_pdb.h

sub gimp_image_add_sample_point (
  gint32 $image_ID,
  gint $position_x,
  gint $position_y
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_delete_sample_point (gint32 $image_ID, gint32 $sample_point_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_find_next_sample_point (
  gint32 $image_ID,
  gint32 $sample_point_ID
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_sample_point_position (
  gint32 $image_ID,
  gint32 $sample_point_ID,
  gint $position_y
)
  returns gint
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimpimageselect_pdb.h

sub gimp_image_select_color (
  gint32 $image_ID,
  GimpChannelOps $operation,
  gint32 $drawable_ID,
  GimpRGB $color
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_select_contiguous_color (
  gint32 $image_ID,
  GimpChannelOps $operation,
  gint32 $drawable_ID,
  gdouble $x,
  gdouble $y
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_select_ellipse (
  gint32 $image_ID,
  GimpChannelOps $operation,
  gdouble $x,
  gdouble $y,
  gdouble $width,
  gdouble $height
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_select_item (
  gint32 $image_ID,
  GimpChannelOps $operation,
  gint32 $item_ID
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_select_polygon (
  gint32 $image_ID,
  GimpChannelOps $operation,
  gint $num_segs,
  CArray[gdouble] $segs
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_select_rectangle (
  gint32 $image_ID,
  GimpChannelOps $operation,
  gdouble $x,
  gdouble $y,
  gdouble $width,
  gdouble $height
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_select_round_rectangle (
  gint32 $image_ID,
  GimpChannelOps $operation,
  gdouble $x,
  gdouble $y,
  gdouble $width,
  gdouble $height,
  gdouble $corner_radius_x,
  gdouble $corner_radius_y
)
  returns uint32
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimpimageundo_pdb.h

sub gimp_image_undo_disable (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_undo_enable (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_undo_freeze (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_undo_group_end (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_undo_group_start (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_undo_is_enabled (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_undo_thaw (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }
