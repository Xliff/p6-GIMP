use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

use GIMP::PDB::Raw::Procedural;

use GLib::Roles::StaticClass;

class GIMP::PDB::Procedural {
  also does GLib::Roles::StaticClass;

  method procedural_db_dump (Str $filename) {
    gimp_procedural_db_dump($filename);
  }

  method procedural_db_get_data_size (Str $identifier) {
    gimp_procedural_db_get_data_size($identifier);
  }

  method procedural_db_proc_arg (
    Str $procedure_name,
    gint $arg_num,
    GimpPDBArgType $arg_type,
    Str $arg_name,
    Str $arg_desc
  ) {
    gimp_procedural_db_proc_arg(
      $procedure_name,
      $arg_num,
      $arg_type,
      $arg_name,
      $arg_desc
    );
  }

  method procedural_db_proc_exists (Str $procedure_name) {
    gimp_procedural_db_proc_exists($procedure_name);
  }

  method procedural_db_proc_val (
    Str $procedure_name,
    gint $val_num,
    GimpPDBArgType $val_type,
    Str $val_name,
    Str $val_desc
  ) {
    gimp_procedural_db_proc_val(
      $procedure_name,
      $val_num,
      $val_type,
      $val_name,
      $val_desc
    );
  }

  method procedural_db_query (
    Str $name,
    Str $blurb,
    Str $help,
    Str $author,
    Str $copyright,
    Str $date,
    Str $proc_type,
    gint $num_matches,
    Str $procedure_names
  ) {
    gimp_procedural_db_query($name, $blurb, $help, $author, $copyright, $date, $proc_type, $num_matches, $procedure_names);
  }

  method procedural_db_temp_name {
    gimp_procedural_db_temp_name();
  }

}
