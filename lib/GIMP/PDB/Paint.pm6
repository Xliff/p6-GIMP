use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

use GIMP::PDB::Raw::Utils;
use GIMP::PDB::Raw::Paint;

use GLib::Roles::StaticClass;

class GIMP::PDB::Raw::Paint {
  also does GLib::Roles::StaticClass;

  method airbrush (
    Int() $drawable_ID,
    Num() $pressure,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;
    my gdouble $p = $pressure;

    gimp_airbrush($drawable_ID, $pressure, $num_strokes, $strokes);
  }

  method airbrush_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_airbrush_default($drawable_ID, $num_strokes, $strokes);
  }

  method clone (
    Int() $drawable_ID,
    Int() $src_drawable_ID,
    Int() $clone_type,
    Num() $src_x,
    Num() $src_y,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 ($d, $s) = ($drawable_ID, $src_drawable_ID);
    my GimpCloneType $c = $clone_type,
    my gint $n = $num_strokes;
    my gdouble ($sx, $sy) = ($src_x, $src_y);

    gimp_clone($drawable_ID, $src_drawable_ID, $clone_type, $src_x, $src_y, $num_strokes, $strokes);
  }

  method clone_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_clone_default($drawable_ID, $num_strokes, $strokes);
  }

  method convolve (
    Int() $drawable_ID,
    Num() $pressure,
    Int() $convolve_type,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gdouble $p = $pressure;
    my gint $n = $num_strokes;
    my GimpConvolveType $c = $convolve_type;

    gimp_convolve($drawable_ID, $pressure, $convolve_type, $num_strokes, $strokes);
  }

  method convolve_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_convolve_default($drawable_ID, $num_strokes, $strokes);
  }

  method dodgeburn (
    Int() $drawable_ID,
    Num() $exposure,
    Int() $dodgeburn_type,
    Int() $dodgeburn_mode,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;
    my gdouble $e = $exposure;
    my GimpDodgeBurnType $dt = $dodgeburn_type;
    my GimpTransferMode $dm = $dodgeburn_mode;

    gimp_dodgeburn($drawable_ID, $exposure, $dodgeburn_type, $dodgeburn_mode, $num_strokes, $strokes);
  }

  method dodgeburn_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_dodgeburn_default($drawable_ID, $num_strokes, $strokes);
  }

  method eraser (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes,
    Int() $hardness,
    Int() $method
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;
    my GimpBrushApplicationMode $h = $hardness;
    my GimpPaintApplicationMode $m = $method;

    gimp_eraser($drawable_ID, $num_strokes, $strokes, $hardness, $method);
  }

  method eraser_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_eraser_default($drawable_ID, $num_strokes, $strokes);
  }

  method heal (
    Int() $drawable_ID,
    Int() $src_drawable_ID,
    Num() $src_x,
    Num() $src_y,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 ($d, $s) = ($drawable_ID, $src_drawable_ID);
    my gdouble ($sx, $sy) = ($src_x, $src_y);
    my gint $n = $num_strokes;

    gimp_heal($drawable_ID, $src_drawable_ID, $src_x, $src_y, $num_strokes, $strokes);
  }

  method heal_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_heal_default($drawable_ID, $num_strokes, $strokes);
  }

  method paintbrush (
    Int() $drawable_ID,
    Num() $fade_out,
    Int() $num_strokes,
    CArray[gdouble] $strokes,
    Int() $method,
    Num() $gradient_length
  ) {
    my gint32 $d = $drawable_ID;
    my gdouble ($f, $g) = ($fade_out, $gradient_length);
    my gint $n = $num_strokes;
    my GimpPaintApplicationMode $m = $method;

    gimp_paintbrush($drawable_ID, $fade_out, $num_strokes, $strokes, $method, $gradient_length);
  }

  method paintbrush_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_paintbrush_default($drawable_ID, $num_strokes, $strokes);
  }

  method pencil (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_pencil($drawable_ID, $num_strokes, $strokes);
  }

  multi method smudge (
    Int() $drawable_ID,
    Num() $pressure,
    @strokes
  ) {
    samewith( $drawable_ID, $pressure, DoubleArrayToCArray(@strokes) );
  }
  method smudge (
    Int() $drawable_ID,
    Num() $pressure,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gdouble $p = $pressure;
    my gint $n = $num_strokes;

    gimp_smudge($drawable_ID, $pressure, $num_strokes, $strokes);
  }

  proto method smudge_default (|)
  { * }

  multi method smudge_default (Int() $drawable_ID, @strokes) {
    my gint32 $d = $drawable_ID;

    samewith( $drawable_ID, DoubleArrayToCArray(@strokes)
  }
  multi method smudge_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_smudge_default($drawable_ID, $num_strokes, $strokes);
  }

}
