use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Thumbnail;

use GTK::Compat::Pixbuf;

use GTK::Roles::Properties;

class GIMP::Thumbnail {
  also does GTK::Roles::Properties;

  has GimpThumbnail $!t;

  submethod BUILD (:$thumbnail) {
    $!t = $thumbnail;

    self.roleInit-Object;
  }

  method GIMP::Raw::Types::GimpThumbnail
  { $!t }

  # Type: gint64
  method image-filesize is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_INT64 );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('image-filesize', $gv)
        );
        $gv.int64;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int64 = $val;
        self.prop_set('image-filesize', $gv);
      }
    );
  }

  # Type: gint
  method image-height is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_INT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('image-height', $gv)
        );
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('image-height', $gv);
      }
    );
  }

  # Type: gchar
  method image-mimetype is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('image-mimetype', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('image-mimetype', $gv);
      }
    );
  }

  # Type: gint64
  method image-mtime is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_INT64 );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('image-mtime', $gv)
        );
        $gv.int64;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int64 = $val;
        self.prop_set('image-mtime', $gv);
      }
    );
  }

  # Type: gint
  method image-num-layers is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_INT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('image-num-layers', $gv)
        );
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('image-num-layers', $gv);
      }
    );
  }

  # Type: GimpThumbState
  method image-state is rw  {

    my GTK::Compat::Value $gv .= new( GIMP::Thumbnail::Enum.state_get_type );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('image-state', $gv)
        );
        GimpThumbStateEnum( $gv.enum );
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('image-state', $gv);
      }
    );
  }

  # Type: gchar
  method image-type is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('image-type', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('image-type', $gv);
      }
    );
  }

  # Type: gchar
  method image-uri is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('image-uri', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('image-uri', $gv);
      }
    );
  }

  # Type: gint
  method image-width is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_INT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('image-width', $gv)
        );
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('image-width', $gv);
      }
    );
  }

  # Type: GimpThumbState
  method thumb-state is rw  {
    my GTK::Compat::Value $gv .= new( GIMP::Thumbnail::Enum.state_get_type );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('thumb-state', $gv)
        );
        GimpThumbStateEnum( $gv.enum );
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('thumb-state', $gv);
      }
    );
  }

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

class GIMP::Thumbnail::Enum {

  method state_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_thumb_state_get_type, $n, $t );
  }

  method size_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_thumb_size_get_type, $n, $t );
  }

  method filetype_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_thumb_file_type_get_type, $n, $t );
  }

}
