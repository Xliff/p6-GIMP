use v6;

use NativeCall;

use GTK::Raw::Utils;

use GIMP::Raw::Types;
use GIMP::PDB::Raw::Context;

use GLib::Roles::StaticClass;

constant Context is export := GIMP::PDB::Context;

class GIMP::PDB::Context {
  also does GLib::Roles::StaticClass;

  method antialias is rw {
    Proxy.new:
      FETCH => -> $             { self.get_antialias },
      STORE => -> $, \a         { self.set_antialias(a) };
  }

  method background is rw {
    Proxy.new:
      FETCH => -> $             { my $b = self.get_background; $b[1] },
      STORE => -> $, GimpRGB \b { self.set_background(b) };
  }

  method brush is rw {
    Proxy.new:
      FETCH => -> $             { self.get_brush },
      STORE => -> $, Str() \b   { self.set_brush(b) };
  }

  method brush_angle is rw {
    Proxy.new:
      FETCH => -> $             { self.get_brush_angle },
      STORE => -> $, Num() \a   { self.set_brush_angle (a) };
  }

  method brush_aspect_ratio is rw {
    Proxy.new:
      FETCH => -> $             { self.get_brush_aspect_ratio },
      STORE => -> $, Num() \a   { self.set_brush_aspect_ratio(a) };
  }

  method brush_force is rw {
    Proxy.new:
      FETCH => -> $             { self.get_brush_force },
      STORE => -> $, Num() \f   { self.set_brush_force(f) };
  }

  method brush_hardness is rw {
    Proxy.new:
      FETCH => -> $             { self.get_brush_hardness },
      STORE => -> $, Num() \h   { self.set_brush_hardness(h) };
  }

  method brush_size is rw {
    Proxy.new:
      FETCH => -> $             { self.get_brush_size },
      STORE => -> $, Num() \s   { self.set_brush_size(s) };
  }

  method brush_spacing is rw {
    Proxy.new:
      FETCH => -> $             { self.get_brush_spacing },
      STORE => -> $, Num() \s   { self.set_brush_spacing(s) };
  }

  method diagonal_neighbors is rw {
    Proxy.new:
      FETCH => -> $             { self.get_diagonal_neighbors },
      STORE => -> $, Int() \d   { self.set_diagonal_neighbors(d) };
  }

  method distance_metric is rw {
    Proxy.new:
      FETCH => -> $             { self.get_distance_metric },
      STORE => -> $, Int() \d   { self.set_distance_metric(b) };
  }

  method dynamics is rw {
    Proxy.new:
      FETCH => -> $             { self.get_dynamics },
      STORE => -> $, Str() \d   { self.set_dynamics(d) };
  }

  method feather is rw {
    Proxy.new:
      FETCH => -> $             { self.get_feather },
      STORE => -> $, Int() \f   { self.set_feather(f) };
  }

  method feather_radius is rw {
    Proxy.new:
      FETCH => -> $             { self.get_feather_radius },
      STORE => -> $, Num() \r   { self.set_feather_radius(d) };
  }

  method font is rw {
    Proxy.new:
      FETCH => -> $             { self.get_font },
      STORE => -> $, Str() \f   { self.set_font(f) };
  }

  method foreground is rw {
    Proxy.new:
      FETCH => -> $             { self.get_foreground },
      STORE => -> $, GimpRGB \f { self.set_foreground(f) };
  }

  method gradient is rw {
    Proxy.new:
      FETCH => -> $             { self.get_gradient },
      STORE => -> $, Str() \g   { self.set_gradient(g) };
  }

  method gradient_blend_color_space is rw {
    Proxy.new:
      FETCH => -> $             { self.get_gradient_blend_color_space },
      STORE => -> $, Int() \c   { self.set_gradient_blend_color_space(c) };
  }

  method gradient_repeat_mode is rw {
    Proxy.new:
      FETCH => -> $             { self.get_repeat_mode },
      STORE => -> $, Int() \r   { self.set_repeat_mode(r) };
  }

  method gradient_reverse is rw {
    Proxy.new:
      FETCH => -> $             { self.get_gradient_repeat },
      STORE => -> $, Int() \r   { self.set_gradient_repeat(r) };
  }

  method ink_angle is rw {
    Proxy.new:
      FETCH => -> $             { self.get_ink_angle },
      STORE => -> $, Num() \a   { self.set_ink_angle(a) };
  }

  method ink_blob_angle is rw {
    Proxy.new:
      FETCH => -> $             { self.get_ink_blob_angle },
      STORE => -> $, Num() \a   { self.set_ink_blob_angle(a) };
  }

  method ink_blob_aspect_ratio is rw {
    Proxy.new:
      FETCH => -> $             { self.get_ink_blob_aspect_ratio },
      STORE => -> $, Num() \a   { self.set_ink_blob_aspect_ratio(a) };
  }

  method ink_blob_type is rw {
    Proxy.new:
      FETCH => -> $             { self.get_ink_blob_type },
      STORE => -> $, Int() \t   { self.set_ink_blob_type(f) };
  }

  method ink_size is rw {
    Proxy.new:
      FETCH => -> $             { self.get_ink_size },
      STORE => -> $, Num() \s   { self.set_ink_size(s) };
  }

  method ink_size_sensitivity is rw {
    Proxy.new:
      FETCH => -> $             { self.get_ink_size_sensitivity },
      STORE => -> $, Num() \s   { self.set_ink_size_sensitivity(s) };
  }

  method ink_speed_sensitivity is rw {
    Proxy.new:
      FETCH => -> $             { self.get_ink_speed_sensitivity },
      STORE => -> $, Num() \s   { self.set_ink_speed_sensitivity(s) };
  }

  method ink_tilt_sensitivity is rw {
    Proxy.new:
      FETCH => -> $             { self.get_ink_tilt_sensitivity },
      STORE => -> $, Num() \s   { self.set_ink_tilt_sensitivity(s) };
  }

  method interpolation is rw {
    Proxy.new:
      FETCH => -> $             { self.get_interpolation },
      STORE => -> $, Int() \i   { self.set_interpolation(i) };
  }

  method line_cap_style is rw {
  }

  method line_dash_offset is rw {
  }

  method line_dash_pattern is rw {
  }

  method line_dash_pattern is rw {
  }

  method line_dash_pattern is rw {
  }

  method line_join_style is rw {
  }

  method line_miter_limit is rw {
  }

  method line_width is rw {
  }

  method line_width_unit is rw {
  }

  method mypaint_brush is rw {
  }

  method opacity is rw {
  }

  method paint_method is rw {
  }

  method paint_mode is rw {
  }

  method palette is rw {
  }

  method pattern is rw {
  }

  method sample_criterion is rw {
  }

  method sample_merged is rw {
  }

  method sample_threshold is rw {
  }

  method sample_threshold_int is rw {
  }

  method sample_transparent is rw {
  }

  method stroke_method is rw {
  }

  method transform_direction is rw {
  }

  method transform_recursion is rw {
  }

  method transform_resize is rw {
  }

  method get_antialias {
    so gimp_context_get_antialias();
  }

  proto method get_background (|)
  { * }

  multi method get_background (:$all = True) {
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
    GeglDistanceMetric( gimp_context_get_distance_metric() )
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
    GimpGradientBlendColorSpaceEnum(
      gimp_context_get_gradient_blend_color_space()
    );
  }

  method get_gradient_repeat_mode {
    GimpRepeatModeEnum( gimp_context_get_gradient_repeat_mode() );
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
    GimpInkBlobTypeEnum( gimp_context_get_ink_blob_type() );
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
    GimpInterpolationTypeEnum( gimp_context_get_interpolation() );
  }

  method get_line_cap_style {
    GimpCapStyleEnum( gimp_context_get_line_cap_style() );
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
    GimpJoinStyleEnum( gimp_context_get_line_join_style() );
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
    GimpLayerModeEnum( gimp_context_get_paint_mode() );
  }

  method get_palette {
    gimp_context_get_palette();
  }

  method get_pattern {
    gimp_context_get_pattern();
  }

  method get_sample_criterion {
    GimpSelectCriterionEnum( gimp_context_get_sample_criterion() );
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
    GimpStrokeMethod( gimp_context_get_stroke_method() );
  }

  method get_transform_direction {
    GimpTransformDirectionEnum( gimp_context_get_transform_direction() );
  }

  method get_transform_recursion {
    gimp_context_get_transform_recursion();
  }

  method get_transform_resize {
    GimpTransformResizeEnum( gimp_context_get_transform_resize() );
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

  method set_distance_metric (Int() $metric) {
    my GeglDistanceMetric $m = $metric;

    gimp_context_set_distance_metric($metric);
  }

  method set_dynamics (Str() $name) {
    gimp_context_set_dynamics($name);
  }

  method set_feather (Int() $feather) {
    my gboolean $f = $feather;

    gimp_context_set_feather($f);
  }

  method set_feather_radius (
    Num() $feather_radius_x,
    Num() $feather_radius_y
  ) {
    my gdouble ($fx, $fy) = ($feather_radius_x, $feather_radius_y);

    so gimp_context_set_feather_radius($fx, $fy);
  }

  method set_font (Str() $name) {
    so gimp_context_set_font($name);
  }

  method set_foreground (GimpRGB $foreground) {
    so gimp_context_set_foreground($foreground);
  }

  method set_gradient (Str() $name) {
    so gimp_context_set_gradient($name);
  }

  method set_gradient_blend_color_space (Int() $blend_color_space) {
    my GimpGradientBlendColorSpace $b = $blend_color_space;

    so gimp_context_set_gradient_blend_color_space($b);
  }

  method set_gradient_fg_bg_hsv_ccw {
    so gimp_context_set_gradient_fg_bg_hsv_ccw();
  }

  method set_gradient_fg_bg_hsv_cw {
    so gimp_context_set_gradient_fg_bg_hsv_cw();
  }

  method set_gradient_fg_bg_rgb {
    so gimp_context_set_gradient_fg_bg_rgb();
  }

  method set_gradient_fg_transparent {
    so gimp_context_set_gradient_fg_transparent();
  }

  method set_gradient_repeat_mode (Int() $repeat_mode) {
    my GimpRepeatMode $r = $repeat_mode;

    so gimp_context_set_gradient_repeat_mode($r);
  }

  method set_gradient_reverse (Int() $reverse) {
    my gboolean $r = (so $reverse).Int;

    gimp_context_set_gradient_reverse($r);
  }

  method set_ink_angle (Num() $angle) {
    my gdouble $a = $angle;

    so gimp_context_set_ink_angle($a);
  }

  method set_ink_blob_angle (Num() $angle) {
    my gdouble $a = $angle;

    so gimp_context_set_ink_blob_angle($angle);
  }

  method set_ink_blob_aspect_ratio (Num() $aspect) {
    my gdouble $a = $aspect;

    so gimp_context_set_ink_blob_aspect_ratio($aspect);
  }

  method set_ink_blob_type (Int() $type) {
    my GimpInkBlobType $t = $type;

    so gimp_context_set_ink_blob_type($t);
  }

  method set_ink_size (Num() $size) {
    my gdouble $s = $size;

    so gimp_context_set_ink_size($s);
  }

  method set_ink_size_sensitivity (Num() $size) {
    my gdouble $s = $size;

    so gimp_context_set_ink_size_sensitivity($s);
  }

  method set_ink_speed_sensitivity (Num() $speed) {
    my gdouble $s = $speed;

    so gimp_context_set_ink_speed_sensitivity($s);
  }

  method set_ink_tilt_sensitivity (Num() $tilt) {
    so gimp_context_set_ink_tilt_sensitivity($tilt);
  }

  method set_interpolation (Int() $interpolation) {
    my GimpInterpolationType $i = $interpolation;

    so gimp_context_set_interpolation($i);
  }

  method set_line_cap_style (Int() $cap_style) {
    my GimpCapStyle $c = $cap_style;

    gimp_context_set_line_cap_style($c);
  }

  method set_line_dash_offset (gdouble $dash_offset) {
    my gdouble $d = $dash_offset;

    so gimp_context_set_line_dash_offset($d);
  }

  proto method set_line_dash_pattern (|)
  { * }

  multi method set_line_dash_pattern (@dashes) {
    my $da = CArray[gdouble].new;
    samewith( @dashes.elems, ArrayToCArray(gdouble, @dashes) );
  }
  multi method set_line_dash_pattern (
    $num_dashes,
    CArray[gdouble] $dashes
  ) {
    so gimp_context_set_line_dash_pattern($num_dashes, $dashes);
  }

  method set_line_join_style (Int() $join_style) {
    my GimpJoinStyle $j = $join_style;

    so gimp_context_set_line_join_style($j);
  }

  method set_line_miter_limit (Num() $miter_limit) {
    my gdouble $m = $miter_limit;

    so gimp_context_set_line_miter_limit($m);
  }

  method set_line_width (gdouble $line_width) {
    my gdouble $l = $line_width;

    so gimp_context_set_line_width($l);
  }

  method set_line_width_unit (Int() $line_width_unit) {
    my GimpUnit $l = $line_width_unit;

    gimp_context_set_line_width_unit($l);
  }

  method set_mypaint_brush (Str() $name) {
    gimp_context_set_mypaint_brush($name);
  }

  method set_opacity (Num() $opacity) {
    my gdouble $o = $opacity;

    gimp_context_set_opacity($opacity);
  }

  method set_paint_method (Str() $name) {
    so gimp_context_set_paint_method($name);
  }

  method set_paint_mode (Int() $paint_mode) {
    my GimpLayerMode $p = $paint_mode;

    so gimp_context_set_paint_mode($p);
  }

  method set_palette (Str() $name) {
    gimp_context_set_palette($name);
  }

  method set_pattern (Str() $name) {
    gimp_context_set_pattern($name);
  }

  method set_sample_criterion (Int() $sample_criterion) {
    my GimpSelectCriterion $s = $sample_criterion;

    so gimp_context_set_sample_criterion($s);
  }

  method set_sample_merged (Int() $sample_merged) {
    my $s = (so $sample_merged).Int;

    so gimp_context_set_sample_merged($s);
  }

  method set_sample_threshold (Num() $sample_threshold) {
    my gdouble $s = $sample_threshold;

    so gimp_context_set_sample_threshold($s);
  }

  method set_sample_threshold_int (Int() $sample_threshold) {
    my gint $s = $sample_threshold;

    so gimp_context_set_sample_threshold_int($s);
  }

  method set_sample_transparent (Int() $sample_transparent) {
    my gboolean $s = (so $sample_transparent).Int;

    so gimp_context_set_sample_transparent($s);
  }

  method set_stroke_method (Int() $stroke_method) {
    my GimpStrokeMethod $s = $stroke_method;

    so gimp_context_set_stroke_method($stroke_method);
  }

  method set_transform_direction (Int() $transform_direction) {
    my GimpTransformDirection $t = $transform_direction

    so gimp_context_set_transform_direction($t);
  }

  method set_transform_recursion (Int() $transform_recursion) {
    my gint $t = $transform_recursion;

    so gimp_context_set_transform_recursion($t);
  }

  method set_transform_resize (Int() $transform_resize) {
    my GimpTransformResize $t = $transform_resize;

    so gimp_context_set_transform_resize($t);
  }

  method swap_colors {
    gimp_context_swap_colors();
  }

}
