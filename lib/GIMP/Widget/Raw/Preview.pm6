use v6;

use NativeCall;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

unit package GIMP::Widget::Raw::Preview;

### /usr/include/gimp-2.0/libgimpwidgets/gimppreview.h

sub gimp_preview_draw (GimpPreview $preview)
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_draw_buffer (
  GimpPreview $preview,
  Str $buffer,
  gint $rowstride
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_get_area (GimpPreview $preview)
  returns GtkWidget
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_get_controls (GimpPreview $preview)
  returns GtkWidget
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_get_position (
  GimpPreview $preview,
  gint $x is rw,
  gint $y is rw
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_get_size (
  GimpPreview $preview,
  gint $width is rw,
  gint $height is rw
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_get_update (GimpPreview $preview)
  returns uint32
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_invalidate (GimpPreview $preview)
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_set_bounds (
  GimpPreview $preview,
  gint $xmin,
  gint $ymin,
  gint $xmax,
  gint $ymax
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_set_default_cursor (GimpPreview $preview, GdkCursor $cursor)
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_set_update (GimpPreview $preview, gboolean $update)
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_transform (
  GimpPreview $preview,
  gint $src_x,
  gint $src_y,
  gint $dest_x is rw,
  gint $dest_y is rw
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_preview_untransform (
  GimpPreview $preview,
  gint $src_x,
  gint $src_y,
  gint $dest_x is rw,
  gint $dest_y is rw
)
  is native(gimpwidget)
  is export
{ * }
