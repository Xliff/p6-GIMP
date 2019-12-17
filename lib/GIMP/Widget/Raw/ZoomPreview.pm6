use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

unit package GIMP::Widget::Raw::ZoomPreview;

### /usr/include/gimp-2.0/libgimp/gimpzoompreview.h

sub gimp_zoom_preview_get_drawable_id (GimpZoomPreview $preview)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_zoom_preview_get_factor (GimpZoomPreview $preview)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_zoom_preview_get_model (GimpZoomPreview $preview)
  returns GimpZoomModel
  is native(gimp)
  is export
{ * }

sub gimp_zoom_preview_get_source (
  GimpZoomPreview $preview,
  gint $width is rw,
  gint $height is rw,
  gint $bpp is rw
)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_zoom_preview_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }

sub gimp_zoom_preview_new_from_drawable_id (gint32 $drawable_ID)
  returns GimpZoomPreview
  is native(gimp)
  is export
{ * }

sub gimp_zoom_preview_new_with_model_from_drawable_id (
  gint32 $drawable_ID,
  GimpZoomModel $model
)
  returns GimpZoomPreview
  is native(gimp)
  is export
{ * }
