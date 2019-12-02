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
