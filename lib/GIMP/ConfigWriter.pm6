use v6;

use NativeCall;

use GIMP::Raw::Types;

use GIMP::Raw::ConfigWriter;

class GIMP::ConfigWriter {
  has GimpConfigWriter $!gcw;

  submethod BUILD (:$writer) {
    $!gcw = $writer;
  }

  submethod GIMP::Raw::Definitions::GimpConfigWriter
  { $!gcw }

  method new_fd (Int() $fd) {
    my gint $f = $fd;
    my $writer = gimp_config_writer_new_fd($fd);

    $writer ?? self.bless( :$writer ) !! Nil;
  }

  method new_file (
    Str() $filename,
    Int() $atomic,
    Str() $header,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my gboolean $a = $atomic.so.Int;
    clear_error;
    my $writer = gimp_config_writer_new_file($filename, $a, $header, $error);
    set_error($error);

    $writer ?? self.bless( :$writer ) !! Nil;
  }

  method new_gfile (
    GFile() $file,
    Int() $atomic,
    Str() $header,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my gboolean $a = $atomic.so.Int;
    clear_error;
    my $writer = gimp_config_writer_new_gfile($file, $a, $header, $error);
    set_error($error);

    $writer ?? self.bless( :$writer ) !! Nil;
  }

  method new_stream (
    GOutputStream() $stream,
    Str() $header,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $writer = gimp_config_writer_new_stream($stream, $header, $error);
    set_error($error);

    $writer ?? self.bless( :$writer ) !! Nil;
  }

  method new_string (GString() $string) {
    my $writer = gimp_config_writer_new_string($string);

    $writer ?? self.bless( :$writer ) !! Nil;
  }

  method close {
    gimp_config_writer_close($!gcw);
  }

  method comment (Str() $comment) {
    gimp_config_writer_comment($!gcw, $comment);
  }

  method comment_mode (Int() $enable) {
    my gboolean $e = $enable.so.Int;

    gimp_config_writer_comment_mode($!gcw, $e);
  }

  method data (Int() $length, $data is rw) {
    my gint $l = $length;
    my guint8 $d = $data;

    gimp_config_writer_data($!gcw, $l, $d);
    $data = $d;
  }

  method finish (Str() $footer, CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $rv = so gimp_config_writer_finish($!gcw, $footer, $error);
    set_error($error);
    $rv;
  }

  method identifier (Str() $identifier) {
    gimp_config_writer_identifier($!gcw, $identifier);
  }

  method linefeed {
    gimp_config_writer_linefeed($!gcw);
  }

  method open (Str() $name) {
    gimp_config_writer_open($!gcw, $name);
  }

  method print (Str() $string, Int() $len = -1) {
    my gint $l = $len;

    gimp_config_writer_print($!gcw, $string, $len);
  }

  method revert {
    gimp_config_writer_revert($!gcw);
  }

  method string (Str() $string) {
    gimp_config_writer_string($!gcw, $string);
  }

}
