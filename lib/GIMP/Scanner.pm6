use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Scanner;

# WRAPPER! -- there is no "GimpScanner".

use GLib::Scanner;

class GIMP::Scanner is GLib::Scanner {

  method new_file (Str() $filename, CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $scanner = gimp_scanner_new_file($filename, $error);
    set_error($error);

    $scanner ?? self.bless(:$scanner) !! Nil;
  }

  method new_gfile (GFile $file, CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $scanner = gimp_scanner_new_gfile($file, $error);
    set_error($error);

    $scanner ?? self.bless(:$scanner) !! Nil;
  }

  method new_stream (
    GInputStream $input,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $scanner = gimp_scanner_new_stream($input, $error);
    set_error($error);

    $scanner ?? self.bless(:$scanner) !! Nil;
  }

  method new_string (
    Str() $text,
    Int() $text_len = -1,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my gint $t = $text_len;
    clear_error;
    my $scanner = gimp_scanner_new_string(self.GScanner, $text, $t, $error);
    set_error($error);

    $scanner ?? self.bless(:$scanner) !! Nil;
  }

  method destroy {
    gimp_scanner_destroy(self.GScanner);
  }

  proto method parse_boolean (|)
  { * }

  multi method parse_boolean {
    samewith($);
  }
  multi method parse_boolean ($dest is rw) {
    my gboolean $d = 0;
    my $rv = gimp_scanner_parse_boolean(self.GScanner, $d);

    $dest = $rv ?? $d !! Nil;
  }

  proto method parse_color (|)
  { * }

  multi method parse_color {
    samewith($);
  }
  multi method parse_color ($dest is rw) {
    my $d = GimpRGB.new;
    my $rv = gimp_scanner_parse_color(self.GScanner, $d);

    $dest = $rv ?? $d !! Nil;
  }

  proto method parse_data (|)
  { * }

  multi method parse_data (Int() $length) {
    samewith($length, $);
  }
  multi method parse_data (Int() $length, $dest is rw) {
    my gint $l = $length;
    my $d = CArray[uint8].new;
    $d[0] = 0;
    my $rv = gimp_scanner_parse_data(self.GScanner, $length, $d);

    $dest = $rv ?? Buf.new($d) !! Nil;
  }

  proto method parse_float (|)
  { * }

  multi method parse_float {
    samewith($);
  }
  multi method parse_float ($dest is rw) {
    my gdouble $d = 0e0;

    my $rv = gimp_scanner_parse_float(self.GScanner, $d);
    $dest = $rv ?? $d !! Nil
  }

  proto method parse_identifier (|)
  { * }

  multi method parse_identifier {
    samewith($);
  }
  multi method parse_identifier ($identifier is rw) {
    my $i = Pointer.new;
    my $rv = gimp_scanner_parse_identifier(self.GScanner, $i);

    $identifier = $rv ?? cast(Str, $i) !! Nil
  }

  proto method parse_int (|)
  { * }

  multi method parse_int {
    samewith($);
  }
  multi method parse_int ($dest is rw) {
    my gint $d = 0;
    my $rv = gimp_scanner_parse_int(self.GScanner, $d);

    $dest = $rv ?? $d !! Nil;
  }

  proto method parse_int64 (|)
  { * }

  multi method parse_int64 {
    samewith($);
  }
  multi method parse_int64 ($dest is rw) {
    my gint64 $d = 0;
    my $rv = gimp_scanner_parse_int64(self.GScanner, $d);

    $dest = $rv ?? $d !! Nil;
  }

  proto method parse_matrix2 (|)
  { * }

  multi method parse_matrix2 {
    samewith($);
  }
  multi method parse_matrix2 ($dest is rw) {
    my $d = GimpMatrix2.new;
    my $rv = gimp_scanner_parse_matrix2(self.GScanner, $d);

    $dest = $rv ?? $d !! Nil;
  }

  proto method parse_string (|)
  { * }

  multi method parse_string {
    samewith($);
  }
  multi method parse_string ($dest is rw) {
    my $d = CArray[CArray[Str]];
    $d[0] = Str;

    my $rv = gimp_scanner_parse_string(self.GScanner, $d);
    $dest = $rv ?? $d[0] !! Nil;
  }

  proto method parse_string_no_validate (|)
  { * }

  multi method parse_string_no_validate {
    samewith($);
  }
  multi method parse_string_no_validate ($dest is rw) {
    my $d = CArray[CArray[Str]];
    $d[0] = Str;

    my $rv = gimp_scanner_parse_string_no_validate(self.GScanner, $d);
    $dest = $rv ?? $d[0] !! Nil;
  }

  proto method parse_token (|)
  { * }

  multi method parse_token {
    samewith($);
  }
  multi method parse_token ($dest is rw) {
    my GTokenType $d = 0;
    my $rv = gimp_scanner_parse_token(self.GScanner, $d);

    $dest = $rv ?? $d !! Nil
  }

}
