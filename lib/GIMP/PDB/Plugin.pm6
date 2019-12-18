use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

use GIMP::PDB::Raw::Plugin;

use GLib::Roles::StaticClass;

class GIMP::PDB::Plugin {
  also does GLib::Roles::StaticClass;

  method domain_register (Str() $domain_name, Str() $domain_path) {
    so gimp_plugin_domain_register($domain_name, $domain_path);
  }

  method enable_precision {
    so gimp_plugin_enable_precision();
  }

  method get_pdb_error_handler {
    GimpPDBErrorHandlerEnum( gimp_plugin_get_pdb_error_handler() );
  }

  method help_register (Str() $domain_name, Str() $domain_uri) {
    so gimp_plugin_help_register($domain_name, $domain_uri);
  }

  method menu_branch_register (Str() $menu_path, Str() $menu_name) {
    so gimp_plugin_menu_branch_register($menu_path, $menu_name);
  }

  method menu_register (Str() $procedure_name, Str() $menu_path) {
    so gimp_plugin_menu_register($procedure_name, $menu_path);
  }

  method precision_enabled {
    so gimp_plugin_precision_enabled();
  }

  method set_pdb_error_handler (GimpPDBErrorHandler $handler) {
    my GimpPDBErrorHandler $h = $handler;

    gimp_plugin_set_pdb_error_handler($h);
  }

}

constant Plugin is export := GIMP::PDB::Plugin;
