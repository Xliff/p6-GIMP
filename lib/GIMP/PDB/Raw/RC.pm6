use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::RC;

### /usr/include/gimp-2.0/libgimp/gimpgimprc_pdb.h

sub _gimp_get_color_configuration ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_get_default_comment ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_get_default_unit ()
  returns GimpUnit
  is native(gimp)
  is export
{ * }

sub gimp_get_icon_theme_dir ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_get_module_load_inhibit ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_get_monitor_resolution (gdouble $xres, gdouble $yres)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_get_theme_dir ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_gimprc_query (Str $token)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_gimprc_set (Str $token, Str $value)
  returns uint32
  is native(gimp)
  is export
{ * }
