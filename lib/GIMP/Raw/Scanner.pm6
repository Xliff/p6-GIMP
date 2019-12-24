use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::Raw::Scanner;

### /usr/include/gimp-2.0/libgimpconfig/gimpscanner.h

sub gimp_scanner_destroy (GScanner $scanner)
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_new_file (
  Str $filename,
  CArray[Pointer[GError]] $error
)
  returns GScanner
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_new_gfile (
  GFile $file,
  CArray[Pointer[GError]] $error
)
  returns GScanner
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_new_stream (
  GInputStream $input,
  CArray[Pointer[GError]] $error
)
  returns GScanner
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_new_string (
  Str $text,
  gint $text_len,
  CArray[Pointer[GError]] $error
)
  returns GScanner
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_boolean (GScanner $scanner, gboolean $dest)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_color (GScanner $scanner, GimpRGB $dest)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_data (GScanner $scanner, gint $length, guint8 $dest)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_float (GScanner $scanner, gdouble $dest is rw)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_identifier (GScanner $scanner, Str $identifier)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_int (GScanner $scanner, gint $dest is rw)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_int64 (GScanner $scanner, gint64 $dest is rw)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_matrix2 (GScanner $scanner, GimpMatrix2 $dest)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_string (GScanner $scanner, Str $dest)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_string_no_validate (GScanner $scanner, Str $dest)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_scanner_parse_token (GScanner $scanner, GTokenType $token)
  returns uint32
  is native(gimpconfig)
  is export
{ * }
