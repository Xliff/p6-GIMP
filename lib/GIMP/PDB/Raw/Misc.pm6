use v6;

use NativeCall;

unit package GIMP::PDB::Raw::Misc;


### /usr/include/gimp-2.0/libgimp/gimp_pdb.h

sub gimp_attach_parasite (GimpParasite $parasite)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_detach_parasite (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_get_parasite (Str $name)
  returns GimpParasite
  is native(gimp)
  is export
{ * }

sub gimp_get_parasite_list (gint $num_parasites)
  returns CArray[Str]
  is native(gimp)
  is export
{ * }

sub gimp_getpid ()
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_temp_name (Str $extension)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_version ()
  returns Str
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimpdebug_pdb.h

sub gimp_debug_timer_end ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_debug_timer_start ()
  returns uint32
  is native(gimp)
  is export
{ * }


### /usr/include/gimp-2.0/libgimp/gimphelp_pdb.h

sub gimp_help (Str $help_domain, Str $help_id)
  returns uint32
  is native(gimp)
  is export
{ * }
