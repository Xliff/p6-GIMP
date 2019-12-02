use v6;

use NativeCall;

use GTK::Compat::Types;

unit package GIMP::PDB::Raw::File;

### /usr/include/gimp-2.0/libgimp/gimpfileops_pdb.h

sub gimp_file_load (GimpRunMode $run_mode, Str $filename, Str $raw_filename)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_file_load_layer (
  GimpRunMode $run_mode,
  gint32 $image_ID,
  Str $filename
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_file_load_layers (
  GimpRunMode $run_mode,
  gint32 $image_ID,
  Str $filename,
  gint $num_layers
)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_file_save (
  GimpRunMode $run_mode,
  gint32 $image_ID,
  gint32 $drawable_ID,
  Str $filename,
  Str $raw_filename
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_file_save_thumbnail (gint32 $image_ID, Str $filename)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_register_file_handler_mime (Str $procedure_name, Str $mime_types)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_register_file_handler_priority (Str $procedure_name, gint $priority)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_register_file_handler_raw (Str $procedure_name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_register_file_handler_uri (Str $procedure_name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_register_load_handler (
  Str $procedure_name,
  Str $extensions,
  Str $prefixes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_register_magic_load_handler (
  Str $procedure_name,
  Str $extensions,
  Str $prefixes,
  Str $magics
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_register_save_handler (
  Str $procedure_name,
  Str $extensions,
  Str $prefixes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_register_thumbnail_loader (Str $load_proc, Str $thumb_proc)
  returns uint32
  is native(gimp)
  is export
{ * }
