use v6;

use NativeCall;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

unit package GIMP::Widget::Raw::Browser;

### /usr/include/gimp-2.0/libgimpwidgets/gimpbrowser.h

sub gimp_browser_add_search_types (
  GimpBrowser $browser,
  Str $first_type_label,
  gint $first_type_id,
  Str
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_browser_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_browser_new ()
  returns GimpBrowser
  is native(gimpwidget)
  is export
{ * }

sub gimp_browser_set_widget (GimpBrowser $browser, GtkWidget $widget)
  is native(gimpwidget)
  is export
{ * }

sub gimp_browser_show_message (GimpBrowser $browser, Str $message)
  is native(gimpwidget)
  is export
{ * }
