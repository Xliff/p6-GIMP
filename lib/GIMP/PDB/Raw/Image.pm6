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
  gint $position_y is rw
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

### /usr/include/gimp-2.0/libgimp/gimppixbuf.h

sub gimp_image_get_thumbnail (
  gint32 $image_ID,
  gint $width,
  gint $height,
  GimpPixbufTransparency $alpha
)
  returns GdkPixbuf
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimpimage_pdb.h

sub gimp_image_attach_parasite (gint32 $image_ID, GimpParasite $parasite)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_base_type (gint32 $image_ID)
  returns GimpImageBaseType
  is native(gimp)
  is export
{ * }

sub gimp_image_clean_all (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_delete (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_detach_parasite (gint32 $image_ID, Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_duplicate (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_flatten (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_floating_sel_attached_to (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_freeze_channels (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_freeze_layers (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_freeze_vectors (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_active_channel (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_active_drawable (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_active_layer (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_active_vectors (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_channel_by_name (gint32 $image_ID, Str $name)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_channel_by_tattoo (gint32 $image_ID, gint $tattoo)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_channels (gint32 $image_ID, gint $num_channels is rw)
  returns CArray[gint]
  is native(gimp)
  is export
{ * }

sub gimp_image_get_component_active (
  gint32 $image_ID,
  GimpChannelType $component
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_component_visible (
  gint32 $image_ID,
  GimpChannelType $component
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_default_new_layer_mode (gint32 $image_ID)
  returns GimpLayerMode
  is native(gimp)
  is export
{ * }

sub gimp_image_get_exported_uri (gint32 $image_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_image_get_filename (gint32 $image_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_image_get_floating_sel (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_imported_uri (gint32 $image_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_image_get_item_position (gint32 $image_ID, gint32 $item_ID)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_image_get_layer_by_name (gint32 $image_ID, Str $name)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_layer_by_tattoo (gint32 $image_ID, gint $tattoo)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_layers (gint32 $image_ID, gint $num_layers is rw)
  returns CArray[gint]
  is native(gimp)
  is export
{ * }

sub gimp_image_get_name (gint32 $image_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_image_get_parasite (gint32 $image_ID, Str $name)
  returns GimpParasite
  is native(gimp)
  is export
{ * }

sub gimp_image_get_parasite_list (
  gint32 $image_ID,
  gint $num_parasites is rw
)
  returns CArray[Str]
  is native(gimp)
  is export
{ * }

sub gimp_image_get_precision (gint32 $image_ID)
  returns GimpPrecision
  is native(gimp)
  is export
{ * }

sub gimp_image_get_resolution (
  gint32 $image_ID,
  gdouble $xresolution is rw,
  gdouble $yresolution is rw
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_selection (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_tattoo_state (gint32 $image_ID)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_image_get_unit (gint32 $image_ID)
  returns GimpUnit
  is native(gimp)
  is export
{ * }

sub gimp_image_get_uri (gint32 $image_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_image_get_vectors (gint32 $image_ID, gint $num_vectors is rw)
  returns CArray[gint]
  is native(gimp)
  is export
{ * }

sub gimp_image_get_vectors_by_name (gint32 $image_ID, Str $name)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_vectors_by_tattoo (gint32 $image_ID, gint $tattoo)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_get_xcf_uri (gint32 $image_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_image_height (gint32 $image_ID)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_image_insert_channel (
  gint32 $image_ID,
  gint32 $channel_ID,
  gint32 $parent_ID,
  gint $position
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_insert_layer (
  gint32 $image_ID,
  gint32 $layer_ID,
  gint32 $parent_ID,
  gint $position
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_insert_vectors (
  gint32 $image_ID,
  gint32 $vectors_ID,
  gint32 $parent_ID,
  gint $position
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_is_dirty (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_is_valid (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_list (gint $num_images is rw)
  returns CArray[gint]
  is native(gimp)
  is export
{ * }

sub gimp_image_lower_item (gint32 $image_ID, gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_lower_item_to_bottom (gint32 $image_ID, gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_merge_down (
  gint32 $image_ID,
  gint32 $merge_layer_ID,
  GimpMergeType $merge_type
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_merge_visible_layers (
  gint32 $image_ID,
  GimpMergeType $merge_type
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_new (gint $width, gint $height, GimpImageBaseType $type)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_new_with_precision (
  gint $width,
  gint $height,
  GimpImageBaseType $type,
  GimpPrecision $precision
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_pick_color (
  gint32 $image_ID,
  gint32 $drawable_ID,
  gdouble $x,
  gdouble $y,
  gboolean $sample_merged,
  gboolean $sample_average,
  gdouble $average_radius,
  GimpRGB $color
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_pick_correlate_layer (gint32 $image_ID, gint $x, gint $y)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_image_raise_item (gint32 $image_ID, gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_raise_item_to_top (gint32 $image_ID, gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_remove_channel (gint32 $image_ID, gint32 $channel_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_remove_layer (gint32 $image_ID, gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_remove_vectors (gint32 $image_ID, gint32 $vectors_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_reorder_item (
  gint32 $image_ID,
  gint32 $item_ID,
  gint32 $parent_ID,
  gint $position
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_active_channel (
  gint32 $image_ID,
  gint32 $active_channel_ID
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_active_layer (
  gint32 $image_ID,
  gint32 $active_layer_ID
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_active_vectors (
  gint32 $image_ID,
  gint32 $active_vectors_ID
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_component_active (
  gint32 $image_ID,
  GimpChannelType $component,
  gboolean $active
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_component_visible (
  gint32 $image_ID,
  GimpChannelType $component,
  gboolean $visible
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_filename (gint32 $image_ID, Str $filename)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_resolution (
  gint32 $image_ID,
  gdouble $xresolution,
  gdouble $yresolution
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_tattoo_state (gint32 $image_ID, gint $tattoo_state)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_unit (gint32 $image_ID, GimpUnit $unit)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_thaw_channels (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_thaw_layers (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_thaw_vectors (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_unset_active_channel (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_width (gint32 $image_ID)
  returns gint
  is native(gimp)
  is export
{ * }
