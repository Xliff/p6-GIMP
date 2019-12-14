use v6;

use NativeCall;

use GIMP::Raw::Types;

### /usr/include/gimp-2.0/libgimp/gimpedit_pdb.h

sub gimp_edit_copy (gint32 $drawable_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_edit_copy_visible (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_edit_cut (gint32 $drawable_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_edit_named_copy (gint32 $drawable_ID, Str $buffer_name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_edit_named_copy_visible (gint32 $image_ID, Str $buffer_name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_edit_named_cut (gint32 $drawable_ID, Str $buffer_name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_edit_named_paste (
  gint32 $drawable_ID,
  Str $buffer_name,
  gboolean $paste_into
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_edit_named_paste_as_new_image (Str $buffer_name)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_edit_paste (gint32 $drawable_ID, gboolean $paste_into)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_edit_paste_as_new_image ()
  returns gint32
  is native(gimp)
  is export
{ * }
