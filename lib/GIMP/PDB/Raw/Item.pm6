use v6;

use NativeCall;

use GTK::Compat::Types;

unit package GIMP::PDB::Raw::Item;

### /usr/include/gimp-2.0/libgimp/gimpitem_pdb.h

sub gimp_item_attach_parasite (gint32 $item_ID, GimpParasite $parasite)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_delete (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_detach_parasite (gint32 $item_ID, Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_get_children (gint32 $item_ID, gint $num_children)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_item_get_color_tag (gint32 $item_ID)
  returns GimpColorTag
  is native(gimp)
  is export
{ * }

sub gimp_item_get_expanded (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_get_image (gint32 $item_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_get_linked (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_get_lock_content (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_get_lock_position (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_get_name (gint32 $item_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_item_get_parasite (gint32 $item_ID, Str $name)
  returns GimpParasite
  is native(gimp)
  is export
{ * }

sub gimp_item_get_parasite_list (gint32 $item_ID, gint $num_parasites)
  returns CArray[Str]
  is native(gimp)
  is export
{ * }

sub gimp_item_get_parent (gint32 $item_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_get_tattoo (gint32 $item_ID)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_item_get_visible (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_is_channel (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_is_drawable (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_is_group (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_is_layer (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_is_layer_mask (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_is_selection (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_is_text_layer (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_is_valid (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_is_vectors (gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_set_color_tag (gint32 $item_ID, GimpColorTag $color_tag)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_set_expanded (gint32 $item_ID, gboolean $expanded)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_set_linked (gint32 $item_ID, gboolean $linked)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_set_lock_content (gint32 $item_ID, gboolean $lock_content)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_set_lock_position (gint32 $item_ID, gboolean $lock_position)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_set_name (gint32 $item_ID, Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_set_tattoo (gint32 $item_ID, gint $tattoo)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_item_set_visible (gint32 $item_ID, gboolean $visible)
  returns uint32
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimpitemtransform_pdb.h

sub gimp_item_transform_2d (
  gint32 $item_ID,
  gdouble $source_x,
  gdouble $source_y,
  gdouble $scale_x,
  gdouble $scale_y,
  gdouble $angle,
  gdouble $dest_x,
  gdouble $dest_y
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_transform_flip (
  gint32 $item_ID,
  gdouble $x0,
  gdouble $y0,
  gdouble $x1,
  gdouble $y1
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_transform_flip_simple (
  gint32 $item_ID,
  GimpOrientationType $flip_type,
  gboolean $auto_center,
  gdouble $axis
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_transform_matrix (
  gint32 $item_ID,
  gdouble $coeff_0_0,
  gdouble $coeff_0_1,
  gdouble $coeff_0_2,
  gdouble $coeff_1_0,
  gdouble $coeff_1_1,
  gdouble $coeff_1_2,
  gdouble $coeff_2_0,
  gdouble $coeff_2_1,
  gdouble $coeff_2_2
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_transform_perspective (
  gint32 $item_ID,
  gdouble $x0,
  gdouble $y0,
  gdouble $x1,
  gdouble $y1,
  gdouble $x2,
  gdouble $y2,
  gdouble $x3,
  gdouble $y3
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_transform_rotate (
  gint32 $item_ID,
  gdouble $angle,
  gboolean $auto_center,
  gdouble $center_x,
  gdouble $center_y
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_transform_rotate_simple (
  gint32 $item_ID,
  GimpRotationType $rotate_type,
  gboolean $auto_center,
  gdouble $center_x,
  gdouble $center_y
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_transform_scale (
  gint32 $item_ID,
  gdouble $x0,
  gdouble $y0,
  gdouble $x1,
  gdouble $y1
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_transform_shear (
  gint32 $item_ID,
  GimpOrientationType $shear_type,
  gdouble $magnitude
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_item_transform_translate (
  gint32 $item_ID,
  gdouble $off_x,
  gdouble $off_y
)
  returns gint32
  is native(gimp)
  is export
{ * }
