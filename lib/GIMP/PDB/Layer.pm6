use v6;

use GIMP::Raw::Types;
use GIMP::PDB::Raw::Layer;

use GLib::Roles::StaticClass;
use GIMP::PDB::Roles::Assumable;

class GIMP::PDB::Layer {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method new_layer (
    Int() $image_ID,
    Str() $name,
    Int() $width,
    Int() $height,
    Int() $type,
    Num() $opacity,
    Int() $mode
  ) {
    my gint32 $i = $image_ID;
    my gint ($w, $h) = ($width, $height);
    my GimpImageType $t = $type;
    my GimpLayerMode $m = $mode;
    my gdouble $o = $opacity;

    gimp_layer_new($i, $name, $w, $h, $t, $o, $m);
  }

  method new_from_pixbuf (
    Int() $image_ID,
    Str() $name,
    GdkPixbuf() $pixbuf,
    Num() $opacity,
    Int() $mode,
    Num() $progress_start,
    Num() $progress_end
  ) {
    my gint32 $i = $image_ID;
    my gdouble ($o, $s, $e) = ($opacity, $progress_start, $progress_end);
    my GimpLayerMode $m = $mode;

    gimp_layer_new_from_pixbuf($i, $name, $pixbuf, $o, $m, $s, $e);
  }

  method new_from_surface (
    Int() $image_ID,
    Str() $name,
    CairoSurface $surface,
    Num() $progress_start,
    Num() $progress_end
  ) {
    my gint32 $i = $image_ID;
    my gdouble ($s, $e) = ($progress_start, $progress_end);
    my $surf = ($surface ~~ Cairo::Surface) ?? $surface.surface !! $surface;

    gimp_layer_new_from_surface($i, $name, $surf, $s, $e);
  }

  method new_from_drawable (Int() $drawable_ID, Int() $dest_image_ID) {
    my gint32 ($d, $di) = ($drawable_ID, $dest_image_ID);

    gimp_layer_new_from_drawable($d, $di);
  }

  method new_from_visible (
    Int() $image_ID,
    Int() $dest_image_ID,
    Str() $name
  ) {
    my gint32 ($i, $d) = ($image_ID, $dest_image_ID);

    gimp_layer_new_from_visible($i, $d, $name);
  }

  method add_alpha (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_layer_add_alpha($l);
  }

  method add_mask (Int() $layer_ID, Int() $mask_ID) {
    my gint32 ($l, $m) = ($layer_ID, $mask_ID);

    gimp_layer_add_mask($l, $mask_ID);
  }

  method copy (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_layer_copy($l);
  }

  method create_mask (Int() $layer_ID, Int() $mask_type) {
    my gint32 $l = $layer_ID;
    my GimpAddMaskType $m = $mask_type;

    gimp_layer_create_mask($l, $mask_type);
  }

  method flatten (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_layer_flatten($l);
  }

  method from_mask (Int() $mask_ID) {
    my gint32 $m = $mask_ID;

    gimp_layer_from_mask($mask_ID);
  }

  method get_apply_mask (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_layer_get_apply_mask($l);
  }

  method get_blend_space (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    GimpLayerColorSpaceEnum( gimp_layer_get_blend_space($l) );
  }

  method get_composite_mode (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    GimpLayerCompositeModeEnum( gimp_layer_get_composite_mode($l) );
  }

  method get_composite_space (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    GimpLayerColorSpaceEnum( gimp_layer_get_composite_space($l) );
  }

  method get_edit_mask (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_layer_get_edit_mask($l);
  }

  method get_lock_alpha (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_layer_get_lock_alpha($l);
  }

  method get_mask (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_layer_get_mask($l);
  }

  method get_mode (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    GimpLayerModeEnum( gimp_layer_get_mode($l) );
  }

  method get_opacity (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_layer_get_opacity($l);
  }

  method get_show_mask (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_layer_get_show_mask($l);
  }

  method group_new (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_layer_group_new($i);
  }

  method is_floating_sel (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    so gimp_layer_is_floating_sel($l);
  }

  method remove_mask (Int() $layer_ID, Int() $mode) {
    my gint32 $l = $layer_ID;
    my GimpMaskApplyMode $m = $mode;

    gimp_layer_remove_mask($l, $m);
  }

  method resize (
    Int() $layer_ID,
    Int() $new_width,
    Int() $new_height,
    Int() $offx,
    Int() $offy
  ) {
    my gint32 $l = $layer_ID;
    my gint ($w, $h, $ox, $oy) = ($new_width, $new_height, $offx, $offy);

    gimp_layer_resize($l, $w, $h, $ox, $oy);
  }

  method resize_to_image_size (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_layer_resize_to_image_size($l);
  }

  method scale (
    Int() $layer_ID,
    Int() $new_width,
    Int() $new_height,
    Int() $local_origin
  ) {
    my gint32 $l = $layer_ID;
    my gint ($w, $h) = ($new_width, $new_height);
    my gboolean $lo = (so $local_origin).Int;

    gimp_layer_scale($l, $w, $h, $lo);
  }

  method set_apply_mask (Int() $layer_ID, Int() $apply_mask) {
    my gint32 $l = $layer_ID;
    my gboolean $a = (so $apply_mask).Int;

    gimp_layer_set_apply_mask($l, $a);
  }

  method set_blend_space (Int() $layer_ID, Int() $blend_space) {
    my gint32 $l = $layer_ID;
    my GimpLayerColorSpace $b = $blend_space;

    gimp_layer_set_blend_space($l, $b);
  }

  method set_composite_mode (Int() $layer_ID, Int() $composite_mode) {
    my gint32 $l = $layer_ID;
    my GimpLayerCompositeMode $c = $composite_mode;

    gimp_layer_set_composite_mode($l, $c);
  }

  method set_composite_space (Int() $layer_ID, Int() $composite_space) {
    my gint32 $l = $layer_ID;
    my GimpLayerColorSpace $c = $composite_space;

    gimp_layer_set_composite_space($l, $c);
  }

  method set_edit_mask (Int() $layer_ID, Int() $edit_mask) {
    my gint32 $l = $layer_ID;
    my gboolean $e = (so $edit_mask).Int;

    gimp_layer_set_edit_mask($l, $e);
  }

  method set_lock_alpha (Int() $layer_ID, Int() $lock_alpha) {
    my gint32 $l = $layer_ID;
    my gboolean $la = (so $lock_alpha).Int;

    gimp_layer_set_lock_alpha($l, $la);
  }

  method set_mode (Int() $layer_ID, Int() $mode) {
    my gint32 $l = $layer_ID;
    my GimpLayerMode $m = $mode;

    gimp_layer_set_mode($l, $m);
  }

  method set_offsets (Int() $layer_ID, Int() $offx, Int() $offy) {
    my gint32 $l = $layer_ID;
    my gint ($ox, $oy) = ($offx, $offy);

    gimp_layer_set_offsets($l, $ox, $oy);
  }

  method set_opacity (Int() $layer_ID, Num() $opacity) {
    my gint32 $l = $layer_ID;
    my gdouble $o = $opacity;

    gimp_layer_set_opacity($l, $o);
  }

  method set_show_mask (Int() $layer_ID, Int() $show_mask) {
    my gint32 $l = $layer_ID;
    my gboolean $s = $show_mask;

    gimp_layer_set_show_mask($l, $);
  }

}

constant Layer is export := GIMP::PDB::Layer;
