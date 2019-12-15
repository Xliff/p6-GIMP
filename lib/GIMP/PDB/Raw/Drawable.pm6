use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::Drawable;

### /usr/include/gimp-2.0/libgimp/gimpdrawablecolor_pdb.h

sub gimp_drawable_brightness_contrast (
  gint32 $drawable_ID,
  gdouble $brightness,
  gdouble $contrast
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_color_balance (
  gint32 $drawable_ID,
  GimpTransferMode $transfer_mode,
  gboolean $preserve_lum,
  gdouble $cyan_red,
  gdouble $magenta_green,
  gdouble $yellow_blue
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_colorize_hsl (
  gint32 $drawable_ID,
  gdouble $hue,
  gdouble $saturation,
  gdouble $lightness
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_curves_explicit (
  gint32 $drawable_ID,
  GimpHistogramChannel $channel,
  gint $num_values,
  gdouble $values
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_curves_spline (
  gint32 $drawable_ID,
  GimpHistogramChannel $channel,
  gint $num_points,
  gdouble $points
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_desaturate (
  gint32 $drawable_ID,
  GimpDesaturateMode $desaturate_mode
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_equalize (gint32 $drawable_ID, gboolean $mask_only)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_histogram (
  gint32 $drawable_ID,
  GimpHistogramChannel $channel,
  gdouble $start_range,
  gdouble $end_range,
  gdouble $mean,
  gdouble $std_dev,
  gdouble $median,
  gdouble $pixels,
  gdouble $count,
  gdouble $percentile
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_hue_saturation (
  gint32 $drawable_ID,
  GimpHueRange $hue_range,
  gdouble $hue_offset,
  gdouble $lightness,
  gdouble $saturation,
  gdouble $overlap
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_invert (gint32 $drawable_ID, gboolean $linear)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_levels (
  gint32 $drawable_ID,
  GimpHistogramChannel $channel,
  gdouble $low_input,
  gdouble $high_input,
  gboolean $clamp_input,
  gdouble $gamma,
  gdouble $low_output,
  gdouble $high_output,
  gboolean $clamp_output
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_levels_stretch (gint32 $drawable_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_posterize (gint32 $drawable_ID, gint $levels)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_threshold (
  gint32 $drawable_ID,
  GimpHistogramChannel $channel,
  gdouble $low_threshold,
  gdouble $high_threshold
)
  returns uint32
  is native(gimp)
  is export
{ * }


### /usr/include/gimp-2.0/libgimp/gimpdrawableedit_pdb.h

sub gimp_drawable_edit_bucket_fill (
  gint32 $drawable_ID,
  GimpFillType $fill_type,
  gdouble $x,
  gdouble $y
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_edit_clear (gint32 $drawable_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_edit_fill (gint32 $drawable_ID, GimpFillType $fill_type)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_edit_gradient_fill (
  gint32 $drawable_ID,
  GimpGradientType $gradient_type,
  gdouble $offset,
  gboolean $supersample,
  gint $supersample_max_depth,
  gdouble $supersample_threshold,
  gboolean $dither,
  gdouble $x1,
  gdouble $y1,
  gdouble $x2,
  gdouble $y2
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_edit_stroke_item (gint32 $drawable_ID, gint32 $item_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_edit_stroke_selection (gint32 $drawable_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimppixbuf.h

sub gimp_drawable_get_sub_thumbnail (
  gint32 $drawable_ID,
  gint $src_x,
  gint $src_y,
  gint $src_width,
  gint $src_height,
  gint $dest_width,
  gint $dest_height,
  GimpPixbufTransparency $alpha
)
  returns GdkPixbuf
  is native(gimp)
  is export
{ * }

sub gimp_drawable_get_thumbnail (
  gint32 $drawable_ID,
  gint $width,
  gint $height,
  GimpPixbufTransparency $alpha
)
  returns GdkPixbuf
  is native(gimp)
  is export
{ * }
