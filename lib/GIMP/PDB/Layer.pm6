use v6;

use GIMP::Raw::Types;
use GIMP::PDB::Raw::Layer;

use GLib::Roles::StaticClass;
use GTK::PDB::Roles::Assumable;

class GIMP::PDB::Layer {
  also does GLib::Roles::StaticClass;
  also does GTK::PDB::Roles::Assumable;

  method new_layer (
    gint32 $image_ID,
    Str $name,
    gint $width,
    gint $height,
    GimpImageType $type,
    gdouble $opacity,
    GimpLayerMode $mode
  ) {
    gimp_layer_new($image_ID, $name, $width, $height, $type, $opacity, $mode);
  }

  method new_from_pixbuf (
    gint32 $image_ID,
    Str $name,
    GdkPixbuf $pixbuf,
    gdouble $opacity,
    GimpLayerMode $mode,
    gdouble $progress_start,
    gdouble $progress_end
  ) {
    gimp_layer_new_from_pixbuf(
      $image_ID,
      $name,
      $pixbuf,
      $opacity,
      $mode,
      $progress_start,
      $progress_end
    );
  }

  method new_from_surface (
    gint32 $image_ID,
    Str $name,
    cairo_surface_t $surface,
    gdouble $progress_start,
    gdouble $progress_end
  ) {
    gimp_layer_new_from_surface(
      $image_ID,
      $name,
      $surface,
      $progress_start,
      $progress_end
    );
  }

  method new_from_drawable (gint32 $drawable_ID, gint32 $dest_image_ID) {
    gimp_layer_new_from_drawable($drawable_ID, $dest_image_ID);
  }

  method new_from_visible (
    gint32 $image_ID,
    gint32 $dest_image_ID,
    Str $name
  ) {
    gimp_layer_new_from_visible($image_ID, $dest_image_ID, $name);
  }

  method add_alpha (gint32 $layer_ID) {
    gimp_layer_add_alpha($layer_ID);
  }

  method add_mask (gint32 $layer_ID, gint32 $mask_ID) {
    gimp_layer_add_mask($layer_ID, $mask_ID);
  }

  method copy (gint32 $layer_ID) {
    gimp_layer_copy($layer_ID);
  }

  method create_mask (gint32 $layer_ID, GimpAddMaskType $mask_type) {
    gimp_layer_create_mask($layer_ID, $mask_type);
  }

  method flatten (gint32 $layer_ID) {
    gimp_layer_flatten($layer_ID);
  }

  method from_mask (gint32 $mask_ID) {
    gimp_layer_from_mask($mask_ID);
  }

  method get_apply_mask (gint32 $layer_ID) {
    gimp_layer_get_apply_mask($layer_ID);
  }

  method get_blend_space (gint32 $layer_ID) {
    gimp_layer_get_blend_space($layer_ID);
  }

  method get_composite_mode (gint32 $layer_ID) {
    gimp_layer_get_composite_mode($layer_ID);
  }

  method get_composite_space (gint32 $layer_ID) {
    gimp_layer_get_composite_space($layer_ID);
  }

  method get_edit_mask (gint32 $layer_ID) {
    gimp_layer_get_edit_mask($layer_ID);
  }

  method get_lock_alpha (gint32 $layer_ID) {
    gimp_layer_get_lock_alpha($layer_ID);
  }

  method get_mask (gint32 $layer_ID) {
    gimp_layer_get_mask($layer_ID);
  }

  method get_mode (gint32 $layer_ID) {
    gimp_layer_get_mode($layer_ID);
  }

  method get_opacity (gint32 $layer_ID) {
    gimp_layer_get_opacity($layer_ID);
  }

  method get_show_mask (gint32 $layer_ID) {
    gimp_layer_get_show_mask($layer_ID);
  }

  method group_new (gint32 $image_ID) {
    gimp_layer_group_new($image_ID);
  }

  method is_floating_sel (gint32 $layer_ID) {
    gimp_layer_is_floating_sel($layer_ID);
  }

  method remove_mask (gint32 $layer_ID, GimpMaskApplyMode $mode) {
    gimp_layer_remove_mask($layer_ID, $mode);
  }

  method resize (
    gint32 $layer_ID,
    gint $new_width,
    gint $new_height,
    gint $offx,
    gint $offy
  ) {
    gimp_layer_resize($layer_ID, $new_width, $new_height, $offx, $offy);
  }

  method resize_to_image_size (gint32 $layer_ID) {
    gimp_layer_resize_to_image_size($layer_ID);
  }

  method scale (
    gint32 $layer_ID,
    gint $new_width,
    gint $new_height,
    gboolean $local_origin
  ) {
    gimp_layer_scale($layer_ID, $new_width, $new_height, $local_origin);
  }

  method set_apply_mask (gint32 $layer_ID, gboolean $apply_mask) {
    gimp_layer_set_apply_mask($layer_ID, $apply_mask);
  }

  method set_blend_space (gint32 $layer_ID, GimpLayerColorSpace $blend_space) {
    gimp_layer_set_blend_space($layer_ID, $blend_space);
  }

  method set_composite_mode (
    gint32 $layer_ID,
    GimpLayerCompositeMode $composite_mode
  ) {
    gimp_layer_set_composite_mode($layer_ID, $composite_mode);
  }

  method set_composite_space (
    gint32 $layer_ID,
    GimpLayerColorSpace $composite_space
  ) {
    gimp_layer_set_composite_space($layer_ID, $composite_space);
  }

  method set_edit_mask (gint32 $layer_ID, gboolean $edit_mask) {
    gimp_layer_set_edit_mask($layer_ID, $edit_mask);
  }

  method set_lock_alpha (gint32 $layer_ID, gboolean $lock_alpha) {
    gimp_layer_set_lock_alpha($layer_ID, $lock_alpha);
  }

  method set_mode (gint32 $layer_ID, GimpLayerMode $mode) {
    gimp_layer_set_mode($layer_ID, $mode);
  }

  method set_offsets (gint32 $layer_ID, gint $offx, gint $offy) {
    gimp_layer_set_offsets($layer_ID, $offx, $offy);
  }

  method set_opacity (gint32 $layer_ID, gdouble $opacity) {
    gimp_layer_set_opacity($layer_ID, $opacity);
  }

  method set_show_mask (gint32 $layer_ID, gboolean $show_mask) {
    gimp_layer_set_show_mask($layer_ID, $show_mask);
  }

}
