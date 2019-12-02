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

  method convert_color_profile_from_file (
    Int() $image_ID,
    Str $uri,
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

  # Convert

  method convert_grayscale (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_convert_grayscale($image_ID);
  }

  method convert_indexed (
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

  method convert_precision (Int() $image_ID, Int() $precision) {
    my gint32 $i = $image_ID;
    my GimpPrecision $p = $precision;

    gimp_image_convert_precision($image_ID, $precision);
  }

  method convert_rgb (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_convert_rgb($image_ID);
  }

  method convert_set_dither_matrix (
    Int() $width,
    Int() $height,
    Int() $matrix_length,
    CArray[guint8] $matrix
  ) {
    my gint ($w, $h, $m) = ($width, $height, $matrix_length);

    gimp_image_convert_set_dither_matrix($w, $h, $m, $matrix);
  }

}
