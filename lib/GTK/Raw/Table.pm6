use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;
use GIMP::Compat::Deprecated;

unit package GTK::Raw::Table;

### /usr/include/gtk-3.0/gtk/deprecated/gtktable.h

sub gtk_table_attach (
  GtkTable $table,
  GtkWidget $child,
  guint $left_attach,
  guint $right_attach,
  guint $top_attach,
  guint $bottom_attach,
  guint32 $xoptions, # GtkAttachOptions $xoptions,
  guint32 $yoptions, # GtkAttachOptions $yoptions,
  guint $xpadding,
  guint $ypadding
)
  is DEPRECATED
  is native(gtk)
  is export
{ * }

sub gtk_table_attach_defaults (
  GtkTable $table,
  GtkWidget $widget,
  guint $left_attach,
  guint $right_attach,
  guint $top_attach,
  guint $bottom_attach
)
  is DEPRECATED
  is native(gtk)
  is export
{ * }

sub gtk_table_get_col_spacing (GtkTable $table, guint $column)
  is DEPRECATED
  returns guint
  is native(gtk)
  is export
{ * }

sub gtk_table_get_default_col_spacing (GtkTable $table)
  is DEPRECATED
  returns guint
  is native(gtk)
  is export
{ * }

sub gtk_table_get_default_row_spacing (GtkTable $table)
  is DEPRECATED
  returns guint
  is native(gtk)
  is export
{ * }

sub gtk_table_get_homogeneous (GtkTable $table)
  is DEPRECATED
  returns uint32
  is native(gtk)
  is export
{ * }

sub gtk_table_get_row_spacing (GtkTable $table, guint $row)
  is DEPRECATED
  returns guint
  is native(gtk)
  is export
{ * }

sub gtk_table_get_size (
  GtkTable $table,
  guint $rows is rw,
  guint $columns is rw
)
  is DEPRECATED
  is native(gtk)
  is export
{ * }

sub gtk_table_get_type ()
  returns GType
  is native(gtk)
  is export
{ * }

sub gtk_table_new (guint $rows, guint $columns, gboolean $homogeneous)
  is DEPRECATED
  returns GtkTable
  is native(gtk)
  is export
{ * }

sub gtk_table_resize (GtkTable $table, guint $rows, guint $columns)
  is DEPRECATED
  is native(gtk)
  is export
{ * }

sub gtk_table_set_col_spacing (GtkTable $table, guint $column, guint $spacing)
  is DEPRECATED
  is native(gtk)
  is export
{ * }

sub gtk_table_set_col_spacings (GtkTable $table, guint $spacing)
  is DEPRECATED
  is native(gtk)
  is export
{ * }

sub gtk_table_set_homogeneous (GtkTable $table, gboolean $homogeneous)
  is DEPRECATED
  is native(gtk)
  is export
{ * }

sub gtk_table_set_row_spacing (GtkTable $table, guint $row, guint $spacing)
  is DEPRECATED
  is native(gtk)
  is export
{ * }

sub gtk_table_set_row_spacings (GtkTable $table, guint $spacing)
  is DEPRECATED
  is native(gtk)
  is export
{ * }
