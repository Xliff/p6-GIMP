use v6;

use GTK::Raw::Utils;

use GIMP::Raw::Types;

use GIMP::PDB::Raw::Misc;

use GLib::Roles::StaticClass;

class GIMP::PDB::Misc {
  also does GLib::Roles::StaticClass;

  method attach_parasite (GimpParasite $parasite) {
    gimp_attach_parasite($parasite);
  }

  method detach_parasite (Str() $name) {
    gimp_detach_parasite($name);
  }

  method get_parasite (Str() $name) {
    gimp_get_parasite($name);
  }

  method get_parasite_list (gint $num_parasites) {
    my gint $n = $num_parasites;

    CStringArrayToArray( gimp_get_parasite_list($num_parasites) );
  }

  method getpid {
    gimp_getpid();
  }

  method temp_name (Str() $extension) {
    gimp_temp_name($extension);
  }

  method version {
    gimp_version();
  }

  method timer_end {
    gimp_debug_timer_end();
  }

  method timer_start {
    gimp_debug_timer_start();
  }

  method help (Str() $help_domain, Str() $help_id) {
    gimp_help($help_domain, $help_id);
  }

}
