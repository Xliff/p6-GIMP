use v6;

use GTK::Raw::Utils;

use GIMP::Raw::Types;

use GIMP::PDB::Raw::Item;

use GLib::Roles::StaticClass;

class GIMP::PDB::Item {
  also does GLib::Roles::StaticClass;

  method attach_parasite (Int() $image_ID, GimpParasite $parasite) {
    my gint32 $i = $image_ID;

    gimp_item_attach_parasite($i, $parasite);
  }

  method delete (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_item_delete($i);
  }

  method detach_parasite (Int() $image_ID, Str() $name) {
    my gint32 $i = $image_ID;

    gimp_item_detach_parasite($i, $name);
  }

  method get_children (Int() $image_ID, Int() $num_children) {
    my gint32 $i = $image_ID;
    my gint $n = $num_children;

    gimp_item_get_children($i, $n);
  }

  method get_color_tag (Int() $image_ID) {
    my gint32 $i = $image_ID;

    GimpColorTagEnum( gimp_item_get_color_tag($i) );
  }

  method get_expanded (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_item_get_expanded($i);
  }

  method get_image (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_item_get_image($i);
  }

  method get_linked (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_item_get_linked($i);
  }

  method get_lock_content (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_item_get_lock_content($i);
  }

  method get_lock_position (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_item_get_lock_position($i);
  }

  method get_name (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_item_get_name($i);
  }

  method get_parasite (Int() $image_ID, Str() $name) {
    my gint32 $i = $image_ID;

    gimp_item_get_parasite($i, $name);
  }

  proto method get_parasite_list (|)
  { * }

  multi method get_parasite_list(Int() $image_ID) {
    samewith($image_ID, $);
  }
  multi method get_parasite_list (Int() $image_ID, $num_parasites is rw) {
    my gint32 $i = $image_ID;
    my gint $n = 0;
    my $pa = gimp_item_get_parasite_list($i, $n);
    $num_parasites = $n;

    CStringArrayToArray($pa, $n);
  }

  method get_parent (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_item_get_parent($i);
  }

  method get_tattoo (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_item_get_tattoo($i);
  }

  method get_visible (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_item_get_visible($i);
  }

  method is_channel (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_item_is_channel($i);
  }

  method is_drawable (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_item_is_drawable($i);
  }

  method is_group (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_item_is_group($i);
  }

  method is_layer (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_item_is_layer($i);
  }

  method is_layer_mask (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_item_is_layer_mask($i);
  }

  method is_selection (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_item_is_selection($i);
  }

  method is_text_layer (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_item_is_text_layer($i);
  }

  method is_valid (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_item_is_valid($i);
  }

  method is_vectors (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_item_is_vectors($i);
  }

  method set_color_tag (Int() $image_ID, Int() $color_tag) {
    my gint32 $i = $image_ID;
    my GimpColorTag $c = $color_tag;

    gimp_item_set_color_tag($i, $c);
  }

  method set_expanded (Int() $image_ID, Int() $expanded) {
    my gint32 $i = $image_ID;
    my gboolean $e = (so $expanded).Int;

    so gimp_item_set_expanded($i, $expanded);
  }

  method set_linked (Int() $image_ID, Int() $linked) {
    my gint32 $i = $image_ID;
    my gboolean $l = (so $linked).Int;

    so gimp_item_set_linked($i, $linked);
  }

  method set_lock_content (Int() $image_ID, Int() $lock_content) {
    my gint32 $i = $image_ID;
    my gboolean $l = (so $lock_content).Int;

    so gimp_item_set_lock_content($i, $l);
  }

  method set_lock_position (Int() $image_ID, Int() $lock_position) {
    my gint32 $i = $image_ID;
    my gboolean $l = (so $lock_position).Int;

    so gimp_item_set_lock_position($i, $l);
  }

  method set_name (Int() $image_ID, Str $name) {
    my gint32 $i = $image_ID;

    so gimp_item_set_name($i, $name);
  }

  method set_tattoo (Int() $image_ID, Int() $tattoo) {
    my gint32 $i = $image_ID;
    my gint $t = $tattoo;

    so gimp_item_set_tattoo($i, $t);
  }

  method set_visible (Int() $image_ID, Int() $visible) {
    my gint32 $i = $image_ID;
    my gboolean $v = (so $visible).Int;

    so gimp_item_set_visible($i, $v);
  }

}

class GIMP::PDB::Item::Transform {
  also does GLib::Roles::StaticClass;

  method two-d (
    Int() $item_ID,
    Num() $source_x,
    Num() $source_y,
    Num() $scale_x,
    Num() $scale_y,
    Num() $angle,
    Num() $dest_x,
    Num() $dest_y
  ) {
    my gint32 $i = $item_ID;

    my ($sx, $sy, $scx, $scy, $a, $dx, $dy) = (
      $source_x,
      $source_y,
      $scale_x,
      $scale_y,
      $angle,
      $dest_x,
      $dest_y
    );

    gimp_item_transform_2d($i, $sx, $sy, $scx, $scy, $a, $dx, $dy);
  }

  method flip (
    Int() $item_ID,
    Num() $x0,
    Num() $y0,
    Num() $x1,
    Num() $y1
  ) {
    my gint32 $i = $item_ID;
    my gdouble ($xx0, $yy0, $xx1, $yy1) = ($x0, $y0, $x1, $y1);

    gimp_item_transform_flip($item_ID, $xx0, $yy0, $xx1, $yy1);
  }

  method flip_simple (
    Int() $item_ID,
    Int() $flip_type,
    Int() $auto_center,
    Num() $axis
  ) {
    my gint32 $i = $item_ID;
    my GimpOrientationType $f = $flip_type;
    my gboolean $a = (so $auto_center).Int;
    my gdouble $ax = $axis;

    gimp_item_transform_flip_simple($i, $f, $a, $ax);
  }

  method matrix (
    Int() $item_ID,
    Num() $coeff_0_0,
    Num() $coeff_0_1,
    Num() $coeff_0_2,
    Num() $coeff_1_0,
    Num() $coeff_1_1,
    Num() $coeff_1_2,
    Num() $coeff_2_0,
    Num() $coeff_2_1,
    Num() $coeff_2_2
  ) {
    my gint32 $i = $item_ID;
    my gdouble ($c00, $c01, $c02, $c10, $c11, $c12, $c20, $c21, $c22) = (
      $coeff_0_0,
      $coeff_0_1,
      $coeff_0_2,
      $coeff_1_0,
      $coeff_1_1,
      $coeff_1_2,
      $coeff_2_0,
      $coeff_2_1,
      $coeff_2_2
    );

    gimp_item_transform_matrix(
      $i,
      $c00,
      $c01,
      $c02,
      $c10,
      $c11,
      $c12,
      $c20,
      $c21,
      $c22
    );
  }

  method perspective (
    gint32 $item_ID,
    gdouble $x0,
    gdouble $y0,
    gdouble $x1,
    gdouble $y1,
    gdouble $x2,
    gdouble $y2,
    gdouble $x3,
    gdouble $y3
  ) {
    my gint32 $i = $item_ID;
    my gdouble ($dx0, $dy0, $dx1, $dy1, $dx2, $dy2, $dx3, $dy3) = (
      $x0,
      $y0,
      $x1,
      $y1,
      $x2,
      $y2,
      $x3,
      $y3
    );

    gimp_item_transform_perspective(
      $i,
      $dx0,
      $dy0,
      $dx1,
      $dy1,
      $dx2,
      $dy2,
      $dx3,
      $dy3
    );
  }

  method rotate (
    Int() $item_ID,
    Num() $angle,
    Int() $auto_center,
    Num() $center_x,
    Num() $center_y
  ) {
    my gint32 $i = $item_ID;
    my gboolean $ac = (so $auto_center).Int;
    my gdouble ($a, $cx, $cy) = ($angle, $center_x, $center_y);

    gimp_item_transform_rotate($i, $a, $ac, $cx, $cy);
  }

  method rotate_simple (
    Int() $item_ID,
    Int() $rotate_type,
    Int() $auto_center,
    Num() $center_x,
    Num() $center_y
  ) {
    my gint32 $i = $item_ID;
    my GimpRotationType $r = $rotate_type;
    my gboolean $ac = (so $auto_center).Int;
    my gdouble ($cx, $cy) = ($center_x, $center_y);

    gimp_item_transform_rotate_simple($i, $r, $ac, $cx, $cy);
  }

  method scale (
    Int() $item_ID,
    Num() $x0,
    Num() $y0,
    Num() $x1,
    Num() $y1
  ) {
    my gint32 $i = $item_ID;
    my gdouble ($xx0, $yy0, $xx1, $yy1) = ($x0, $y0, $x1, $y1);

    gimp_item_transform_scale($i, $xx0, $yy0, $xx1, $yy1);
  }

  method shear (
    Int() $item_ID,
    Int() $shear_type,
    Num() $magnitude
  ) {
    my gint32 $i = $item_ID;
    my GimpOrientationType $s = $shear_type;
    my gdouble $m = $magnitude;

    gimp_item_transform_shear($i, $s, $m);
  }

  method translate (Int() $item_ID, Num() $off_x, Num() $off_y) {
    my gint32 $i = $item_ID;
    my gdouble ($ox, $oy) = ($off_x, $off_y);

    gimp_item_transform_translate($i, $ox, $oy);
  }

}
