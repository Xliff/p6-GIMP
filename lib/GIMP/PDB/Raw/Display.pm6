use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::Display;

### /usr/include/gimp-2.0/libgimp/gimpdisplay_pdb.h

sub gimp_display_delete (gint32 $display_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_display_get_window_handle (gint32 $display_ID)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_displays_flush ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_displays_reconnect (gint32 $old_image_ID, gint32 $new_image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_display_is_valid (gint32 $display_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_display_new (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }
