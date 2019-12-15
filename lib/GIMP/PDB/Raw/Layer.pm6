use v6;

use NativeCall;

use GIMP::PDB::Raw::Layer;

### /usr/include/gimp-2.0/libgimp/gimplayer.h

sub gimp_layer_copy (gint32 $layer_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_new (
  gint32 $image_ID,
  Str $name,
  gint $width,
  gint $height,
  GimpImageType $type,
  gdouble $opacity,
  GimpLayerMode $mode
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_new_from_pixbuf (
  gint32 $image_ID,
  Str $name,
  GdkPixbuf $pixbuf,
  gdouble $opacity,
  GimpLayerMode $mode,
  gdouble $progress_start,
  gdouble $progress_end
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_new_from_surface (
  gint32 $image_ID,
  Str $name,
  cairo_surface_t $surface,
  gdouble $progress_start,
  gdouble $progress_end
)
  returns gint32
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimplayer_pdb.h

sub _gimp_layer_copy (gint32 $layer_ID, gboolean $add_alpha)
  returns gint32
  is native(gimp)
  is export
{ * }

sub _gimp_layer_new (
  gint32 $image_ID,
  gint $width,
  gint $height,
  GimpImageType $type,
  Str $name,
  gdouble $opacity,
  GimpLayerMode $mode
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_add_alpha (gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_add_mask (gint32 $layer_ID, gint32 $mask_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_create_mask (gint32 $layer_ID, GimpAddMaskType $mask_type)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_flatten (gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_from_mask (gint32 $mask_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_get_apply_mask (gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_get_blend_space (gint32 $layer_ID)
  returns GimpLayerColorSpace
  is native(gimp)
  is export
{ * }

sub gimp_layer_get_composite_mode (gint32 $layer_ID)
  returns GimpLayerCompositeMode
  is native(gimp)
  is export
{ * }

sub gimp_layer_get_composite_space (gint32 $layer_ID)
  returns GimpLayerColorSpace
  is native(gimp)
  is export
{ * }

sub gimp_layer_get_edit_mask (gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_get_lock_alpha (gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_get_mask (gint32 $layer_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_get_mode (gint32 $layer_ID)
  returns GimpLayerMode
  is native(gimp)
  is export
{ * }

sub gimp_layer_get_opacity (gint32 $layer_ID)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_layer_get_show_mask (gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_group_new (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_is_floating_sel (gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_new_from_drawable (gint32 $drawable_ID, gint32 $dest_image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_new_from_visible (
  gint32 $image_ID,
  gint32 $dest_image_ID,
  Str $name
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_remove_mask (gint32 $layer_ID, GimpMaskApplyMode $mode)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_resize (
  gint32 $layer_ID,
  gint $new_width,
  gint $new_height,
  gint $offx,
  gint $offy
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_resize_to_image_size (gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_scale (
  gint32 $layer_ID,
  gint $new_width,
  gint $new_height,
  gboolean $local_origin
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_set_apply_mask (gint32 $layer_ID, gboolean $apply_mask)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_set_blend_space (
  gint32 $layer_ID,
  GimpLayerColorSpace $blend_space
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_set_composite_mode (
  gint32 $layer_ID,
  GimpLayerCompositeMode $composite_mode
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_set_composite_space (
  gint32 $layer_ID,
  GimpLayerColorSpace $composite_space
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_set_edit_mask (gint32 $layer_ID, gboolean $edit_mask)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_set_lock_alpha (gint32 $layer_ID, gboolean $lock_alpha)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_set_mode (gint32 $layer_ID, GimpLayerMode $mode)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_set_offsets (gint32 $layer_ID, gint $offx, gint $offy)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_set_opacity (gint32 $layer_ID, gdouble $opacity)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_layer_set_show_mask (gint32 $layer_ID, gboolean $show_mask)
  returns uint32
  is native(gimp)
  is export
{ * }
