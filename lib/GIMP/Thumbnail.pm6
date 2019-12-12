use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Thumbnail;

use GTK::Compat::Pixbuf;

use GTK::Compat::Roles::Object;

class GIMP::Thumbnail {
  also does GTK::Compat::Roles::Object;

  has GimpThumbnail $!t;

  submethod BUILD (:$thumbnail) {
    $!t = $thumbnail;

    self.roleInit-Object;
  }

  method GIMP::Raw::Types::GimpThumbnail
  { $!t }

  multi method new (GimpThumbnail $thumbnail) {
    return Nil unless $thumbnail;
    self.bless( :$thumbnail );
  }
  multi method new {
    my $thumbnail = gimp_thumbnail_new();

    $thumbnail ?? self.bless( :$thumbnail ) !! Nil;
  }

  method check_thumb (Int() $size) {
    my GimpThumbSize $s = $size;

    GimpThumbStateEnum( gimp_thumbnail_check_thumb($!t, $s) );
  }

  method delete_failure {
    gimp_thumbnail_delete_failure($!t);
  }

  method delete_others (Int() $size) {
    my GimpThumbSize $s = $size;

    gimp_thumbnail_delete_others($!t, $s);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_thumbnail_get_type, $n, $t );
  }

  method has_failed {
    so gimp_thumbnail_has_failed($!t);
  }

  method load_thumb (
    Int() $size,
    CArray[Pointer[GError]] $error = gerror,
    :$raw = False
  ) {
    my GimpThumbSize $s = $size;

    clear_error;
    my $rv = gimp_thumbnail_load_thumb($!t, $s, $error);
    set_error($error);

    $rv ??
      ( $raw ?? $rv !! GTK::Compat::Pixbuf.new($rv) )
      !!
      Nil;
  }

  method peek_image {
    GimpThumbStateEnum( gimp_thumbnail_peek_image($!t) );
  }

  method peek_thumb (Int() $size) {
    my GimpThumbSize $s = $size;

    GimpThumbStateEnum( gimp_thumbnail_peek_thumb($!t, $s) );
  }

  method save_failure (
    Str() $software,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so gimp_thumbnail_save_failure($!t, $software, $error);
    set_error($error);
    $rv;
  }

  method save_thumb (
    GdkPixbuf() $pixbuf,
    Str() $software,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so gimp_thumbnail_save_thumb($!t, $pixbuf, $software, $error);
    set_error($error);
    $rv;
  }

  method save_thumb_local (
    GdkPixbuf() $pixbuf,
    Str() $software,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = gimp_thumbnail_save_thumb_local($!t, $pixbuf, $software, $error);
    set_error($error);
    $rv;
  }

  method set_filename (
    Str() $filename,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so gimp_thumbnail_set_filename($!t, $filename, $error);
    set_error($error);
    $rv;
  }

  method set_from_thumb (
    Str() $filename,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so gimp_thumbnail_set_from_thumb($!t, $filename, $error);
    set_error($error);
    $rv;
  }

  method set_uri (Str() $uri) {
    gimp_thumbnail_set_uri($!t, $uri);
  }

}
