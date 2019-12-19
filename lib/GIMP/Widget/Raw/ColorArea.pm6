use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

unit package GIMP::Widget::Raw::ColorArea;

### /usr/include/gimp-2.0/libgimpwidgets/gimpcolorarea.h

sub gimp_color_area_get_color (GimpColorArea $area, GimpRGB $color)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_area_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_area_has_alpha (GimpColorArea $area)
  returns uint32
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_area_new (
  GimpRGB $color,
  GimpColorAreaType $type,
  guint32 $drag_mask # GdkModifierType $drag_mask
)
  returns GimpColorArea
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_area_set_color (GimpColorArea $area, GimpRGB $color)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_area_set_color_config (
  GimpColorArea $area,
  GimpColorConfig $config
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_area_set_draw_border (
  GimpColorArea $area,
  gboolean $draw_border
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_area_set_type (GimpColorArea $area, GimpColorAreaType $type)
  is native(gimpwidget)
  is export
{ * }
