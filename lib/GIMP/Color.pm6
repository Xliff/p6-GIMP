use v6;

use GIMP::Raw::Types;
use GIMP::Raw::Color;

use GLib::Roles::StaticClass;

class GIMP::Color {
  also does GLib::Roles::StaticClass;

  method cmyk_to_rgb (GimpCMYK $cmyk, GimpRGB $rgb) {
    gimp_cmyk_to_rgb($cmyk, $rgb);
  }

  method cmyk_to_rgb_int (
    $cyan    is rw,
    $magenta is rw,
    $yellow  is rw,
    Int() $black
  ) {
    my gint ($c, $m, $y, $b) = ($cyan, $magenta, $yellow, $black);

    gimp_cmyk_to_rgb_int($c, $m, $y, $b);
    ($cyan, $magenta, $yellow) = ($c, $m, $y);
  }

  method hsl_to_rgb (GimpHSL $hsl, GimpRGB $rgb) {
    gimp_hsl_to_rgb($hsl, $rgb);
  }

  method hsl_to_rgb_int (
    Int() $hue,
    Int() $saturation,
    Int() $lightness
  ) {
    my gint ($h, $s, $l) = ($hue, $saturation, $lightness);

    gimp_hsl_to_rgb_int($h, $s, $l);
    ($hue, $saturation, $lightness) = ($h, $s, $l);
  }

  method hsv_to_rgb (GimpHSV $hsv, GimpRGB $rgb) {
    gimp_hsv_to_rgb($hsv, $rgb);
  }

  method hsv_to_rgb4 (
    $rgb is rw,
    Num() $hue,
    Num() $saturation,
    Num() $value
  ) {
    my gdouble ($h, $s, $v) = ($hue, $saturation, $value);
    # Preallocate string
    $rgb = '    ';

    gimp_hsv_to_rgb4($rgb, $hue, $saturation, $value);
    $rgb.encode('ISO-8859-1');
  }

  method hsv_to_rgb_int (
    $hue        is rw,
    $saturation is rw,
    $value      is rw
  ) {
    my gint ($h, $s, $v) = ($hue, $saturation, $value);

    gimp_hsv_to_rgb_int($h, $s, $v);
    ($hue, $saturation, $value) = ($h, $s, $v);
  }

  method rgb_to_cmyk (GimpRGB $rgb, Num() $pullout, GimpCMYK $cmyk) {
    my gdouble $p = $pullout;

    gimp_rgb_to_cmyk($rgb, $pullout, $cmyk);
  }

  method rgb_to_cmyk_int (
    $red     is rw,
    $green   is rw,
    $blue    is rw,
    $pullout is rw
  ) {
    my gint ($r, $g, $b, $p) = ($red, $green, $blue, $pullout);

    gimp_rgb_to_cmyk_int($r, $g, $b, $p);
    ($red, $green, $blue, $pullout) = ($r, $g, $b, $p);
  }

  method rgb_to_hsl (GimpRGB $rgb, GimpHSL $hsl) {
    gimp_rgb_to_hsl($rgb, $hsl);
  }

  method rgb_to_hsl_int (
    $red   is rw,
    $green is rw,
    $blue  is rw
  ) {
    my gint ($r, $g, $b) = ($red, $green, $blue);

    gimp_rgb_to_hsl_int($r, $g, $b);
    ($red, $green, $blue) = ($r, $g, $b);
  }

  method rgb_to_hsv (GimpRGB $rgb, GimpHSV $hsv) {
    gimp_rgb_to_hsv($rgb, $hsv);
  }

  method rgb_to_hsv4 (
    $rgb is rw,
    Num() $hue,
    Num() $saturation,
    Num() $value
  ) {
    my gdouble ($h, $s, $v) = ($hue, $saturation, $value);
    # Preallocate string.
    $rgb = '    ';
    gimp_rgb_to_hsv4($rgb, $h, $s, $v);
    $rgb.encode('ISO-8859-1');
  }

  method rgb_to_hsv_int (
    $red   is rw,
    $green is rw,
    $blue  is rw
  ) {
    my gint ($r, $g, $b) = ($red, $green, $blue);

    gimp_rgb_to_hsv_int($r, $g, $b);
    ($red, $green, $blue) = ($r, $g, $b);
  }

  method rgb_to_l_int (
    Int() $red  ,
    Int() $green,
    Int() $blue
  ) {
    my gint ($r, $g, $b) = ($red, $green, $blue);

    gimp_rgb_to_l_int($r, $g, $b);
  }

}
