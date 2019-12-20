use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

unit package GIMP::Widget::Raw::ColorSelector;

### /usr/include/gimp-2.0/libgimpwidgets/gimpcolorselector.h

sub gimp_color_selector_channel_changed (GimpColorSelector $selector)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_color_changed (GimpColorSelector $selector)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_get_channel (GimpColorSelector $selector)
  returns GimpColorSelectorChannel
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_get_color (
  GimpColorSelector $selector,
  GimpRGB $rgb,
  GimpHSV $hsv
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_get_model_visible (
  GimpColorSelector $selector,
  GimpColorSelectorModel $model
)
  returns uint32
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_get_show_alpha (GimpColorSelector $selector)
  returns uint32
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_get_toggles_sensitive (GimpColorSelector $selector)
  returns uint32
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_get_toggles_visible (GimpColorSelector $selector)
  returns uint32
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_model_visible_changed (
  GimpColorSelector $selector,
  GimpColorSelectorModel $model
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_new (
  GType $selector_type,
  GimpRGB $rgb,
  GimpHSV $hsv,
  GimpColorSelectorChannel $channel
)
  returns GimpColorSelector
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_set_channel (
  GimpColorSelector $selector,
  GimpColorSelectorChannel $channel
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_set_color (
  GimpColorSelector $selector,
  GimpRGB $rgb,
  GimpHSV $hsv
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_set_config (
  GimpColorSelector $selector,
  GimpColorConfig $config
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_set_model_visible (
  GimpColorSelector $selector,
  GimpColorSelectorModel $model,
  gboolean $visible
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_set_show_alpha (
  GimpColorSelector $selector,
  gboolean $show_alpha
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_set_toggles_sensitive (
  GimpColorSelector $selector,
  gboolean $sensitive
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selector_set_toggles_visible (
  GimpColorSelector $selector,
  gboolean $visible
)
  is native(gimpwidget)
  is export
{ * }
