use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::Raw::Thumbnail;

### /usr/include/gimp-2.0/libgimpthumb/gimpthumbnail.h

sub gimp_thumbnail_check_thumb (GimpThumbnail $thumbnail, GimpThumbSize $size)
  returns GimpThumbState
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_delete_failure (GimpThumbnail $thumbnail)
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_delete_others (GimpThumbnail $thumbnail, GimpThumbSize $size)
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_get_type ()
  returns GType
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_has_failed (GimpThumbnail $thumbnail)
  returns uint32
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_load_thumb (
  GimpThumbnail $thumbnail,
  GimpThumbSize $size,
  CArray[Pointer[GError]] $error
)
  returns GdkPixbuf
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_new ()
  returns GimpThumbnail
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_peek_image (GimpThumbnail $thumbnail)
  returns GimpThumbState
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_peek_thumb (GimpThumbnail $thumbnail, GimpThumbSize $size)
  returns GimpThumbState
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_save_failure (
  GimpThumbnail $thumbnail,
  Str $software,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_save_thumb (
  GimpThumbnail $thumbnail,
  GdkPixbuf $pixbuf,
  Str $software,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_save_thumb_local (
  GimpThumbnail $thumbnail,
  GdkPixbuf $pixbuf,
  Str $software,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_set_filename (
  GimpThumbnail $thumbnail,
  Str $filename,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_set_from_thumb (
  GimpThumbnail $thumbnail,
  Str $filename,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gimpthumb)
  is export
{ * }

sub gimp_thumbnail_set_uri (GimpThumbnail $thumbnail, Str $uri)
  is native(gimpthumb)
  is export
{ * }
