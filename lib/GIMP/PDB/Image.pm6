use v6;

use NativeCall;

use GIMP::Raw::Types;

use GIMP::PDB::Raw::Utils;
use GIMP::PDB::Raw::Image;

use GLib::Roles::StaticClass;
use GIMP::PDB::Roles::Assumable;

class GIMP::PDB::Image {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  # Color

  method color_profile_from_file (
    Int() $image_ID,
    Str() $uri,
    Int() $intent,
    Int() $bpc
  ) {
    my gint32 $i = $image_ID;
    my GimpColorRenderingIntent $in = $intent,
    my gboolean $b = (so $bpc).Int;

    gimp_image_convert_color_profile_from_file($i, $uri, $in, $b);
  }

  method set_color_profile_from_file (
    Int() $image_ID,
    Str() $uri
  ) {
    my gint32 $i = $image_ID;

    gimp_image_set_color_profile_from_file($i, $uri);
  }

  # Guides

  method add_hguide (Int() $image_ID, Int() $yposition) {
    my gint32 $i = $image_ID;
    my gint $y = $yposition;

    gimp_image_add_hguide($image_ID, $yposition);
  }

  method add_vguide (Int() $image_ID, Int() $xposition) {
    my gint32 $i = $image_ID;
    my gint $x = $xposition;

    gimp_image_add_vguide($image_ID, $xposition);
  }

  method delete_guide (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_delete_guide($image_ID, $guide_ID);
  }

  method find_next_guide (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_find_next_guide($image_ID, $guide_ID);
  }

  method get_guide_orientation (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_get_guide_orientation($image_ID, $guide_ID);
  }

  method get_guide_position (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_get_guide_position($image_ID, $guide_ID);
  }

  # Sample Points

  method add_sample_point (Int() $image_ID, Int() $position_x, Int() $position_y) {
    my gint32 $i = $image_ID;
    my gint ($x, $y) = ($position_x, $position_y);

    gimp_image_add_sample_point($image_ID, $x, $y);
  }

  method delete_sample_point (Int() $image_ID, Int() $sample_point_ID) {
    my gint32 ($i, $s) = ($image_ID, $sample_point_ID);

    gimp_image_delete_sample_point($i, $s);
  }

  method find_next_sample_point (Int() $image_ID, Int() $sample_point_ID) {
    my gint32 ($i, $s) = ($image_ID, $sample_point_ID);

    gimp_image_find_next_sample_point($i, $s);
  }

  method get_sample_point_position (
    Int() $image_ID,
    Int() $sample_point_ID,
    Int() $position_y
  ) {
    my gint32 ($i, $s) = ($image_ID, $sample_point_ID);
    my gint $y = $position_y;

    gimp_image_get_sample_point_position($i, $s, $y);
  }

}

class GIMP::PDB::Image::Convert {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  # Convert

  method grayscale (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_convert_grayscale($i);
  }

  method indexed (
    Int() $image_ID,
    Int() $dither_type,
    Int() $palette_type,
    Int() $num_cols,
    Int() $alpha_dither,
    Int() $remove_unused,
    Str() $palette
  ) {
    my gint32 $i = $image_ID;
    my gint $n = $num_cols;
    my GimpConvertDitherType $d = $dither_type;
    my GimpConvertPaletteType $p = $palette_type;
    my gboolean ($a, $r) = ($alpha_dither, $remove_unused)».so».Int;

    gimp_image_convert_indexed($i, $d, $p, $n, $a, $r, $palette);
  }

  method precision (Int() $image_ID, Int() $precision) {
    my gint32 $i = $image_ID;
    my GimpPrecision $p = $precision;

    gimp_image_convert_precision($i, $p);
  }

  method rgb (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_convert_rgb($i);
  }

  method set_dither_matrix (
    Int() $width,
    Int() $height,
    Int() $matrix_length,
    CArray[guint8] $matrix
  ) {
    my gint ($w, $h, $m) = ($width, $height, $matrix_length);

    gimp_image_convert_set_dither_matrix($w, $h, $m, $matrix);
  }

}

class GIMP::PDB::Image::Grid {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method get_background_color (Int() $image_ID, GimpRGB $bgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_get_background_color($i, $bgcolor);
  }

  method get_foreground_color (Int() $image_ID, GimpRGB $fgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_get_foreground_color($i, $fgcolor);
  }

  method get_offset (Int() $image_ID, $xoffset is rw, $yoffset is rw) {
    my gint32 $i = $image_ID;
    my gdouble ($xo, $yo) = 0e0 xx 2;

    gimp_image_grid_get_offset($i, $xo, $yo);
    ($xoffset, $yoffset) = ($xo, $yo)
  }

  proto method get_spacing (|)
  { * }

  multi method get_spacing (Int() $image_ID) {
    samewith($image_ID, $, $);
  }
  multi method get_spacing (
    Int() $image_ID,
    $xspacing is rw,
    $yspacing is rw
  ) {
    my gint32 $i = $image_ID;
    my gdouble ($xs, $ys) = 0e0 xx 2;

    gimp_image_grid_get_spacing($i, $xs, $ys);
    ($xspacing, $yspacing) = ($xs, $ys);
  }

  method get_style (Int() $image_ID) {
    my gint32 $i = $image_ID;

    GimpGridStyleEnum( gimp_image_grid_get_style($i) );
  }

  method set_background_color (Int() $image_ID, GimpRGB $bgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_set_background_color($i, $bgcolor);
  }

  method set_foreground_color (Int() $image_ID, GimpRGB $fgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_set_foreground_color($i, $fgcolor);
  }

  method set_offset (Int() $image_ID, Num() $xoffset, Num() $yoffset) {
    my gint32 $i = $image_ID;
    my gdouble ($xo, $yo) = ($xoffset, $yoffset);

    gimp_image_grid_set_offset($i, $xo, $yo);
  }

  method set_spacing (Int() $image_ID, Num() $xspacing, Num() $yspacing) {
    my gint32 $i = $image_ID;
    my gdouble ($xs, $ys) = ($xspacing, $yspacing);

    gimp_image_grid_set_spacing($i, $xs, $ys);
  }

  method set_style (Int() $image_ID, Int() $style) {
    my gint32 $i = $image_ID;
    my GimpGridStyle $s = $style;

    gimp_image_grid_set_style($i, $s);
  }
}

class GIMP::PDB::Image::Select {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method color (
    Int() $image_ID,
    Int() $operation,
    Int() $drawable_ID,
    GimpRGB $color
  ) {
    my gint32 ($i, $d) = ($image_ID, $drawable_ID);
    my GimpChannelOps $o = $operation;

    gimp_image_select_color($i, $o, $d, $color);
  }

  method contiguous_color (
    Int() $image_ID,
    Int() $operation,
    Int() $drawable_ID,
    Num() $x,
    Num() $y
  ) {
    my gint32 ($i, $d) = ($image_ID, $drawable_ID);
    my GimpChannelOps $o = $operation;
    my gdouble ($xx, $yy) = ($x, $y);

    gimp_image_select_contiguous_color($i, $o, $d, $xx, $yy);
  }

  method ellipse (
    Int() $image_ID,
    Int() $operation,
    Num() $x,
    Num() $y,
    Num() $width,
    Num() $height
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelOps $o = $operation;
    my gdouble ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    gimp_image_select_ellipse($i, $o, $xx, $yy, $w, $h);
  }

  method item (Int() $image_ID, Int() $operation, Int() $item_ID) {
    my gint32 ($i, $it) = ($image_ID, $item_ID);
    my GimpChannelOps $o = $operation;

    gimp_image_select_item($i, $o, $it);
  }

  proto method polygon (|)
  { * }

  multi method polygon (
    Int() $image_ID,
    Int() $operation,
    @segs
  ) {
    samewith( $image_ID, $operation, @segs.elems, DoubleArrayToCArray(@segs) );
  }
  multi method polygon (
    Int() $image_ID,
    Int() $operation,
    Int() $num_segs,
    CArray[gdouble] $segs
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelOps $o = $operation;
    my gint $n = $num_segs;

    gimp_image_select_polygon($i, $o, $n, $segs);
  }

  method rectangle (
    Int() $image_ID,
    Int() $operation,
    Num() $x,
    Num() $y,
    Num() $width,
    Num() $height
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelOps $o = $operation;
    my gdouble ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    gimp_image_select_rectangle($i, $o, $xx, $yy, $w, $h);
  }

  method round_rectangle (
    Int() $image_ID,
    Int() $operation,
    Num() $x,
    Num() $y,
    Num() $width,
    Num() $height,
    Num() $corner_radius_x,
    Num() $corner_radius_y
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelOps $o = $operation;
    my gdouble ($xx, $yy, $w, $h, $cx, $cy) = (
      $x,
      $y,
      $width,
      $height,
      $corner_radius_x,
      $corner_radius_y
    );

    gimp_image_select_round_rectangle($i, $o, $xx, $yy, $w, $h, $cx, $cy);
  }

}

class GIMP::PDB::Image::Undo {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method disable (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_disable($i);
  }

  method enable (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_enable($i);
  }

  method freeze (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_freeze($i);
  }

  method group_end (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_group_end($i);
  }

  method group_start (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_group_start($i);
  }

  method is_enabled (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_image_undo_is_enabled($i);
  }

  method thaw (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_thaw($i);
  }

}
