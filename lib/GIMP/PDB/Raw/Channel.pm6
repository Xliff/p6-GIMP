use v6;

use NativeCall;

use GTK::Compat::Types;

unit package GIMP::PDB::Raw::Channel;

### /usr/include/gimp-2.0/libgimp/gimpchannel_pdb.h

sub _gimp_channel_new (gint32 $image_ID, gint $width, gint $height, Str $name, gdouble $opacity, GimpRGB $color)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_combine_masks (gint32 $channel1_ID, gint32 $channel2_ID, impChannelOps $operation, gint $offx, gint $offy)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_copy (gint32 $channel_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_get_color (gint32 $channel_ID, impRGB $color)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_new_from_component (gint32 $image_ID, impChannelType $component, Str $name)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_set_color (gint32 $channel_ID, GimpRGB $color)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_get_opacity (gint32 $channel_ID)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_channel_get_show_masked (gint32 $channel_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_set_opacity (gint32 $channel_ID, gdouble $opacity)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_set_show_masked (gint32 $channel_ID, gboolean $show_masked)
  returns uint32
  is native(gimp)
  is export
{ * }

cbwood@Infinity4:~/Projects/p6-GIMP$ scripts/hMethodMaker-grammar.pl6 --bland --remove=gimp_channel_ --lib=gimp /usr/include/gimp-2.0/libgimp/gimpchannel_pdb.h
Removing non-conforming get:set color...
Removing non-conforming get:set opacity...
Removing non-conforming get:set show_masked...

GETSET
------

METHODS
-------
  method new (gint32 $image_ID, gint $width, gint $height, Str $name, gdouble $opacity, GimpRGB $color) {
    _gimp_channel_new($image_ID, $width, $height, $name, $opacity, $color);
  }

  method combine_masks (gint32 $channel1_ID, gint32 $channel2_ID, impChannelOps $operation, gint $offx, gint $offy) {
    gimp_channel_combine_masks($channel1_ID, $channel2_ID, $operation, $offx, $offy);
  }

  method copy (gint32 $channel_ID) {
    gimp_channel_copy($channel_ID);
  }

  method get_color (gint32 $channel_ID, impRGB $color) {
    gimp_channel_get_color($channel_ID, $color);
  }

  method get_opacity (gint32 $channel_ID) {
    gimp_channel_get_opacity($channel_ID);
  }

  method get_show_masked (gint32 $channel_ID) {
    gimp_channel_get_show_masked($channel_ID);
  }

  method new_from_component (gint32 $image_ID, impChannelType $component, Str $name) {
    gimp_channel_new_from_component($image_ID, $component, $name);
  }

  method set_color (gint32 $channel_ID, GimpRGB $color) {
    gimp_channel_set_color($channel_ID, $color);
  }

  method set_opacity (gint32 $channel_ID, gdouble $opacity) {
    gimp_channel_set_opacity($channel_ID, $opacity);
  }

  method set_show_masked (gint32 $channel_ID, gboolean $show_masked) {
    gimp_channel_set_show_masked($channel_ID, $show_masked);
  }


SUBS
----



### /usr/include/gimp-2.0/libgimp/gimpchannel_pdb.h

sub _gimp_channel_new (
  gint32 $image_ID,
  gint $width,
  gint $height,
  Str $name,
  gdouble $opacity,
  GimpRGB $color
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_combine_masks (
  gint32 $channel1_ID,
  gint32 $channel2_ID,
  GimpChannelOps $operation,
  gint $offx,
  gint $offy
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_copy (gint32 $channel_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_get_color (gint32 $channel_ID, GimpRGB $color)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_get_opacity (gint32 $channel_ID)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_channel_get_show_masked (gint32 $channel_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_new_from_component (
  gint32 $image_ID,
  GimpChannelType $component,
  Str $name
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_set_color (gint32 $channel_ID, GimpRGB $color)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_set_opacity (gint32 $channel_ID, gdouble $opacity)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_channel_set_show_masked (gint32 $channel_ID, gboolean $show_masked)
  returns uint32
  is native(gimp)
  is export
{ * }
