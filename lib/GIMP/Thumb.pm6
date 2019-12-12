use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Thumb;

use GLib::Roles::StaticClass;

class GIMP::Thumb {
  also does GLib::Roles::StaticClass;

  method ensure_thumb_dir (
    Int() $size,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my GimpThumbSize $s = $size;

    clear_error;
    my $rv = so gimp_thumb_ensure_thumb_dir($s, $error);
    set_error($error);
    $rv;
  }

  method ensure_thumb_dir_local (
    Str() $dirname,
    Int() $size,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my GimpThumbSize $s = $size;

    clear_error;
    my $rv = so gimp_thumb_ensure_thumb_dir_local($dirname, $s, $error);
    set_error($error);
    $rv;
  }

  proto method file_test (|)
  { * }

  multi method file_test (Str() $filename) {
    samewith($filename, $, $, $);
  }
  multi method file_test (
    Str() $filename,
    $mtime  is rw,
    $size   is rw,
    $err_no is rw
  ) {
    my gint64 ($m, $s) = 0;
    my gint $e = $0;

    gimp_thumb_file_test($filename, $m, $s, $e);
    ($mtime, $size, $err_no) = ($m, $s, $e);
  }

  method find_thumb (Str() $uri, Int() $size) {
    my GimpThumbSize $s = $size;

    gimp_thumb_find_thumb($uri, $s);
  }

  method get_thumb_base_dir {
    gimp_thumb_get_thumb_base_dir();
  }

  method get_thumb_dir (Int() $size) {
    my GimpThumbSize $s = $size;

    gimp_thumb_get_thumb_dir($s);
  }

  method get_thumb_dir_local (Str() $dirname, Int() $size) {
    my GimpThumbSize $s = $size;

    gimp_thumb_get_thumb_dir_local($dirname, $s);
  }

  method init (Str() $creator, Str() $thumb_basedir) {
    so gimp_thumb_init($creator, $thumb_basedir);
  }

  method name_from_uri (Str() $uri, Int() $size) {
    my GimpThumbSize $s = $size;

    gimp_thumb_name_from_uri($uri, $s);
  }

  method name_from_uri_local (Str() $uri, Int() $size) {
    my GimpThumbSize $s = $size;

    gimp_thumb_name_from_uri_local($uri, $s);
  }

}

class GIMP::Thumbs {
  also does GLib::Roles::StaticClass;

  method delete_for_uri (Str() $uri) {
    gimp_thumbs_delete_for_uri($uri);
  }

  method delete_for_uri_local (Str() $uri) {
    gimp_thumbs_delete_for_uri_local($uri);
  }
}
