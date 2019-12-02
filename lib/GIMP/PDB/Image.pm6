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
    Str $uri,
    Int() $intent,
    Int() $bpc
  ) {
    my Int() $i = $image_ID;
    my GimpColorRenderingIntent $in = $intent,
    my gboolean $b = (so $bpc).Int;

    gimp_image_convert_color_profile_from_file($i, $uri, $in, $b);
  }

  method set_color_profile_from_file (
    Int() $image_ID,
    Str() $uri
  ) {
    my Int() $i = $image_ID;

    gimp_image_set_color_profile_from_file($i, $uri);
  }

  # Guides

  method add_hguide (Int() $image_ID, Int() $yposition) {
    my Int() $i = $image_ID;
    my Int() $y = $yposition;

    gimp_image_add_hguide($i, $y);
  }

  method add_vguide (Int() $image_ID, Int() $xposition) {
    my Int() $i = $image_ID;
    my Int() $x = $xposition;

    gimp_image_add_vguide($i, $x);
  }

  method delete_guide (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_delete_guide($i, $g);
  }

  method find_next_guide (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_find_next_guide($i, $g);
  }

  method get_guide_orientation (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_get_guide_orientation($i, $g);
  }

  method get_guide_position (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_get_guide_position($i, $g);
  }

}

class GIMP::PDB::Image::Convert {
  # Convert

  method grayscale (Int() $image_ID) {
    my Int() $i = $image_ID;

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
    my Int() $i = $image_ID;
    my Int() $n = $num_cols;
    my GimpConvertDitherType $d = $dither_type;
    my GimpConvertPaletteType $p = $palette_type;
    my gboolean ($a, $r) = ($alpha_dither, $remove_unused)».so».Int;

    gimp_image_convert_indexed($i, $d, $p, $n, $a, $r, $palette);
  }

  method precision (Int() $image_ID, Int() $precision) {
    my Int() $i = $image_ID;
    my GimpPrecision $p = $precision;

    gimp_image_convert_precision($image_ID, $precision);
  }

  method rgb (Int() $image_ID) {
    my Int() $i = $image_ID;

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
    my Int() $i = $image_ID;

    gimp_image_grid_get_background_color($image_ID, $bgcolor);
  }

  method get_foreground_color (Int() $image_ID, GimpRGB $fgcolor) {
    my Int() $i = $image_ID;

    gimp_image_grid_get_foreground_color($image_ID, $fgcolor);
  }

  method get_offset (Int() $image_ID, $xoffset is rw, $yoffset is rw) {
    my Int() $i = $image_ID;
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
    my Int() $i = $image_ID;
    my gdouble ($xs, $ys) = 0e0 xx 2;

    gimp_image_grid_get_spacing($image_ID, $xs, $ys);
    ($xspacing, $yspacing) = ($xs, $ys);
  }

  method get_style (Int() $image_ID) {
    my Int() $i = $image_ID;

    GimpGridStyleEnum( gimp_image_grid_get_style($image_ID) );
  }

  method set_background_color (Int() $image_ID, GimpRGB $bgcolor) {
    my Int() $i = $image_ID;

    gimp_image_grid_set_background_color($image_ID, $bgcolor);
  }

  method set_foreground_color (Int() $image_ID, GimpRGB $fgcolor) {
    my Int() $i = $image_ID;

    gimp_image_grid_set_foreground_color($image_ID, $fgcolor);
  }

  method set_offset (Int() $image_ID, Num() $xoffset, Num() $yoffset) {
    my Int() $i = $image_ID;
    my gdouble ($xo, $yo) = ($xoffset, $yoffset);

    gimp_image_grid_set_offset($image_ID, $xo, $yo);
  }

  method set_spacing (Int() $image_ID, Num() $xspacing, Num() $yspacing) {
    my Int() $i = $image_ID;
    my gdouble ($xs, $ys) = ($xspacing, $yspacing);

    gimp_image_grid_set_spacing($image_ID, $xs, $ys);
  }

  method set_style (Int() $image_ID, Int() $style) {
    my Int() $i = $image_ID;
    my GimpGridStyle $s = $style;

    gimp_image_grid_set_style($image_ID, $s);
  }
}
