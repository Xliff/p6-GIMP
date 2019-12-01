use v6;

use GTK::Compat::Types;

use GIMP::Raw::Enums;
use GIMP::Raw::Structs;

use GIMP::PDB::Raw::Drawable;

use GLib::Roles::StaticClass;

class GIMP::PDB::Drawable {
  also does GLib::Roles::StaticClass;

  method brightness_contrast (
    Int() $drawable_ID,
    Num() $brightness,
    Num() $contrast
  ) {
    my gint32 $d = $drawable_ID;
    my gdouble ($b, $c) = ($brightness, $contrast);

    gimp_drawable_brightness_contrast($d, $b, $c);
  }

  method color_balance (
    Int() $drawable_ID,
    Int() $transfer_mode,
    Int() $preserve_lum,
    Num() $cyan_red,
    Num() $magenta_green,
    Num() $yellow_blue
  ) {
    my gint32 $d = $drawable_ID;
    my GimpTransferMode $t = $transfer_mode;
    my gboolean $p = (so $preserve_lum).Int;
    my gdouble ($c, $m, $y) = ($cyan_red, $magenta_green, $yellow_blue);

    gimp_drawable_color_balance($d, $t, $p, $c, $m, $y);
  }

  method colorize_hsl (
    Int() $drawable_ID,
    Num() $hue,
    Num() $saturation,
    Num() $lightness
  ) {
    my gint32 $d = $drawable_ID;
    my gdouble ($h, $s, $l) = ($hue, $saturation, $lightness);

    gimp_drawable_colorize_hsl($d, $h, $s, $l);
  }

  method curves_explicit (
    Int() $drawable_ID,
    Int() $channel,
    Int() $num_values,
    Num() $values
  ) {
    my gint32 $d = $drawable_ID;
    my GimpHistogramChannel $c = $channel;
    my gint $n = $num_values;
    my gdouble $v = $values;

    gimp_drawable_curves_explicit($d, $c, $n, $v);
  }

  method curves_spline (
    Int() $drawable_ID,
    Int() $channel,
    Int() $num_points,
    Num() $points
  ) {
    my gint32 $d = $drawable_ID;
    my GimpHistogramChannel $c = $channel;
    my gint $n = $num_points;
    my gdouble $p = $points;

    gimp_drawable_curves_spline($d, $c, $n, $p);
  }

  method desaturate (Int() $drawable_ID, Int() $desaturate_mode) {
    my gint32 $d = $drawable_ID;
    my GimpDesaturateMode $dm = $desaturate_mode;

    gimp_drawable_desaturate($d, $dm);
  }

  method equalize (Int() $drawable_ID, Int() $mask_only) {
    my gint32 $d = $drawable_ID;
    my gboolean = (so $mask_only).Int;

    gimp_drawable_equalize($drawable_ID, $m);
  }

  method histogram (
    Int() $drawable_ID,
    Int() $channel,
    Num() $start_range,
    Num() $end_range,
    Num() $mean,
    Num() $std_dev,
    Num() $median,
    Num() $pixels,
    Num() $count,
    Num() $percentile
  ) {
    my gint32 $d = $drawable_ID;
    my GimpHistogramChannel $c = $channel;
    my gdouble ($s, $e, $m, $st, $me, $p, $c, $pct) = (
      $start_range,
      $end_range,
      $mean,
      $std_dev,
      $median,
      $pixels,
      $count,
      $percentile
    );

    gimp_drawable_histogram($d, $c, $s, $e, $m, $st, $me, $p, $c, $pct);
  }

  method hue_saturation (
    Int() $drawable_ID,
    Int() $hue_range,
    Num() $hue_offset,
    Num() $lightness,
    Num() $saturation,
    Num() $overlap
  ) {
    my gint32 $d = $drawable_ID;
    my gdouble ($h, $l, $s, $o) = (
      $hue_offset,
      $lightness,
      $saturation,
      $overlap
    );

    gimp_drawable_hue_saturation($d, $h, $s, $l, $o);
  }

  method invert (Int() $drawable_ID, Int() $linear) {
    my gint32 $d = $drawable_ID;
    my gboolean $s = (so $linear).Int;

    gimp_drawable_invert($d, $l);
  }

  method levels (
    Int() $drawable_ID,
    Int() $channel,
    Num() $low_input,
    Num() $high_input,
    Int() $clamp_input,
    Num() $gamma,
    Num() $low_output,
    Num() $high_output,
    Int() $clamp_output
  ) {
    my gint32 $d = $drawable_ID;
    my GimpHistogramChannel $c = $channel;
    my gboolean ($ci, $co) = ($clamp_input, $clamp_output)».so».Int;
    my dbouble ($li, $hi, $h, $lo, $ho) = (
      $low_input,
      $high_input,
      $gamma,
      $low_output,
      $high_output
    );

    gimp_drawable_levels($d, $c, $li, $hi, $ci, $lo, $ho, $co);
  }

  method levels_stretch (Int() $drawable_ID) {
    my gint32 $d = $drawable_ID;

    gimp_drawable_levels_stretch($drawable_ID);
  }

  method posterize (Int() $drawable_ID, Int() $levels) {
    my gint32 ($d, $l) = ($drawable_ID, $levels);

    gimp_drawable_posterize($d, $l);
  }

  method threshold (
    Int() $drawable_ID,
    Int() $channel,
    Num() $low_threshold,
    Num() $high_threshold
  ) {
    my gint32 $d = $drawable_ID;
    my GimpHistogramChannel $c = $channel;
    my gdouble ($l, $h) = ($low_threshold, $high_threshold);

    gimp_drawable_threshold($c, $c, $l, $h);
  }

  # Edit

  method bucket_fill (
    Int() $drawable_ID,
    Int() $fill_type,
    Num() $x,
    Num() $y
  ) {
    my gint32 $d = $drawable_ID;
    my GimpFillType $f = $fill_type;
    my gdouble ($xx, $yy);

    gimp_drawable_edit_bucket_fill($d, $f, $xx, $yy);
  }

  method clear (Int() $drawable_ID) {
    my gint32 $d = $drawable_ID;

    gimp_drawable_edit_clear($d);
  }

  method fill (Int() $drawable_ID, Int() $fill_type) {
    my gint32 $d = $drawable_ID;
    my GimpFillType $f = $fill_type;

    gimp_drawable_edit_fill($d, $f);
  }

  method gradient_fill (
    Int() $drawable_ID,
    Int() $gradient_type,
    Num() $offset,
    Int() $supersample,
    Int() $supersample_max_depth,
    Num() $supersample_threshold,
    Int() $dither,
    Int() $x1,
    Int() $y1,
    Int() $x2,
    Int() $y2
  ) {
    my gint32 ($d, $sm) = ($drawable_ID, $supersample_max_depth);
    my GimpGradientType $g = $gradient_type;
    my gboolean ($s, $d) = ($supersample, $dither)».so».Int;
    my gdouble ($o, $st, $xx1, $yy1, $xx2, $yy2) = (
      $offset,
      $supersample_threshold,
      $x1,
      $y1,
      $x2,
      $y2
    );

    gimp_drawable_edit_gradient_fill(
      $d,
      $g,
      $o,
      $s,
      $sm,
      $st,
      $d,
      $xx1,
      $yy2,
      $xx2,
      $yy2
    );
  }

  method stroke_item (Int() $drawable_ID, Int() $item_ID) {
    my gint32 ($d, $i) = ($drawable_ID, $item_ID);

    gimp_drawable_edit_stroke_item($d, $i);
  }

  method stroke_selection (Int() $drawable_ID) {
    my gint32 $d = $drawable_ID;

    gimp_drawable_edit_stroke_selection($drawable_ID);
  }

}
