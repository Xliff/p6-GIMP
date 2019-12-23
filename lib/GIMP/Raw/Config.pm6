use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::Raw::Config;

### /usr/include/gimp-2.0/libgimpconfig/gimpconfig-iface.h

sub gimp_config_copy (GimpConfig $src, GimpConfig $dest, GParamFlags $flags)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_deserialize (
  GimpConfig $config,
  GScanner $scanner,
  gint $nest_level,
  gpointer $data
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_deserialize_file (
  GimpConfig $config,
  Str $filename,
  gpointer $data,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_deserialize_gfile (
  GimpConfig $config,
  GFile $file,
  gpointer $data,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_deserialize_return (
  GScanner $scanner,
  GTokenType $expected_token,
  gint $nest_level
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_deserialize_stream (
  GimpConfig $config,
  GInputStream $input,
  gpointer $data,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_deserialize_string (
  GimpConfig $config,
  Str $text,
  gint $text_len,
  gpointer $data,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_duplicate (GimpConfig $config)
  returns Pointer
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_get_type ()
  returns GType
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_is_equal_to (GimpConfig $a, GimpConfig $b)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_reset (GimpConfig $config)
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_serialize (
  GimpConfig $config,
  GimpConfigWriter $writer,
  gpointer $data
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_serialize_to_fd (GimpConfig $config, gint $fd, gpointer $data)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_serialize_to_file (
  GimpConfig $config,
  Str $filename,
  Str $header,
  Str $footer,
  gpointer $data,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_serialize_to_gfile (
  GimpConfig $config,
  GFile $file,
  Str $header,
  Str $footer,
  gpointer $data,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_serialize_to_stream (
  GimpConfig $config,
  GOutputStream $output,
  Str $header,
  Str $footer,
  gpointer $data,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_serialize_to_string (GimpConfig $config, gpointer $data)
  returns Str
  is native(gimpconfig)
  is export
{ * }
