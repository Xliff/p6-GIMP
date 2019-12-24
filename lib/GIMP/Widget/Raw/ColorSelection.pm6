use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

unit package GIMP::Widget::Raw::ColorSelection;

### /usr/include/gimp-2.0/libgimpwidgets/gimpcolorselection.h

sub gimp_color_selection_color_changed (GimpColorSelection $selection)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selection_get_color (
  GimpColorSelection $selection,
  GimpRGB $color
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selection_get_old_color (
  GimpColorSelection $selection,
  GimpRGB $color
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selection_get_show_alpha (GimpColorSelection $selection)
  returns uint32
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selection_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selection_new ()
  returns GimpColorSelection
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selection_reset (GimpColorSelection $selection)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selection_set_color (
  GimpColorSelection $selection,
  GimpRGB $color
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selection_set_config (
  GimpColorSelection $selection,
  GimpColorConfig $config
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selection_set_old_color (
  GimpColorSelection $selection,
  GimpRGB $color
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_color_selection_set_show_alpha (
  GimpColorSelection $selection,
  gboolean $show_alpha
)
  is native(gimpwidget)
  is export
{ * }
