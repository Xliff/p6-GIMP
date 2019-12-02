use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;
use GIMP::Raw::Structs;

use GIMP::PDB::Raw::Image;

use GLib::Roles::StaticClass;

class GIMP::PDB::Image {
  also does GLib::Roles::StaticClass;

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

  method add_hguide Int() $image_ID, Int() $yposition) {
    my gint32 $i = $image_ID;
    my gint $y = $yposition;

    gimp_image_add_hguide($image_ID, $yposition);
  }

  method add_vguide Int() $image_ID, Int() $xposition) {
    my gint32 $i = $image_ID;
    my gint $x = $xposition;

    gimp_image_add_vguide($image_ID, $xposition);
  }

  method delete_guide Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_delete_guide($image_ID, $guide_ID);
  }

  method find_next_guide Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_find_next_guide($image_ID, $guide_ID);
  }

  method get_guide_orientation Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_get_guide_orientation($image_ID, $guide_ID);
  }

  method get_guide_position Int() $image_ID, Int() $guide_ID) {
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
    my gint $position_y;

    gimp_image_get_sample_point_position($i, $s, $y);
  }

}

class GIMP::PDB::Image::Convert {
  # Convert

  method grayscale (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_convert_grayscale($image_ID);
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

    gimp_image_convert_precision($image_ID, $precision);
  }

  method rgb (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_convert_rgb($image_ID);
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

  method get_background_color (Int() $image_ID, GimpRGB $bgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_get_background_color($image_ID, $bgcolor);
  }

  method get_foreground_color (Int() $image_ID, GimpRGB $fgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_get_foreground_color($image_ID, $fgcolor);
  }

  method get_offset (Int() $image_ID, $xoffset is rw, $yoffset is rw) {
    my gint32 $i = $image_ID;
    my gdouble ($xo, $yo) = 0e0 xx 2;

    gimp_image_grid_get_offset($image_ID, $xo, $yo);
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

    gimp_image_grid_get_spacing($image_ID, $xs, $ys);
    ($xspacing, $yspacing) = ($xs, $ys);
  }

  method get_style (Int() $image_ID) {
    my gint32 $i = $image_ID;

    GimpGridStyleEnum( gimp_image_grid_get_style($image_ID) );
  }

  method set_background_color (Int() $image_ID, GimpRGB $bgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_set_background_color($image_ID, $bgcolor);
  }

  method set_foreground_color (Int() $image_ID, GimpRGB $fgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_set_foreground_color($image_ID, $fgcolor);
  }

  method set_offset (Int() $image_ID, Num() $xoffset, Num() $yoffset) {
    my gint32 $i = $image_ID;
    my gdouble ($xo, $yo) = ($xoffset, $yoffset);

    gimp_image_grid_set_offset($image_ID, $xo, $yo);
  }

  method set_spacing (Int() $image_ID, Num() $xspacing, Num() $yspacing) {
    my gint32 $i = $image_ID;
    my gdouble ($xs, $ys) = ($xspacing, $yspacing);

    gimp_image_grid_set_spacing($image_ID, $xs, $ys);
  }

  method set_style (Int() $image_ID, Int() $style) {
    my gint32 $i = $image_ID;
    my GimpGridStyle $s = $style;

    gimp_image_grid_set_style($image_ID, $s);
  }
}