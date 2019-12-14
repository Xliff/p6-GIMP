use v6;

use GIMP::Raw::Types;
use GIMP::PDB::Raw::Selection;

use GLib::Roles::StaticClass;

class GIMP::PDB::Selection {
  also does GLib::Roles::StaticClass;

  method all (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_selection_all($i);
  }

  method border (Int() $image_ID, Int() $radius) {
    my gint32 $i = $image_ID;
    my gint $r = $radius;

    gimp_selection_border($i, $r);
  }

  multi method bounds (
    Int() $image_ID,
    Int() $non_empty,
    :$all = True
  ) {
    samewith($image_ID, $non_empty, $, $, $ ,$, :$all);
  }
  multi method bounds (
    Int() $image_ID,
    Int() $non_empty,
    $x1 is rw,
    $y1 is rw,
    $x2 is rw,
    $y2 is rw,
    :$all = False
  ) {
    my gint ($i, $xx1, $yy1, $xx2, $yy2) = ($i, 0, 0, 0, 0);
    my gboolean $n = (so $non_empty).Int;
    my $rv = gimp_selection_bounds($i, $n, $xx1, $yy1, $xx2, $yy2);

    $all.not ??
      $rv
      !!
      ($rv, $x1 = $xx1, $y1 = $yy1, $x2 = $xx2, $y2 = $yy2);

  }

  method feather (Int() $image_ID, Num() $radius) {
    my gint32 $i = $image_ID;
    my gdouble $r = $radius;

    gimp_selection_feather($i, $r);
  }

  method float (
    Int() $image_ID,
    Int() $drawable_ID,
    Int() $offx,
    Int() $offy
  ) {
    my gint32 ($i, $d) = ($image_ID, $drawable_ID);
    my gint ($ox, $oy) = ($offx, $offy);

    gimp_selection_float($i, $d, $ox, $oy);
  }

  method flood (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_selection_flood($i);
  }

  method grow (Int() $image_ID, Int() $steps) {
    my gint32 $i = $image_ID;
    my gint $s = $steps;

    gimp_selection_grow($i, $steps);
  }

  method invert (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_selection_invert($i);
  }

  method is_empty (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_selection_is_empty($i);
  }

  method none (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_selection_none($i);
  }

  method save (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_selection_save($i);
  }

  method sharpen (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_selection_sharpen($i);
  }

  method shrink (Int() $image_ID, Int() $steps) {
    my gint32 $i = $image_ID;
    my gint $s = $steps;

    gimp_selection_shrink($i, $s);
  }

  method translate (Int() $image_ID, Int() $offx, Int() $offy) {
    my gint32 $i = $image_ID;
    my gint ($ox, $oy) = ($offx, $offy);

    gimp_selection_translate($i, $ox, $oy);
  }

  method value (Int() $image_ID, Int() $x, Int() $y) {
    my gint32 $i = $image_ID;
    my gint ($xx, $yy) = ($x, $y);

    gimp_selection_value($i, $xx, $yy);
  }

}
