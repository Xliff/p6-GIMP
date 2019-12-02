use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

unit package GIMP::PDB::Raw::Paint;

### /usr/include/gimp-2.0/libgimp/gimppainttools_pdb.h

sub gimp_airbrush (
  gint32 $drawable_ID,
  gdouble $pressure,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_airbrush_default (
  gint32 $drawable_ID,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_clone (
  gint32 $drawable_ID,
  gint32 $src_drawable_ID,
  GimpCloneType $clone_type,
  gdouble $src_x,
  gdouble $src_y,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_clone_default (
  gint32 $drawable_ID,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_convolve (
  gint32 $drawable_ID,
  gdouble $pressure,
  GimpConvolveType $convolve_type,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_convolve_default (
  gint32 $drawable_ID,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_dodgeburn (
  gint32 $drawable_ID,
  gdouble $exposure,
  GimpDodgeBurnType $dodgeburn_type,
  GimpTransferMode $dodgeburn_mode,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_dodgeburn_default (
  gint32 $drawable_ID,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_eraser (
  gint32 $drawable_ID,
  gint $num_strokes,
  CArray[gdouble] $strokes,
  GimpBrushApplicationMode $hardness,
  GimpPaintApplicationMode $method
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_eraser_default (
  gint32 $drawable_ID,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_heal (
  gint32 $drawable_ID,
  gint32 $src_drawable_ID,
  gdouble $src_x,
  gdouble $src_y,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_heal_default (
  gint32 $drawable_ID,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_paintbrush (
  gint32 $drawable_ID,
  gdouble $fade_out,
  gint $num_strokes,
  CArray[gdouble] $strokes,
  GimpPaintApplicationMode $method,
  gdouble $gradient_length
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_paintbrush_default (
  gint32 $drawable_ID,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_pencil (
  gint32 $drawable_ID,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_smudge (
  gint32 $drawable_ID,
  gdouble $pressure,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_smudge_default (
  gint32 $drawable_ID,
  gint $num_strokes,
  CArray[gdouble] $strokes
)
  returns uint32
  is native(gimp)
  is export
{ * }
