use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

unit package GIMP::PDB::Raw::Procedural;

### /usr/include/gimp-2.0/libgimp/gimpproceduraldb_pdb.h

sub gimp_procedural_db_dump (Str $filename)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_procedural_db_get_data_size (Str $identifier)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_procedural_db_proc_arg (
  Str $procedure_name,
  gint $arg_num,
  GimpPDBArgType $arg_type is rw,
  CArray[Str] $arg_name,
  CArray[Str] $arg_desc
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_procedural_db_proc_exists (Str $procedure_name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_procedural_db_proc_val (
  Str $procedure_name,
  gint $val_num,
  GimpPDBArgType $val_type is rw,
  CArray[Str] $val_name,
  CArray[Str] $val_desc
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_procedural_db_query (
  Str $name,
  Str $blurb,
  Str $help,
  Str $author,
  Str $copyright,
  Str $date,
  Str $proc_type,
  gint $num_matches is rw,
  CArray[CArray[Str]] $procedure_names
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_procedural_db_temp_name ()
  returns Str
  is native(gimp)
  is export
{ * }
