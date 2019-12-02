use v6;

use GTK::Compat::Types;

use GIMP::Raw::File;

use GLib::Roles::StaticClass;

class GIMP::PDB::Raw::File;

class GIMP::PDB::File {
  also does GLib::Roles::StaticClass;

  method load (Int() $run_mode, Str() $filename, Str() $raw_filename) {
    my GimpRunMode $r = $run_mode;

    gimp_file_load($r, $filename, $raw_filename);
  }

  method load_layer (Int() $run_mode, Int() $image_ID, Str() $filename) {
    my GimpRunMode $r = $run_mode;
    my gint32 $i = $image_ID;

    gimp_file_load_layer($r, $i, $filename);
  }

  method load_layers (
    Int() $run_mode,
    Int() $image_ID,
    Str() $filename,
    Int() $num_layers
  ) {
    my GimpRunMode $r = $run_mode;
    my gint32 ($i, $n) = ($image_ID, $num_layers);

    gimp_file_load_layers($r, $i, $filename, $n);
  }

  method save (
    Int() $run_mode,
    Int() $image_ID,
    Int() $drawable_ID,
    Str() $filename,
    Str() $raw_filename
  ) {
    my GimpRunMode $r = $run_mode;
    my gint32 ($i, $d) = ($image_ID, $drawable_ID);

    gimp_file_save($r, $i, $d, $filename, $raw_filename);
  }

  method save_thumbnail (Int() $image_ID, Str() $filename) {
    my gint32 $i = $image_ID;

    gimp_file_save_thumbnail($image_ID, $filename);
  }
}

class GIMP::PDB::File::Register {
  method file_handler_mime (Str() $procedure_name, Str() $mime_types) {
    gimp_register_file_handler_mime($procedure_name, $mime_types);
  }

  method file_handler_priority (Str() $procedure_name, Int() $priority) {
    my gint $p = $priority;

    gimp_register_file_handler_priority($procedure_name, $p);
  }

  method file_handler_raw (Str() $procedure_name) {
    gimp_register_file_handler_raw($procedure_name);
  }

  method file_handler_uri (Str() $procedure_name) {
    gimp_register_file_handler_uri($procedure_name);
  }

  method load_handler (
    Str() $procedure_name,
    Str() $extensions,
    Str() $prefixes
  ) {
    gimp_register_load_handler($procedure_name, $extensions, $prefixes);
  }

  method magic_load_handler (
    Str() $procedure_name,
    Str() $extensions,
    Str() $prefixes,
    Str() $magics
  ) {
    gimp_register_magic_load_handler($procedure_name, $extensions, $prefixes, $magics);
  }

  method save_handler (
    Str() $procedure_name,
    Str() $extensions,
    Str() $prefixes
  ) {
    gimp_register_save_handler($procedure_name, $extensions, $prefixes);
  }

  method thumbnail_loader (Str() $load_proc, Str() $thumb_proc) {
    gimp_register_thumbnail_loader($load_proc, $thumb_proc);
  }
}
