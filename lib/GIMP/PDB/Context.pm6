use v6;

use NativeCall;

use GTK::Raw::Utils;

use GIMP::Raw::Types;
use GIMP::PDB::Raw::Context;

use GLib::Roles::StaticClass;

class GIMP::PDB::Context {
  also does GLib::Roles::StaticClass;

  method antialias is rw {
    Proxy.new:
      FETCH => -> $     { self.get_antialias },
      STORE => -> $, \a { self.set_antialias(a) };
  }

  method background is rw {
    Proxy.new:
      FETCH => -> $             { my $b = self.get_background; $b[1] },
      STORE => -> $, GimpRGB \b { self.set_background(b) };
  }

  method brush is rw {
    Proxy.new:
      FETCH => -> $           { self.get_brush },
      STORE => -> $, Str() \b { self.set_brush(b) };
  }

  method get_antialias {
    so gimp_context_get_antialias();
  }

  proto method get_background (|)
  { * }

  multi method get_backgound (:$all = True) {
    samewith($, :$all);
  }
  method get_background ($background is rw, :$all = False) {
    my $b = GimpRGB.new;
    my $rv = so gimp_context_get_background($b);

    $all.not $rv ?? ($rv, $rv ?? $background = $b !! Nil);
  }

  method get_brush {
    gimp_context_get_brush();
  }

  method get_brush_angle {
    gimp_context_get_brush_angle();
  }

  method get_brush_aspect_ratio {
    gimp_context_get_brush_aspect_ratio();
  }

  method get_brush_force {
    gimp_context_get_brush_force();
  }

  method get_brush_hardness {
    gimp_context_get_brush_hardness();
  }

  method get_brush_size {
    gimp_context_get_brush_size();
  }

  method get_brush_spacing {
    gimp_context_get_brush_spacing();
  }

  method get_diagonal_neighbors {
    gimp_context_get_diagonal_neighbors();
  }

  method get_distance_metric {
    gimp_context_get_distance_metric();
  }

  method get_dynamics {
    gimp_context_get_dynamics();
  }

  method get_feather {
    gimp_context_get_feather();
  }

  proto method get_feather_radius (|)
  { * }

  multi method get_feather_radius (:$all = True) {
    samewith($, $, :$all);
  }
  multi method get_feather_radius (
    $feather_radius_x is rw,
    $feather_radius_y is rw,
    :$all = False
  ) {
    my gdouble ($rx, $ty) = 0e0 xx 2;
    my $rv = gimp_context_get_feather_radius($rx, $ry);

    ($feather_radius_x, $feather_radius_y) = ($rx, $ry);
    $all.not ?? $rv !! ($rv, $feather_radius_x, $feather_radius_y);
  }

  method get_font {
    gimp_context_get_font();
  }

  proto method get_foreground (|)
  { * }

  multi method get_foreground (:$all = True) {
    samewith($, :$all);
  }
  multi method get_foreground ($foreground is rw) {
    my $f = GimpRGB.new;
    my $rv = gimp_context_get_foreground($f);

    $all.not ?? $rv !! ($rv, $rv ?? $foreground = $f !! Nil)
  }

  method get_gradient {
    gimp_context_get_gradient();
  }

  method get_gradient_blend_color_space {
    gimp_context_get_gradient_blend_color_space();
  }

  method get_gradient_repeat_mode {
    gimp_context_get_gradient_repeat_mode();
  }

  method get_gradient_reverse {
    gimp_context_get_gradient_reverse();
  }

  method get_ink_angle {
    gimp_context_get_ink_angle();
  }

  method get_ink_blob_angle {
    gimp_context_get_ink_blob_angle();
  }

  method get_ink_blob_aspect_ratio {
    gimp_context_get_ink_blob_aspect_ratio();
  }

  method get_ink_blob_type {
    gimp_context_get_ink_blob_type();
  }

  method get_ink_size {
    gimp_context_get_ink_size();
  }

  method get_ink_size_sensitivity {
    gimp_context_get_ink_size_sensitivity();
  }

  method get_ink_speed_sensitivity {
    gimp_context_get_ink_speed_sensitivity();
  }

  method get_ink_tilt_sensitivity {
    gimp_context_get_ink_tilt_sensitivity();
  }

  method get_interpolation {
    gimp_context_get_interpolation();
  }

  method get_line_cap_style {
    gimp_context_get_line_cap_style();
  }

  method get_line_dash_offset {
    gimp_context_get_line_dash_offset();
  }

  proto method get_line_dash_pattern (|)
  { * }

  multi method get_line_dash_pattern (:$all = True) {
    samewith($, $, :$all)
  }
  method get_line_dash_pattern (
    $num_dashes is rw,
    $dashes is rw,
    :$all = False
  ) {
    my gint $n = 0;
    my $da = CArray[CArray[gdouble]].new;
    $da[0] = CArray[gdouble];

    my $rv = gimp_context_get_line_dash_pattern($n, $da);
    $all.not ?? $rv !! ($rv, $rv ?? CArrayToArray($da[0], $n) !! Nil);
  }

  method get_line_join_style {
    gimp_context_get_line_join_style();
  }

  method get_line_miter_limit {
    gimp_context_get_line_miter_limit();
  }

  method get_line_width {
    gimp_context_get_line_width();
  }

  method get_line_width_unit {
    gimp_context_get_line_width_unit();
  }

  method get_mypaint_brush {
    gimp_context_get_mypaint_brush();
  }

  method get_opacity {
    gimp_context_get_opacity();
  }

  method get_paint_method {
    gimp_context_get_paint_method();
  }

  method get_paint_mode {
    gimp_context_get_paint_mode();
  }

  method get_palette {
    gimp_context_get_palette();
  }

  method get_pattern {
    gimp_context_get_pattern();
  }

  method get_sample_criterion {
    gimp_context_get_sample_criterion();
  }

  method get_sample_merged {
    gimp_context_get_sample_merged();
  }

  method get_sample_threshold {
    gimp_context_get_sample_threshold();
  }

  method get_sample_threshold_int {
    gimp_context_get_sample_threshold_int();
  }

  method get_sample_transparent {
    gimp_context_get_sample_transparent();
  }

  method get_stroke_method {
    gimp_context_get_stroke_method();
  }

  method get_transform_direction {
    gimp_context_get_transform_direction();
  }

  method get_transform_recursion {
    gimp_context_get_transform_recursion();
  }

  method get_transform_resize {
    gimp_context_get_transform_resize();
  }

  proto method list_paint_methods (|)
  { * }

  multi method list_paint_methods (:$all = True) {
    samewith($, $, :$all);
  }
  multi method list_paint_methods (
    $num_paint_methods is rw,
    $paint_methods is rw,
    :$all = False
  ) {
    my gint $n = 0;
    my $ma = CArray[CArray[Str].new;
    $ma[0] = CArray[Str];

    my $rv = gimp_context_list_paint_methods($n, $ma);
    $all.not ?? $rv !! ($rv ?? CStringArrayToArray($ma, $n) !! Nil)
  }

  method pop {
    so gimp_context_pop();
  }

  method push {
    so gimp_context_push();
  }

  method set_antialias (Int() $antialias) {
    my gboolean $a = (so $antialias).Int;

    gimp_context_set_antialias($a);
  }

  method set_background (GimpRGB $background) {
    gimp_context_set_background($background);
  }

  method set_brush (Str() $name) {
    gimp_context_set_brush($name);
  }

  method set_brush_angle (Num() $angle) {
    my gdouble $a = $angle;

    gimp_context_set_brush_angle($angle);
  }

  method set_brush_aspect_ratio (Num() $aspect) {
    my gdouble $a = $aspect;

    gimp_context_set_brush_aspect_ratio($a);
  }

  method set_brush_default_hardness {
    gimp_context_set_brush_default_hardness();
  }

  method set_brush_default_size {
    gimp_context_set_brush_default_size();
  }

  method set_brush_default_spacing {
    gimp_context_set_brush_default_spacing();
  }

  method set_brush_force (Num() $force) {
    my gdouble $f = $force;

    gimp_context_set_brush_force($f);
  }

  method set_brush_hardness (Num() $hardness) {
    my gdouble $h = $hardness;

    gimp_context_set_brush_hardness($hardness);
  }

  method set_brush_size (Num() $size) {
    my gdouble $s = $size;

    gimp_context_set_brush_size($s);
  }

  method set_brush_spacing (Num() $spacing) {
    my gdouble $s = $spacing;

    gimp_context_set_brush_spacing($s);
  }

  method set_default_colors {
    gimp_context_set_default_colors();
  }

  method set_defaults {
    gimp_context_set_defaults();
  }

  method set_diagonal_neighbors (Num() $diagonal_neighbors) {
    my gboolean $d = $diagonal_neighbors;

    gimp_context_set_diagonal_neighbors($d);
  }

  method set_distance_metric (GeglDistanceMetric $metric) {
    gimp_context_set_distance_metric($metric);
  }

  method set_dynamics (Str() $name) {
    gimp_context_set_dynamics($name);
  }

  method set_feather (gboolean $feather) {
    gimp_context_set_feather($feather);
  }

  method set_feather_radius (gdouble $feather_radius_x, gdouble $feather_radius_y) {
    gimp_context_set_feather_radius($feather_radius_x, $feather_radius_y);
  }

  method set_font (Str $name) {
    gimp_context_set_font($name);
  }

  method set_foreground (GimpRGB $foreground) {
    gimp_context_set_foreground($foreground);
  }

  method set_gradient (Str $name) {
    gimp_context_set_gradient($name);
  }

  method set_gradient_blend_color_space (GimpGradientBlendColorSpace $blend_color_space) {
    gimp_context_set_gradient_blend_color_space($blend_color_space);
  }

  method set_gradient_fg_bg_hsv_ccw {
    gimp_context_set_gradient_fg_bg_hsv_ccw();
  }

  method set_gradient_fg_bg_hsv_cw {
    gimp_context_set_gradient_fg_bg_hsv_cw();
  }

  method set_gradient_fg_bg_rgb {
    gimp_context_set_gradient_fg_bg_rgb();
  }

  method set_gradient_fg_transparent {
    gimp_context_set_gradient_fg_transparent();
  }

  method set_gradient_repeat_mode (GimpRepeatMode $repeat_mode) {
    gimp_context_set_gradient_repeat_mode($repeat_mode);
  }

  method set_gradient_reverse (gboolean $reverse) {
    gimp_context_set_gradient_reverse($reverse);
  }

  method set_ink_angle (gdouble $angle) {
    gimp_context_set_ink_angle($angle);
  }

  method set_ink_blob_angle (gdouble $angle) {
    gimp_context_set_ink_blob_angle($angle);
  }

  method set_ink_blob_aspect_ratio (gdouble $aspect) {
    gimp_context_set_ink_blob_aspect_ratio($aspect);
  }

  method set_ink_blob_type (GimpInkBlobType $type) {
    gimp_context_set_ink_blob_type($type);
  }

  method set_ink_size (gdouble $size) {
    gimp_context_set_ink_size($size);
  }

  method set_ink_size_sensitivity (gdouble $size) {
    gimp_context_set_ink_size_sensitivity($size);
  }

  method set_ink_speed_sensitivity (gdouble $speed) {
    gimp_context_set_ink_speed_sensitivity($speed);
  }

  method set_ink_tilt_sensitivity (gdouble $tilt) {
    gimp_context_set_ink_tilt_sensitivity($tilt);
  }

  method set_interpolation (GimpInterpolationType $interpolation) {
    gimp_context_set_interpolation($interpolation);
  }

  method set_line_cap_style (GimpCapStyle $cap_style) {
    gimp_context_set_line_cap_style($cap_style);
  }

  method set_line_dash_offset (gdouble $dash_offset) {
    gimp_context_set_line_dash_offset($dash_offset);
  }

  method set_line_dash_pattern (gint $num_dashes, gdouble $dashes is rw) {
    gimp_context_set_line_dash_pattern($num_dashes, $dashes is rw);
  }

  method set_line_join_style (GimpJoinStyle $join_style) {
    gimp_context_set_line_join_style($join_style);
  }

  method set_line_miter_limit (gdouble $miter_limit) {
    gimp_context_set_line_miter_limit($miter_limit);
  }

  method set_line_width (gdouble $line_width) {
    gimp_context_set_line_width($line_width);
  }

  method set_line_width_unit (GimpUnit $line_width_unit) {
    gimp_context_set_line_width_unit($line_width_unit);
  }

  method set_mypaint_brush (Str $name) {
    gimp_context_set_mypaint_brush($name);
  }

  method set_opacity (gdouble $opacity) {
    gimp_context_set_opacity($opacity);
  }

  method set_paint_method (Str() $name) {
    gimp_context_set_paint_method($name);
  }

  method set_paint_mode (GimpLayerMode $paint_mode) {
    gimp_context_set_paint_mode($paint_mode);
  }

  method set_palette (Str() $name) {
    gimp_context_set_palette($name);
  }

  method set_pattern (Str() $name) {
    gimp_context_set_pattern($name);
  }

  method set_sample_criterion (GimpSelectCriterion $sample_criterion) {
    gimp_context_set_sample_criterion($sample_criterion);
  }

  method set_sample_merged (gboolean $sample_merged) {
    gimp_context_set_sample_merged($sample_merged);
  }

  method set_sample_threshold (gdouble $sample_threshold) {
    gimp_context_set_sample_threshold($sample_threshold);
  }

  method set_sample_threshold_int (gint $sample_threshold) {
    gimp_context_set_sample_threshold_int($sample_threshold);
  }

  method set_sample_transparent (gboolean $sample_transparent) {
    gimp_context_set_sample_transparent($sample_transparent);
  }

  method set_stroke_method (GimpStrokeMethod $stroke_method) {
    gimp_context_set_stroke_method($stroke_method);
  }

  method set_transform_direction (GimpTransformDirection $transform_direction) {
    gimp_context_set_transform_direction($transform_direction);
  }

  method set_transform_recursion (gint $transform_recursion) {
    gimp_context_set_transform_recursion($transform_recursion);
  }

  method set_transform_resize (GimpTransformResize $transform_resize) {
    gimp_context_set_transform_resize($transform_resize);
  }

  method swap_colors {
    gimp_context_swap_colors();
  }

}
