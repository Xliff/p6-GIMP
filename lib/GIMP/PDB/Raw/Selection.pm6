use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::Selection;

### /usr/include/gimp-2.0/libgimp/gimpselection_pdb.h
### /usr/include/gimp-2.0/libgimp/gimpselection.h

sub gimp_selection_all (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_border (gint32 $image_ID, gint $radius)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_bounds (
  gint32 $image_ID,
  gboolean $non_empty,
  gint $x1 is rw,
  gint $y1 is rw,
  gint $x2 is rw,
  gint $y2 is rw
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_feather (gint32 $image_ID, gdouble $radius)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_float (
  gint32 $image_ID,
  gint32 $drawable_ID,
  gint $offx,
  gint $offy
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_flood (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_grow (gint32 $image_ID, gint $steps)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_invert (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_is_empty (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_none (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_save (gint32 $image_ID)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_sharpen (gint32 $image_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_shrink (gint32 $image_ID, gint $steps)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_translate (gint32 $image_ID, gint $offx, gint $offy)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_selection_value (gint32 $image_ID, gint $x, gint $y)
  returns gint
  is native(gimp)
  is export
{ * }
