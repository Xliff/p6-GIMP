use v6;

use NativeCall;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

unit package GIMP::Widget::Raw::Dialog;

### /usr/include/gimp-2.0/libgimpwidget/gimpdialog.h

sub gimp_dialog_add_button (
  GimpDialog $dialog,
  Str $button_text,
  gint $response_id
)
  returns GtkWidget
  is native(gimpwidget)
  is export
{ * }

sub gimp_dialog_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_dialogs_show_help_button (gboolean $show)
  is native(gimpwidget)
  is export
{ * }

sub gimp_dialog_new (
  Str $title,
  Str $role,
  GtkWidget $parent,
  GtkDialogFlags $flags,
  &help_func (Str, gpointer),
  Str $help_id,
  Str
)
  returns GimpDialog
  is native(gimpwidget)
  is export
{ * }

sub gimp_dialog_run (GimpDialog $dialog)
  returns gint
  is native(gimpwidget)
  is export
{ * }
