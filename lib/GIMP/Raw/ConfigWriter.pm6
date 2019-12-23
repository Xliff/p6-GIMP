use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::Raw::ConfigWriter;

### /usr/include/gimp-2.0/libgimpconfig/gimpconfigwriter.h

sub gimp_config_writer_close (GimpConfigWriter $writer)
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_comment (GimpConfigWriter $writer, Str $comment)
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_comment_mode (
  GimpConfigWriter $writer,
  gboolean $enable
)
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_data (
  GimpConfigWriter $writer,
  gint $length,
  guint8 $data is rw
)
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_finish (
  GimpConfigWriter $writer,
  Str $footer,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_identifier (GimpConfigWriter $writer, Str $identifier)
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_linefeed (GimpConfigWriter $writer)
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_new_fd (gint $fd)
  returns GimpConfigWriter
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_new_file (
  Str $filename,
  gboolean $atomic,
  Str $header,
  CArray[Pointer[GError]] $error
)
  returns GimpConfigWriter
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_new_gfile (
  GFile $file,
  gboolean $atomic,
  Str $header,
  CArray[Pointer[GError]] $error
)
  returns GimpConfigWriter
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_new_stream (
  GOutputStream $output,
  Str $header,
  CArray[Pointer[GError]] $error
)
  returns GimpConfigWriter
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_new_string (GString $string)
  returns GimpConfigWriter
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_open (GimpConfigWriter $writer, Str $name)
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_print (GimpConfigWriter $writer, Str $string, gint $len)
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_revert (GimpConfigWriter $writer)
  is native(gimpconfig)
  is export
{ * }

sub gimp_config_writer_string (GimpConfigWriter $writer, Str $string)
  is native(gimpconfig)
  is export
{ * }
