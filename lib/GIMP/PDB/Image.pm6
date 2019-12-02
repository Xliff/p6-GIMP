use v6;

use GTK::Compat::Types;

use GIMP::Raw::Enums;
use GIMP::Raw::Structs;

use GIMP::PDB::Raw::Image;

use GLib::Roles::StaticClass;

class GIMP::PDB::Image {
  also does GLib::Roles::StaticClass;

  method convert_color_profile_from_file (
    Int() $image_ID,
    Str $uri,
    Int() $intent,
    Int() $bpc
  ) {
    my gint32 $i = $image_ID;
    my GimpColorRenderingIntent $in = $intent,
    my gboolean $b = (so $bpc).Int;

    gimp_image_convert_color_profile_from_file($i, $uri, $in, $b);
  }

  method set_color_profile_from_file (
    Int() $image_ID,
    Str() $uri
  ) {
    my gint32 $i = $image_ID;

    gimp_image_set_color_profile_from_file($i, $uri);
  }
