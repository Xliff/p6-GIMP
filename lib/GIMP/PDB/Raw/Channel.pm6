use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::Channel;


### /usr/include/gimp-2.0/libgimp/gimpchannel_pdb.h

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
