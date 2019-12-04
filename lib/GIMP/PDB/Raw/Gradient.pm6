use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::Gradient;

### /usr/include/gimp-2.0/libgimp/gimpgradient_pdb.h

sub gimp_gradient_delete (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_duplicate (Str $name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_gradient_get_custom_samples (
  Str $name,
  gint $num_samples,
  gdouble $positions,
  gboolean $reverse,
  gint $num_color_samples,
  gdouble $color_samples
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_get_number_of_segments (Str $name)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_gradient_get_uniform_samples (
  Str $name,
  gint $num_samples,
  gboolean $reverse,
  gint $num_color_samples,
  gdouble $color_samples
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_is_editable (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_new (Str $name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_gradient_rename (Str $name, Str $new_name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_get_blending_function (
  Str $name,
  gint $segment,
  GimpGradientSegmentType $blend_func
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_get_coloring_type (
  Str $name,
  gint $segment,
  GimpGradientSegmentColor $coloring_type
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_get_left_color (
  Str $name,
  gint $segment,
  GimpRGB $color,
  gdouble $opacity
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_get_left_pos (Str $name, gint $segment, gdouble $pos)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_get_middle_pos (
  Str $name,
  gint $segment,
  gdouble $pos
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_get_right_color (
  Str $name,
  gint $segment,
  GimpRGB $color,
  gdouble $opacity
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_get_right_pos (
  Str $name,
  gint $segment,
  gdouble $pos
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_blend_colors (
  Str $name,
  gint $start_segment,
  gint $end_segment
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_blend_opacity (
  Str $name,
  gint $start_segment,
  gint $end_segment
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_delete (
  Str $name,
  gint $start_segment,
  gint $end_segment
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_flip (
  Str $name,
  gint $start_segment,
  gint $end_segment
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_move (
  Str $name,
  gint $start_segment,
  gint $end_segment,
  gdouble $delta,
  gboolean $control_compress
)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_redistribute_handles (
  Str $name,
  gint $start_segment,
  gint $end_segment
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_replicate (
  Str $name,
  gint $start_segment,
  gint $end_segment,
  gint $replicate_times
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_set_blending_function (
  Str $name,
  gint $start_segment,
  gint $end_segment,
  GimpGradientSegmentType $blending_function
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_set_coloring_type (
  Str $name,
  gint $start_segment,
  gint $end_segment,
  GimpGradientSegmentColor $coloring_type
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_split_midpoint (
  Str $name,
  gint $start_segment,
  gint $end_segment
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_range_split_uniform (
  Str $name,
  gint $start_segment,
  gint $end_segment,
  gint $split_parts
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_set_left_color (
  Str $name,
  gint $segment,
  GimpRGB $color,
  gdouble $opacity
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_set_left_pos (
  Str $name,
  gint $segment,
  gdouble $pos,
  gdouble $final_pos
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_set_middle_pos (
  Str $name,
  gint $segment,
  gdouble $pos,
  gdouble $final_pos
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_set_right_color (
  Str $name,
  gint $segment,
  GimpRGB $color,
  gdouble $opacity
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradient_segment_set_right_pos (
  Str $name,
  gint $segment,
  gdouble $pos,
  gdouble $final_pos
)
  returns uint32
  is native(gimp)
  is export
{ * }
