use v6;

use NativeCall;

use GIMP::Raw::Types;

### /usr/include/gimp-2.0/libgimpbase/gimpenv.h

sub gimp_data_directory ()
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_directory ()
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_env_init (gboolean $plug_in)
  is native(gimpbase)
  is export
{ * }

sub gimp_gtkrc ()
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_installation_directory ()
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_locale_directory ()
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_path_free (GList $path)
  is native(gimpbase)
  is export
{ * }

sub gimp_path_get_user_writable_dir (GList $path)
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_path_parse (
  Str $path,
  gint $max_paths,
  gboolean $check,
  CArray[CArray[GList]] $check_failed
)
  returns GList
  is native(gimpbase)
  is export
{ * }

sub gimp_path_to_str (GList $path)
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_personal_rc_file (Str $basename)
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_plug_in_directory ()
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_sysconf_directory ()
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_user_directory (GimpUserDirectory $type)
  returns Str
  is native(gimpbase)
  is export
{ * }
