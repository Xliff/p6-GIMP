use v6;

use MONKEY-TYPING;

use NativeCall;

use GTK::Raw::Utils;

use GIMP::Raw::Types;
use GIMP::Raw::RGB;

use GLib::Value;
use GLib::Object::ParamSpec;

use GLib::Roles::StaticClass;

augment class GimpRGB {

  multi method add (GimpRGB $rgb2) {
    gimp_rgb_add(self, $rgb2);
  }
  multi method add (GimpRGB $rgba2, :$alpha is required) {
    gimp_rgba_add(self, $rgba2);
  }

  method clamp {
    gimp_rgb_clamp(self);
  }

  method composite (GimpRGB $color2, GimpRGBCompositeMode $mode) {
    my GimpRGBCompositeMode $m = $mode;

    gimp_rgb_composite(self, $color2, $m);
  }

  method distance (GimpRGB $rgb2) {
    gimp_rgb_distance(self, $rgb2);
  }

  method gamma (Num() $gamma) {
    my gdouble $g = $gamma;

    gimp_rgb_gamma(self, $g);
  }

  proto method get_pixel (|)
  { * }

  multi method get_pixel (Babl $format) {
    my $p = Pointer.new;
    $p = Pointer;

    samewith($format, $p);
  }
  multi method get_pixel (Babl $format, gpointer $pixel) {
    gimp_rgb_get_pixel(self, $format, $pixel);
    $pixel;
  }
  multi method get_pixel (
    Babl $format,
    :$alpha is required
  ) {
    samewith($format, $, :alpha);
  }
  multi method get_pixel (
    Babl $format,
    gpointer $pixel,
    :$alpha is required
  ) {
    gimp_rgba_get_pixel(self, $format, $pixel);
    $pixel;
  }

  method hex {
    my \f = '%02x';

    "#" ~ self.red.fmt(f)
        ~ self.green.fmt(f)
        ~ self.blue.fmt(f)
  }
  method hexa {
    my \f = '%02x';
    
    "#" ~ self.red.fmt(f)
        ~ self.green.fmt(f)
        ~ self.blue.fmt(f)
        ~ self.alpha.fmt(f);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_rgb_get_type, $n, $t );
  }

  proto method get_uchar (|)
  { * }

  multi method get_uchar {
    samewith($, $, $);
  }
  multi method get_uchar ($red is rw, $green is rw, $blue is rw) {
    my uint8 ($r, $g, $b) = 0 xx 3;

    gimp_rgb_get_uchar(self, $r, $g, $b);
    ($red, $green, $blue) = ($r, $g, $b);
  }
  multi method get_uchar (:$alpha is required) {
    samewith($, $, $, $);
  }
  multi method get_uchar (
    $red    is rw,
    $green  is rw,
    $blue   is rw,
    $α     is rw,
    :$alpha
  ) {
    my uint8 ($r, $g, $b, $a) = 0 xx 4;

    gimp_rgba_get_uchar(self, $r, $g, $b, $a);
    ($red, $green, $blue, $α) = ($r, $g, $b, $a);
  }

  multi method multiply (Num() $factor) {
    my gdouble $f = $factor;

    gimp_rgb_multiply(self, $factor);
  }
  multi method multiply (Num() $factor, :$alpha is required) {
    my gdouble $f = $factor;

    gimp_rgba_multiply(self, $factor);
  }

  proto method value_get (|)
  { * }

  multi method value_get (:$raw = False) {
    my $v = GValue.new(self.get_type);

    samewith($v, :$raw);
  }
  multi method value_get (GValue() $value, :$raw = False) {
    gimp_value_get_rgb($value, self);

    $raw ?? $value !! GLib::Value.new($value);
  }

  method value_set (GValue() $value) {
    gimp_value_set_rgb($value, self);
  }

  method intensity {
    gimp_rgb_intensity(self);
  }

  method intensity_uchar {
    gimp_rgb_intensity_uchar(self);
  }

  proto method list_names (|)
  { * }

  multi method list_names {
    samewith($, $);
  }
  multi method list_names ($names is rw, $colors is rw) {
    my $n = CArray[CArray[Str]];
    $n[0] = CArray[Str];

    my $c = CArray[Pointer[GimpRGB]];
    $c[0] = Pointer[GimpRGB];

    my $num = gimp_rgb_list_names($n, $c);

    # ($n, $c)».&gfree;
    my @colors = CStringArrayToArray($n[0], $num);
    my @rgbs = GTK::Compat::Roles::TypedBuffer.new($c[0]).Array;

    ($names, $colors) = (@colors, @rgbs);
  }

  method luminance {
    gimp_rgb_luminance(self);
  }

  method luminance_uchar {
    gimp_rgb_luminance_uchar(self);
  }

  method max {
    gimp_rgb_max(self);
  }

  method min {
    gimp_rgb_min(self);
  }

  proto method parse_css (|)
  { * }

  multi method parse_css (Str() $css, Int() $len = -1) {
    my gint $l = $len;

    so gimp_rgb_parse_css(self, $css, $l);
  }
  multi method parse_css (Str() $css, Int() $len = -1, :$alpha is required) {
    my gint $l = $len;

    so gimp_rgba_parse_css(self, $css, $l);
  }

  method parse_hex (Str() $hex, Int() $len = -1) {
    my gint $l = $len;

    gimp_rgb_parse_hex(self, $hex, $l);
  }

  method parse_name (Str() $name, Int() $len = -1) {
    my gint $l = $len;

    gimp_rgb_parse_name(self, $name, $l);
  }

  multi method set (Num() $red, Num() $green, Num() $blue) {
    my gdouble ($r, $g, $b) = ($red, $green, $blue);

    gimp_rgb_set(self, $r, $g, $b);
  }
  multi method set (
    Num() $red,
    Num() $green,
    Num() $blue,
    Num() $α,
    :$alpha
  ) {
    gimp_rgba_set(self, $red, $green, $blue, $α);
  }

  method set_alpha (Num() $alpha) {
    my gdouble $a = $alpha;

    gimp_rgb_set_alpha(self, $a);
  }

  proto method set_pixel (|)
  { * }

  multi method set_pixel (Babl $format) {
    samewith($format, $);
  }
  multi method set_pixel (Babl $format, gconstpointer $pixel) {
    gimp_rgb_set_pixel(self, $format, $pixel);
    $pixel;
  }
  multi method set_pixel (Babl $format, :$alpha is required) {
    samewith($format, $, :alpha);
  }
  multi method set_pixel (
    Babl $format,
    gconstpointer $pixel,
    :$alpha is required
  ) {
    gimp_rgba_set_pixel(self, $format, $pixel);
  }

  proto method set_uchar (|)
  { * }

  multi method set_uchar (Int() $red, Int() $green, Int() $blue) {
    my guint8 ($r, $g, $b) = ($red, $green, $blue);

    gimp_rgb_set_uchar(self, $r, $g, $b);
  }
  multi method set_uchar (
    Int() $red,
    Int() $green,
    Int() $blue,
    Int() $α,
    :$alpha
  ) {
    my guint8 ($r, $g, $b, $a) = ($red, $green, $blue, $α);

    gimp_rgba_set_uchar(self, $r, $g, $b, $a);
  }


  multi method subtract (GimpRGB $rgb2) {
    gimp_rgb_subtract(self, $rgb2);
  }
  multi method subtract (GimpRGB $rgba2, :$alpha is required) {
    gimp_rgba_subtract(self, $rgba2);
  }

}

class GIMP::RGB::Param {
  also does GLib::Roles::StaticClass;

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_param_rgb_get_type, $n, $t );
  }

  method spec (
    Str() $name,
    Str() $nick,
    Str() $blurb,
    Int() $has_alpha,
    GimpRGB $default_value,
    Int() $flags,
    :$raw = False
  ) {
    my gboolean $h = $has_alpha;
    my GParamFlags $f = $flags;

    my $ps = gimp_param_spec_rgb($name, $nick, $blurb, $h, $default_value, $f);

    $ps ??
      ( $raw ?? $ps !! GLib::Object::ParamSpec.new($ps) )
      !!
      Nil;
  }

  method rgb_has_alpha (GParamSpec() $pspec) {
    so gimp_param_spec_rgb_has_alpha($pspec);
  }

}
