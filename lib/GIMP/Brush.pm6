use v6;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

use GIMP::Raw::Brush;

use GLib::Roles::StaticClass;

class GIMP::Brush {
  also does GLib::Roles::StaticClass;

  method new (Str() $name) {
    gimp_brush_new($name);
  }

  method delete (Str() $name) {
    gimp_brush_delete($name);
  }

  method duplicate (Str() $name) {
    gimp_brush_duplicate($name);
  }

  method get_angle (Str() $name) {
    gimp_brush_get_angle($name);
  }

  method get_aspect_ratio (Str() $name) {
    gimp_brush_get_aspect_ratio($name);
  }

  method get_hardness (Str() $name) {
    gimp_brush_get_hardness($name);
  }

  method get_info (
    Str() $name,
    Int() $width,
    Int() $height,
    Int() $mask_bpp,
    Int() $color_bpp
  ) {
    my gint ($w, $h, $m, $c) = ($width, $height, $mask_bpp, $color_bpp);

    gimp_brush_get_info($name, $w, $h, $m, $c);
  }

  method get_pixels (
    Str() $name,
    Int() $width,
    Int() $height,
    Int() $mask_bpp,
    Int() $num_mask_bytes,
    Int() $mask_bytes,
    Int() $color_bpp,
    Int() $num_color_bytes,
    Int() $color_bytes
  ) {
    my guint8 ($cbp, $cbt) = ($color_bpp, $color_bytes);
    my guint ($w, $h, $m, $n, $mb, $nc) = (
      $width,
      $height,
      $mask_bpp,
      $num_mask_bytes,
      $mask_bytes,
      $num_color_bytes
    );

    gimp_brush_get_pixels($name, $w, $h, $m, $n, $mb, $cbp, $nc, $cbt);
  }

  method get_radius (Str() $name) {
    gimp_brush_get_radius($name);
  }

  method get_shape (Str() $name) {
    gimp_brush_get_shape($name);
  }

  method get_spacing (Str() $name, Int() $spacing) {
    my gint $s = $spacing;

    gimp_brush_get_spacing($name, $s);
  }

  method get_spikes (Str() $name) {
    gimp_brush_get_spikes($name);
  }

  method rename (Str() $name, Str() $new_name) {
    gimp_brush_rename($name, $new_name);
  }

  method set_spacing (Str() $name, Int() $spacing) {
    my gint $s = $spacing;

    gimp_brush_set_spacing($name, $spacing);
  }

}
