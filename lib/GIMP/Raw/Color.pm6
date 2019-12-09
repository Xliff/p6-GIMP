use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::Raw::Color;

### /usr/include/gimp-2.0/libgimpcolor/gimpcolorspace.h

sub gimp_cmyk_to_rgb (GimpCMYK $cmyk, GimpRGB $rgb)
  is native(gimpcolor)
  is export
{ * }

sub gimp_cmyk_to_rgb_int (
  gint $cyan    is rw, 
  gint $magenta is rw,
  gint $yellow  is rw,
  gint $black
)
  is native(gimpcolor)
  is export
{ * }

sub gimp_hsl_to_rgb (GimpHSL $hsl, GimpRGB $rgb)
  is native(gimpcolor)
  is export
{ * }

sub gimp_hsl_to_rgb_int (
  gint $hue        is rw,
  gint $saturation is rw,
  gint $lightness  is rw
)
  is native(gimpcolor)
  is export
{ * }

sub gimp_hsv_to_rgb (GimpHSV $hsv, GimpRGB $rgb)
  is native(gimpcolor)
  is export
{ * }

sub gimp_hsv_to_rgb4 (
  Str $rgb,
  gdouble $hue,
  gdouble $saturation,
  gdouble $value
)
  is native(gimpcolor)
  is export
{ * }

sub gimp_hsv_to_rgb_int (
  gint $hue        is rw,
  gint $saturation is rw,
  gint $value      is rw
)
  is native(gimpcolor)
  is export
{ * }

sub gimp_rgb_to_cmyk (GimpRGB $rgb, gdouble $pullout, GimpCMYK $cmyk)
  is native(gimpcolor)
  is export
{ * }

sub gimp_rgb_to_cmyk_int (
  gint $red     is rw,
  gint $green   is rw,
  gint $blue    is rw,
  gint $pullout is rw
)
  is native(gimpcolor)
  is export
{ * }

sub gimp_rgb_to_hsl (GimpRGB $rgb, GimpHSL $hsl)
  is native(gimpcolor)
  is export
{ * }

sub gimp_rgb_to_hsl_int (
  gint $red   is rw,
  gint $green is rw,
  gint $blue  is rw
)
  is native(gimpcolor)
  is export
{ * }

sub gimp_rgb_to_hsv (GimpRGB $rgb, GimpHSV $hsv)
  is native(gimpcolor)
  is export
{ * }

sub gimp_rgb_to_hsv4 (
  Str $rgb,
  gdouble $hue,
  gdouble $saturation,
  gdouble $value
)
  is native(gimpcolor)
  is export
{ * }

sub gimp_rgb_to_hsv_int (
  gint $red,
  gint $green,
  gint $blue
)
  is native(gimpcolor)
  is export
{ * }

sub gimp_rgb_to_l_int (
  gint $red,
  gint $green,
  gint $blue
)
  returns gint
  is native(gimpcolor)
  is export
{ * }
