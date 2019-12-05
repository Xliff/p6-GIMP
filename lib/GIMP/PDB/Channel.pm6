use v6;

use GIMP::Raw::Types;

use GIMP::PDB::Raw::Channel;

use GLib::Roles::StaticClass;

class GIMP::PDB::Channel {
  also does GLib::Roles::StaticClass;

  # method new_channel (
  #   Int() $image_ID,
  #   Int() $width,
  #   Int() $height,
  #   Str() $name,
  #   Num() $opacity,
  #   GimpRGB $color
  # ) {
  #   my gint ($i, $w, $h) = ($image_ID, $width, $height);
  #   my gdouble $o = $opacity;
  #
  #   _gimp_channel_new($i, $w, $h, $name, $o, $color);
  # }

  method combine_masks (
    Int() $channel1_ID,
    Int() $channel2_ID,
    Int() $operation,
    Int() $offx,
    Int() $offy
  ) {
    my gint ($c1, $c2, $ox, $oy) = ($channel1_ID, $channel2_ID, $offx, $offy);
    my GimpChannelOps $o = $operation;

    gimp_channel_combine_masks($c1, $c2, $o, $ox, $oy);
  }

  method copy (Int() $channel_ID) {
    my gint $cid = $channel_ID;

    gimp_channel_copy($cid);
  }

  method get_color (Int() $channel_ID, GimpRGB $color) {
    my gint $cid = $channel_ID;

    gimp_channel_get_color($cid, $color);
  }

  method get_opacity (Int() $channel_ID) {
    my gint $cid = $channel_ID;

    gimp_channel_get_opacity($cid);
  }

  method get_show_masked (gint32 $channel_ID) {
    my gint $cid = $channel_ID;

    gimp_channel_get_show_masked($cid);
  }

  method new_from_component (Int() $image_ID, Int() $component, Str() $name) {
    my gint $iid = $image_ID;
    my GimpChannelType $c = $component;

    gimp_channel_new_from_component($iid, $c, $name);
  }

  method set_color (Int() $channel_ID, GimpRGB $color) {
    my gint $cid = $channel_ID;

    gimp_channel_set_color($channel_ID, $color);
  }

  method set_opacity (Int() $channel_ID, Num() $opacity) {
    my gint $cid = $channel_ID;
    my gdouble $o = $opacity;

    gimp_channel_set_opacity($channel_ID, $opacity);
  }

  method set_show_masked (Int() $channel_ID, Int() $show_masked) {
    my gint $cid = $channel_ID;
    my gboolean $s = so $show_masked;

    gimp_channel_set_show_masked($channel_ID, $s);
  }

}
