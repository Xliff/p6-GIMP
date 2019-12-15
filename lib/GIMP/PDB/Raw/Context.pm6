use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::Context;

### /usr/include/gimp-2.0/libgimp/gimpcontext_pdb.h

sub gimp_context_get_antialias ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_get_background (GimpRGB $background)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_get_brush ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_context_get_brush_angle ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_brush_aspect_ratio ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_brush_force ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_brush_hardness ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_brush_size ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_brush_spacing ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_diagonal_neighbors ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_get_distance_metric ()
  returns GeglDistanceMetric
  is native(gimp)
  is export
{ * }

sub gimp_context_get_dynamics ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_context_get_feather ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_get_feather_radius (
  gdouble $feather_radius_x is rw,
  gdouble $feather_radius_y is rw
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_get_font ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_context_get_foreground (GimpRGB $foreground)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_get_gradient ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_context_get_gradient_blend_color_space ()
  returns GimpGradientBlendColorSpace
  is native(gimp)
  is export
{ * }

sub gimp_context_get_gradient_repeat_mode ()
  returns GimpRepeatMode
  is native(gimp)
  is export
{ * }

sub gimp_context_get_gradient_reverse ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_get_ink_angle ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_ink_blob_angle ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_ink_blob_aspect_ratio ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_ink_blob_type ()
  returns GimpInkBlobType
  is native(gimp)
  is export
{ * }

sub gimp_context_get_ink_size ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_ink_size_sensitivity ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_ink_speed_sensitivity ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_ink_tilt_sensitivity ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_interpolation ()
  returns GimpInterpolationType
  is native(gimp)
  is export
{ * }

sub gimp_context_get_line_cap_style ()
  returns GimpCapStyle
  is native(gimp)
  is export
{ * }

sub gimp_context_get_line_dash_offset ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_line_dash_pattern (
  gint $num_dashes is rw,
  CArray[CArray[gdouble]] $dashes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_get_line_join_style ()
  returns GimpJoinStyle
  is native(gimp)
  is export
{ * }

sub gimp_context_get_line_miter_limit ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_line_width ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_line_width_unit ()
  returns GimpUnit
  is native(gimp)
  is export
{ * }

sub gimp_context_get_mypaint_brush ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_context_get_opacity ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_paint_method ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_context_get_paint_mode ()
  returns GimpLayerMode
  is native(gimp)
  is export
{ * }

sub gimp_context_get_palette ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_context_get_pattern ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_context_get_sample_criterion ()
  returns GimpSelectCriterion
  is native(gimp)
  is export
{ * }

sub gimp_context_get_sample_merged ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_get_sample_threshold ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_context_get_sample_threshold_int ()
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_context_get_sample_transparent ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_get_stroke_method ()
  returns GimpStrokeMethod
  is native(gimp)
  is export
{ * }

sub gimp_context_get_transform_direction ()
  returns GimpTransformDirection
  is native(gimp)
  is export
{ * }

sub gimp_context_get_transform_resize ()
  returns GimpTransformResize
  is native(gimp)
  is export
{ * }

sub gimp_context_list_paint_methods (
  gint $num_paint_methods is rw,
  CArray[CArray[Str]] $paint_methods
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_pop ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_push ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_antialias (gboolean $antialias)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_background (GimpRGB $background)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_brush (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_brush_angle (gdouble $angle)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_brush_aspect_ratio (gdouble $aspect)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_brush_default_hardness ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_brush_default_size ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_brush_default_spacing ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_brush_force (gdouble $force)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_brush_hardness (gdouble $hardness)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_brush_size (gdouble $size)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_brush_spacing (gdouble $spacing)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_default_colors ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_defaults ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_diagonal_neighbors (gboolean $diagonal_neighbors)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_distance_metric (GeglDistanceMetric $metric)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_dynamics (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_feather (gboolean $feather)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_feather_radius (
  gdouble $feather_radius_x,
  gdouble $feather_radius_y
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_font (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_foreground (GimpRGB $foreground)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_gradient (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_gradient_blend_color_space (
  GimpGradientBlendColorSpace $blend_color_space
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_gradient_fg_bg_hsv_ccw ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_gradient_fg_bg_hsv_cw ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_gradient_fg_bg_rgb ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_gradient_fg_transparent ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_gradient_repeat_mode (GimpRepeatMode $repeat_mode)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_gradient_reverse (gboolean $reverse)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_ink_angle (gdouble $angle)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_ink_blob_angle (gdouble $angle)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_ink_blob_aspect_ratio (gdouble $aspect)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_ink_blob_type (GimpInkBlobType $type)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_ink_size (gdouble $size)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_ink_size_sensitivity (gdouble $size)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_ink_speed_sensitivity (gdouble $speed)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_ink_tilt_sensitivity (gdouble $tilt)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_interpolation (GimpInterpolationType $interpolation)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_line_cap_style (GimpCapStyle $cap_style)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_line_dash_offset (gdouble $dash_offset)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_line_dash_pattern (
  gint $num_dashes,
  gdouble $dashes is rw
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_line_join_style (GimpJoinStyle $join_style)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_line_miter_limit (gdouble $miter_limit)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_line_width (gdouble $line_width)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_line_width_unit (GimpUnit $line_width_unit)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_mypaint_brush (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_opacity (gdouble $opacity)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_paint_method (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_paint_mode (GimpLayerMode $paint_mode)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_palette (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_pattern (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_sample_criterion (GimpSelectCriterion $sample_criterion)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_sample_merged (gboolean $sample_merged)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_sample_threshold (gdouble $sample_threshold)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_sample_threshold_int (gint $sample_threshold)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_sample_transparent (gboolean $sample_transparent)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_stroke_method (GimpStrokeMethod $stroke_method)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_transform_direction (
  GimpTransformDirection $transform_direction
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_set_transform_resize (GimpTransformResize $transform_resize)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_context_swap_colors ()
  returns uint32
  is native(gimp)
  is export
{ * }
