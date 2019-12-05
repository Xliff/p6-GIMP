use v6;

use GIMP::Raw::Types;

use GIMP::PDB::Raw::Gradient;

use GLib::Roles::StaticClass;

class GIMP::PDB::Gradient {
  also does GLib::Roles::StaticClass;

  method new_gradient (Str() $name) {
    gimp_gradient_new($name);
  }

  method delete (Str() $name) {
    gimp_gradient_delete($name);
  }

  method duplicate (Str() $name) {
    gimp_gradient_duplicate($name);
  }

  method get_custom_samples (
    Str() $name,
    Int() $num_samples,
    Num() $positions,
    Int() $reverse,
    Int() $num_color_samples,
    Num() $color_samples
  ) {
    my gint ($ns, $nc) = ($num_samples, $num_color_samples);
    my gboolean $r = (so $reverse).Int;
    my gdouble ($p, $cs) = ($positions, $color_samples);

    gimp_gradient_get_custom_samples($name, $ns, $p, $r, $nc, $cs);
  }

  method get_number_of_segments (Str() $name) {
    gimp_gradient_get_number_of_segments($name);
  }

  method get_uniform_samples (
    Str() $name,
    Int() $num_samples,
    Int() $reverse,
    Int() $num_color_samples,
    Num() $color_samples
  ) {
    my gint ($ns, $nc) = ($num_samples, $num_color_samples);
    my gboolean $r = (so $reverse).Int;
    my gdouble $cs = $color_samples;

    gimp_gradient_get_uniform_samples($name, $ns, $r, $nc, $cs);
  }

  method is_editable (Str() $name) {
    so gimp_gradient_is_editable($name);
  }

  method rename (Str() $name, Str() $new_name) {
    gimp_gradient_rename($name, $new_name);
  }

}

class GIMP::PDB::Gradient::Segment {
  also does GLib::Roles::StaticClass;

  method get_blending_function (
    Str() $name,
    Int() $segment,
    Int() $blend_func
  ) {
    my gint $s = $segment;
    my GimpGradientSegmentType $b = $blend_func;

    gimp_gradient_segment_get_blending_function($name, $s, $b);
  }

  method get_coloring_type (
    Str() $name,
    Int() $segment,
    Int() $coloring_type
  ) {
    my gint $s = $segment;
    my GimpGradientSegmentColor $c = $coloring_type;

    gimp_gradient_segment_get_coloring_type($name, $s, $c);
  }

  method get_left_color (
    Str() $name,
    Int() $segment,
    GimpRGB $color,
    Num() $opacity
  ) {
    my gint $s = $segment;
    my gdouble $o = $opacity;

    gimp_gradient_segment_get_left_color($name, $s, $color, $o);
  }

  method get_left_pos (Str() $name, Int() $segment, Num() $pos) {
    my gint $s = $segment;
    my gdouble $p = $pos;

    gimp_gradient_segment_get_left_pos($name, $s, $pos);
  }

  method get_middle_pos (Str() $name, Int() $segment, Num() $pos) {
    my gint $s = $segment;
    my gdouble $p = $pos;

    gimp_gradient_segment_get_middle_pos($name, $s, $pos);
  }

  method get_right_color (
    Str() $name,
    Int() $segment,
    GimpRGB $color,
    Num() $opacity
  ) {
    my gint $s = $segment;
    my gdouble $o = $opacity;

    gimp_gradient_segment_get_right_color($name, $s, $color, $o);
  }

  method get_right_pos (Str() $name, Int() $segment, Num() $pos) {
    my gint $s = $segment;
    my gdouble $p = $pos;

    gimp_gradient_segment_get_right_pos($name, $s, $pos);
  }

  method set_left_color (
    Str() $name,
    Int() $segment,
    GimpRGB $color,
    Num() $opacity
  ) {
    my gint $s = $segment;
    my gdouble $o = $opacity;

    gimp_gradient_segment_set_left_color($name, $s, $color, $o);
  }

  method set_left_pos (
    Str() $name,
    Int() $segment,
    Num() $pos,
    Num() $final_pos
  ) {
    my gint $s = $segment;
    my gdouble ($p, $f) = ($pos, $final_pos);

    gimp_gradient_segment_set_left_pos($name, $s, $p, $f);
  }

  method set_middle_pos (
    Str() $name,
    Int() $segment,
    Num() $pos,
    Num() $final_pos
  ) {
    my gint $s = $segment;
    my gdouble ($p, $f) = ($pos, $final_pos);

    gimp_gradient_segment_set_middle_pos($name, $s, $p, $f);
  }

  method set_right_color (
    Str() $name,
    Int() $segment,
    GimpRGB $color,
    Num() $opacity
  ) {
    my gint $s = $segment;
    my gdouble $o = $opacity;

    gimp_gradient_segment_set_right_color($name, $s, $color, $o);
  }

  method set_right_pos (
    Str() $name,
    Int() $segment,
    Num() $pos,
    Num() $final_pos
  ) {
    my gint $s = $segment;
    my gdouble ($p, $f) = ($pos, $final_pos);

    gimp_gradient_segment_set_right_pos($name, $s, $p, $f);
  }

}

class GIMP::PDB::Graidient::Segment::Range {
  also does GLib::Roles::StaticClass;

  method blend_colors (Str() $name, Int() $start_segment, Int() $end_segment) {
    my gint ($s, $e) = ($start_segment, $end_segment);

    gimp_gradient_segment_range_blend_colors($name, $s, $e);
  }

  method blend_opacity (Str() $name, Int() $start_segment, Int() $end_segment) {
    my gint ($s, $e) = ($start_segment, $end_segment);

    gimp_gradient_segment_range_blend_opacity($name, $s, $e);
  }

  method delete (Str() $name, Int() $start_segment, Int() $end_segment) {
    my gint ($s, $e) = ($start_segment, $end_segment);

    gimp_gradient_segment_range_delete($name, $s, $e);
  }

  method flip (Str() $name, Int() $start_segment, Int() $end_segment) {
    my gint ($s, $e) = ($start_segment, $end_segment);

    gimp_gradient_segment_range_flip($name, $s, $e);
  }

  method move (
    Str() $name,
    Int() $start_segment,
    Int() $end_segment,
    Num() $delta,
    Int() $control_compress
  ) {
    my gint ($s, $e) = ($start_segment, $end_segment);
    my gdouble $d = $delta;
    my gboolean $c = (so $control_compress).Int;

    gimp_gradient_segment_range_move($name, $s, $e, $d, $c);
  }

  method redistribute_handles (
    Str() $name,
    Int() $start_segment,
    Int() $end_segment
  ) {
    my gint ($s, $e) = ($start_segment, $end_segment);

    gimp_gradient_segment_range_redistribute_handles($name, $s, $e);
  }

  method replicate (
    Str() $name,
    Int() $start_segment,
    Int() $end_segment,
    Int() $replicate_times
  ) {
    my gint ($s, $e, $r) = ($start_segment, $end_segment, $replicate_times);

    gimp_gradient_segment_range_replicate($name, $s, $e, $r);
  }

  method set_blending_function (
    Str() $name,
    Int() $start_segment,
    Int() $end_segment,
    Int() $blending_function
  ) {
    my gint ($s, $e) = ($start_segment, $end_segment);
    my GimpGradientSegmentType $b = $blending_function;

    gimp_gradient_segment_range_set_blending_function($name, $s, $e, $b);
  }

  method set_coloring_type (
    Str() $name,
    Int() $start_segment,
    Int() $end_segment,
    Int() $coloring_type
  ) {
    my GimpGradientSegmentColor $c = $coloring_type;

    my gint ($s, $e) = ($start_segment, $end_segment);

    gimp_gradient_segment_range_set_coloring_type($name, $s, $e, $c);
  }

  method split_midpoint (
    Str() $name,
    Int() $start_segment,
    Int() $end_segment
  ) {
    my gint ($s, $e) = ($start_segment, $end_segment);

    gimp_gradient_segment_range_split_midpoint($name, $s, $e);
  }

  method split_uniform (
    Str() $name,
    Int() $start_segment,
    Int() $end_segment,
    Int() $split_parts
  ) {
    my gint ($s, $e, $sp) = ($start_segment, $end_segment, $split_parts);

    gimp_gradient_segment_range_split_uniform($name, $s, $e, $sp);
  }

}
