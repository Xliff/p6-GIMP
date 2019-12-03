use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

unit package GIMP::PDB::Raw::Plugin;

### /usr/include/gimp-2.0/libgimp/gimpplugin_pdb.h

sub _gimp_plugin_icon_register (
  Str $procedure_name,
  GimpIconType $icon_type,
  gint $icon_data_length,
  CArray[guint8] $icon_data
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_plugin_domain_register (Str $domain_name, Str $domain_path)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_plugin_get_pdb_error_handler ()
  returns GimpPDBErrorHandler
  is native(gimp)
  is export
{ * }

sub gimp_plugin_enable_precision ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_plugin_help_register (Str $domain_name, Str $domain_uri)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_plugin_menu_branch_register (Str $menu_path, Str $menu_name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_plugin_menu_register (Str $procedure_name, Str $menu_path)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_plugin_precision_enabled ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_plugin_set_pdb_error_handler (GimpPDBErrorHandler $handler)
  returns uint32
  is native(gimp)
  is export
{ * }
