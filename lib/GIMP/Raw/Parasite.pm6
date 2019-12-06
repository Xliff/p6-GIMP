use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::Raw::Parasite;

### /usr/include/gimp-2.0/libgimpbase/gimpparasite.h

sub gimp_param_parasite_get_type ()
  returns GType
  is native(gimpbase)
  is export
{ * }

sub gimp_param_spec_parasite (
  Str $name,
  Str $nick,
  Str $blurb,
  GParamFlags $flags
)
  returns GParamSpec
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_compare (GimpParasite $a, GimpParasite $b)
  returns uint32
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_copy (GimpParasite $parasite)
  returns GimpParasite
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_data (GimpParasite $parasite)
  returns gconstpointer
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_data_size (GimpParasite $parasite)
  returns glong
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_flags (GimpParasite $parasite)
  returns gulong
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_free (GimpParasite $parasite)
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_get_type ()
  returns GType
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_has_flag (GimpParasite $parasite, gulong $flag)
  returns uint32
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_is_persistent (GimpParasite $parasite)
  returns uint32
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_is_type (GimpParasite $parasite, Str $name)
  returns uint32
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_is_undoable (GimpParasite $parasite)
  returns uint32
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_name (GimpParasite $parasite)
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_parasite_new (
  Str $name,
  guint32 $flags,
  guint32 $size,
  Pointer $data
)
  returns GimpParasite
  is native(gimpbase)
  is export
{ * }
