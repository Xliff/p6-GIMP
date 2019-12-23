use v6;

use NativeCall;

use GIMP::Raw::Types;

use GIMP::Raw::Config;

role GIMP::Roles::Config {
  has GimpConfig $!gc;

  method roleInit-Config {
    my \i = findProperImplementor(self.^attributes);

    die 'Cannot find implementor attribute' unless i;

    $!gc = cast( GimpConfig, i.get_value(self) );
  }

  method copy (GimpConfig() $dest, Int() $flags) {
    my GParamFlags $f = $flags;

    die "{ $dest } must be a { self.^name }!" unless $dest ~~ self.WHAT;

    gimp_config_copy($!gc, $dest, $f);
  }

  method deserialize (
    GScanner() $scanner,
    Int() $nest_level,
    gpointer $data = gpointer
  ) {
    my gint $n = $nest_level;

    so gimp_config_deserialize($!gc, $scanner, $n, $data);
  }

  method deserialize_file (
    Str() $filename,
    gpointer $data                 = gpointer,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so gimp_config_deserialize_file($!gc, $filename, $data, $error);
    set_error($error);
    $rv;
  }

  method deserialize_gfile (
    GFile() $file,
    gpointer $data                 = gpointer,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so gimp_config_deserialize_gfile($!gc, $file, $data, $error);
    set_error($error);
    $rv;
  }

  method deserialize_return (
    ::?CLASS:U:
    GScanner() $scanner,
    Int() $expected_token,
    Int() $nest_level
  ) {
    my GTokenType $e = $expected_token;
    my gint $n = $nest_level;

    gimp_config_deserialize_return($scanner, $e, $n);
  }

  method deserialize_stream (
    GInputStream $input,
    gpointer $data                 = gpointer,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = gimp_config_deserialize_stream($!gc, $input, $data, $error);
    set_error($error);
    $rv;
  }

  method deserialize_string (
    Str() $text,
    Int() $text_len,
    gpointer $data                 = gpointer,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my gint $t = $text_len;

    clear_error;
    my $rv = so gimp_config_deserialize_string(
      $!gc,
      $text,
      $t,
      $data,
      $error
    );
    set_error($error);
    $rv;
  }

  method duplicate {
    ::?CLASS.new( gimp_config_duplicate($!gc) );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_config_get_type, $n, $t );
  }

  method is_equal_to (GimpConfig() $b) {
    so gimp_config_is_equal_to($!gc, $b);
  }

  method reset {
    gimp_config_reset($!gc);
  }

  method serialize (GimpConfigWriter $writer, gpointer $data) {
    gimp_config_serialize($!gc, $writer, $data);
  }

  method serialize_to_fd (Int() $fd, gpointer $data = gpointer) {
    my gint $f = $fd;

    so gimp_config_serialize_to_fd($!gc, $f, $data);
  }

  method serialize_to_file (
    Str() $filename,
    Str() $header,
    Str() $footer,
    gpointer $data,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = gimp_config_serialize_to_file(
      $!gc,
      $filename,
      $header,
      $footer,
      $data,
      $error
    );
    set_error($error);
    $rv;
  }

  method serialize_to_gfile (
    GFile() $file,
    Str $header,
    Str $footer,
    gpointer $data,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so gimp_config_serialize_to_gfile(
      $!gc,
      $file,
      $header,
      $footer,
      $data,
      $error
    );
    set_error($error);
    $rv;
  }

  method serialize_to_stream (
    GOutputStream() $output,
    Str() $header,
    Str() $footer,
    gpointer $data,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so gimp_config_serialize_to_stream(
      $!gc,
      $output,
      $header,
      $footer,
      $data,
      $error
    );
    set_error($error);
    $rv;
  }

  method serialize_to_string (gpointer $data) {
    gimp_config_serialize_to_string($!gc, $data);
  }

}
