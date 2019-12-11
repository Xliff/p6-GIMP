use v6;

use GIMP::Raw::Types;
use GIMP::Raw::RGB;

use MONKEY-TYPING;

augment class GimpRGB {
  
  method add (GimpRGB $rgb1, GimpRGB $rgb2) {
    gimp_rgb_add($rgb1, $rgb2);
  }

  method clamp (GimpRGB $rgb) {
    gimp_rgb_clamp($rgb);
  }

  method composite (GimpRGB $color1, GimpRGB $color2, GimpRGBCompositeMode $mode) {
    gimp_rgb_composite($color1, $color2, $mode);
  }

  method distance (GimpRGB $rgb1, GimpRGB $rgb2) {
    gimp_rgb_distance($rgb1, $rgb2);
  }

  method gamma (GimpRGB $rgb, gdouble $gamma) {
    gimp_rgb_gamma($rgb, $gamma);
  }

  method get_pixel (GimpRGB $rgb, Babl $format, gpointer $pixel) {
    gimp_rgb_get_pixel($rgb, $format, $pixel);
  }

  method get_type () {
    gimp_rgb_get_type();
  }

  method get_uchar (GimpRGB $rgb, Str $red, Str $green, Str $blue) {
    gimp_rgb_get_uchar($rgb, $red, $green, $blue);
  }

  method gimp_param_rgb_get_type () {
    gimp_param_rgb_get_type();
  }

  method gimp_param_spec_rgb (Str $name, Str $nick, Str $blurb, gboolean $has_alpha, GimpRGB $default_value, GParamFlags $flags) {
    gimp_param_spec_rgb($name, $nick, $blurb, $has_alpha, $default_value, $flags);
  }

  method gimp_param_spec_rgb_has_alpha (GParamSpec $pspec) {
    gimp_param_spec_rgb_has_alpha($pspec);
  }

  method gimp_rgba_add (GimpRGB $rgba1, GimpRGB $rgba2) {
    gimp_rgba_add($rgba1, $rgba2);
  }

  method gimp_rgba_get_pixel (GimpRGB $rgba, Babl $format, gpointer $pixel) {
    gimp_rgba_get_pixel($rgba, $format, $pixel);
  }

  method gimp_rgba_get_uchar (GimpRGB $rgba, Str $red, Str $green, Str $blue, Str $alpha) {
    gimp_rgba_get_uchar($rgba, $red, $green, $blue, $alpha);
  }

  method gimp_rgba_multiply (GimpRGB $rgba, gdouble $factor) {
    gimp_rgba_multiply($rgba, $factor);
  }

  method gimp_rgba_parse_css (GimpRGB $rgba, Str $css, gint $len) {
    gimp_rgba_parse_css($rgba, $css, $len);
  }

  method gimp_rgba_set (GimpRGB $rgba, gdouble $red, gdouble $green, gdouble $blue, gdouble $alpha) {
    gimp_rgba_set($rgba, $red, $green, $blue, $alpha);
  }

  method gimp_rgba_set_pixel (GimpRGB $rgba, Babl $format, gconstpointer $pixel) {
    gimp_rgba_set_pixel($rgba, $format, $pixel);
  }

  method gimp_rgba_set_uchar (GimpRGB $rgba, Str $red, Str $green, Str $blue, Str $alpha) {
    gimp_rgba_set_uchar($rgba, $red, $green, $blue, $alpha);
  }

  method gimp_rgba_subtract (GimpRGB $rgba1, GimpRGB $rgba2) {
    gimp_rgba_subtract($rgba1, $rgba2);
  }

  method gimp_value_get_rgb (GValue $value, GimpRGB $rgb) {
    gimp_value_get_rgb($value, $rgb);
  }

  method gimp_value_set_rgb (GValue $value, GimpRGB $rgb) {
    gimp_value_set_rgb($value, $rgb);
  }

  method intensity (GimpRGB $rgb) {
    gimp_rgb_intensity($rgb);
  }

  method intensity_uchar (GimpRGB $rgb) {
    gimp_rgb_intensity_uchar($rgb);
  }

  method list_names (Str $names, GimpRGB $colors) {
    gimp_rgb_list_names($names, $colors);
  }

  method luminance (GimpRGB $rgb) {
    gimp_rgb_luminance($rgb);
  }

  method luminance_uchar (GimpRGB $rgb) {
    gimp_rgb_luminance_uchar($rgb);
  }

  method max (GimpRGB $rgb) {
    gimp_rgb_max($rgb);
  }

  method min (GimpRGB $rgb) {
    gimp_rgb_min($rgb);
  }

  method multiply (GimpRGB $rgb1, gdouble $factor) {
    gimp_rgb_multiply($rgb1, $factor);
  }

  method parse_css (GimpRGB $rgb, Str $css, gint $len) {
    gimp_rgb_parse_css($rgb, $css, $len);
  }

  method parse_hex (GimpRGB $rgb, Str $hex, gint $len) {
    gimp_rgb_parse_hex($rgb, $hex, $len);
  }

  method parse_name (GimpRGB $rgb, Str $name, gint $len) {
    gimp_rgb_parse_name($rgb, $name, $len);
  }

  method set (GimpRGB $rgb, gdouble $red, gdouble $green, gdouble $blue) {
    gimp_rgb_set($rgb, $red, $green, $blue);
  }

  method set_alpha (GimpRGB $rgb, gdouble $alpha) {
    gimp_rgb_set_alpha($rgb, $alpha);
  }

  method set_pixel (GimpRGB $rgb, Babl $format, gconstpointer $pixel) {
    gimp_rgb_set_pixel($rgb, $format, $pixel);
  }

  method set_uchar (GimpRGB $rgb, Str $red, Str $green, Str $blue) {
    gimp_rgb_set_uchar($rgb, $red, $green, $blue);
  }

  method subtract (GimpRGB $rgb1, GimpRGB $rgb2) {
    gimp_rgb_subtract($rgb1, $rgb2);
  }

}
