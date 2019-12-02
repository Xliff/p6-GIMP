use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;
use GIMP::Raw::Structs;

unit package GIMP::PDB::Raw::Image;

### /usr/include/gimp-2.0/libgimp/gimpimagecolorprofile_pdb.h

sub gimp_image_convert_color_profile_from_file (
  gint32 $image_ID,
  Str $uri,
  GimpColorRenderingIntent $intent,
  gboolean $bpc
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_set_color_profile_from_file (gint32 $image_ID, Str $uri)
  returns uint32
  is native(gimp)
  is export
{ * }

### /usr/include/gimp-2.0/libgimp/gimpimageconvert_pdb.h

sub gimp_image_convert_grayscale (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_convert_indexed (
  gint32 $image_ID,
  GimpConvertDitherType $dither_type,
  GimpConvertPaletteType $palette_type,
  gint $num_cols,
  gboolean $alpha_dither,
  gboolean $remove_unused,
  Str $palette
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_convert_precision (gint32 $image_ID, GimpPrecision $precision)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_convert_rgb (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_image_convert_set_dither_matrix (
  gint $width,
  gint $height,
  gint $matrix_length,
  CArray[guint8] $matrix
)
  returns uint32
  is native(gimp)
  is export
{ * }
