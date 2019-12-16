use v6;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;
use GIMP::Raw::Libs;
use GIMP::Raw::Widgets;

unit package GIMP::Widget::Raw::ScrolledPreview;

### /usr/include/gimp-2.0/libgimpwidgets/gimpscrolledpreview.h

sub gimp_scrolled_preview_freeze (GimpScrolledPreview $preview)
  is native(gimpwidget)
  is export
{ * }

sub gimp_scrolled_preview_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_scrolled_preview_set_policy (
  GimpScrolledPreview $preview,
  GtkPolicyType $hscrollbar_policy,
  GtkPolicyType $vscrollbar_policy
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_scrolled_preview_set_position (
  GimpScrolledPreview $preview,
  gint $x,
  gint $y
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_scrolled_preview_thaw (GimpScrolledPreview $preview)
  is native(gimpwidget)
  is export
{ * }
