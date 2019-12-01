use v6;

use NativeCall;

unit package GIMP::Raw::Misc;


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
