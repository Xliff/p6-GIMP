use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

use GIMP::PDB::Raw::Utils;
use GIMP::PDB::Raw::Paint;

use GLib::Roles::StaticClass;

class GIMP::PDB::Raw::Paint {
  also does GLib::Roles::StaticClass;

  multi method airbrush (
    Int() $drawable_ID,
    Num() $pressure
  ) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, $pressure, @strokes.elems, $ca);
  }
  multi method airbrush (
    Int() $drawable_ID,
    Num() $pressure,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;
    my gdouble $p = $pressure;

    gimp_airbrush($d, $p, $n, $strokes);
  }

  multi method airbrush_default (Int() $drawable_ID, @strokes) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, @strokes.elems, $ca);
  }
  multi method airbrush_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_airbrush_default($d, $n, $strokes);
  }

  multi method clone (
    Int() $drawable_ID,
    Int() $src_drawable_ID,
    Int() $clone_type,
    Num() $src_x,
    Num() $src_y
  ) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith(
      $drawable_ID,
      $src_drawable_ID,
      $clone_type,
      $src_x,
      $src_y,
      @strokes.elems,
      $ca
    );
  }
  multi method clone (
    Int() $drawable_ID,
    Int() $src_drawable_ID,
    Int() $clone_type,
    Num() $src_x,
    Num() $src_y,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 ($d, $n) = ($drawable_ID, $src_drawable_ID);
    my GimpCloneType $c = $clone_type,
    my gint $n = $num_strokes;
    my gdouble ($sx, $sy) = ($src_x, $src_y);

    gimp_clone($d, $s, $c, $sx, $sy, $n, $strokes);
  }

  proto method clone_default (|)
  { * }

  multi method clone_default (Int() $drawable_ID, @strokes) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, @strokes.elems, @strokes);
  }
  multi method clone_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_clone_default($d, $n, $strokes);
  }

  multi method convolve (
    Int() $drawable_ID,
    Num() $pressure,
    Int() $convolve_type,
    @strokes
  ) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, $pressure, $convolve_type, @strokes.elems, $ca);
  }
  multi method convolve (
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

    gimp_convolve($d, $p, $c, $n, $strokes);
  }

  proto method convolve_default (|)
  { * }

  method convolve_default (Int() $drawable_ID, @strokes) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, @strokes.elems, $ca);
  }
  method convolve_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_convolve_default($d, $n, $strokes);
  }

  multi method dodgeburn (
    Int() $drawable_ID,
    Num() $exposure,
    Int() $dodgeburn_type,
    Int() $dodgeburn_mode,
    @strokes
  ) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith(
      $drawable_ID,
      $exposure,
      $dodgeburn_type,
      $dodgeburn_mode,
      @strokes.elems,
      $ca
    );
  }
  multi method dodgeburn (
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

    gimp_dodgeburn($d, $e, $dt, $dm, $n, $strokes);
  }

  proto method dodgeburn_default (|)
  { * }

  multi method dodgeburn_default (Int() $drawable_ID, @strokes) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, @strokes.elems, $ca);
  }
  multi method dodgeburn_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_dodgeburn_default($d, $n, $strokes);
  }

  multi method eraser (
    Int() $drawable_ID,
    Int() $hardness,
    Int() $method,
    @strokes
  ) {
    my $ca = DoubleArrayToCArray(@stokes);

    samewith($drawable_ID, @strokes.elems, $ca, $hardness, $method);
  }
  multi method eraser (
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

    gimp_eraser($d, $n, $strokes, $h, $m);
  }

  proto method eraser_default (|)
  { * }

  multi method eraser_default (Int() $drawable_ID, @strokes) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, @strokes.elems, $ca);
  }
  multi method eraser_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_eraser_default($d, $n, $strokes);
  }

  multi method heal (
    Int() $drawable_ID,
    Int() $src_drawable_ID,
    Num() $src_x,
    Num() $src_y,
    @strokes
  ) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith(
      $drawable_ID,
      $src_drawable_ID,
      $src_x,
      $src_y,
      @strokes.elems,
      $ca
    );
  }
  multi method heal (
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

    gimp_heal($d, $s, $sx, $sy, $n, $strokes);
  }

  proto method heal_default (|)
  { * }

  multi method heal_default (Int() $drawable_ID, @strokes) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, @strokes.elems, $ca);
  }
  multi method heal_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_heal_default($d, $n, $strokes);
  }

  multi method paintbrush (
    Int() $drawable_ID,
    Num() $fade_out,
    Int() $method,
    Num() $gradient_length,
    @strokes
  ) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith(
      $drawable_ID,
      $fade_out,
      @strokes.elems,
      $ca,
      $method,
      $gradient_length
    );
  }
  multi method paintbrush (
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

    gimp_paintbrush($d, $f, $n, $strokes, $m, $g);
  }

  proto method paintbrush_default (|)
  { * }

  multi method paintbrush_default (Int() $drawable_ID, @strokes) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, @strokes.elems, $ca);
  }
  multi method paintbrush_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_paintbrush_default($d, $n, $strokes);
  }

  multi method pencil (Int() $drawable_ID, @strokes) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, @strokes.elems, $ca);
  }
  multi method pencil (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_pencil($d, $n, $strokes);
  }

  multi method smudge (
    Int() $drawable_ID,
    Num() $pressure,
    @strokes
  ) {
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, $pressure, @strokes.elems, $ca);
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

    gimp_smudge($d, $p, $n, $strokes);
  }

  proto method smudge_default (|)
  { * }

  multi method smudge_default (Int() $drawable_ID, @strokes) {
    my gint32 $d = $drawable_ID;
    my $ca = DoubleArrayToCArray(@strokes);

    samewith($drawable_ID, @strokes.elems, $ca);
  }
  multi method smudge_default (
    Int() $drawable_ID,
    Int() $num_strokes,
    CArray[gdouble] $strokes
  ) {
    my gint32 $d = $drawable_ID;
    my gint $n = $num_strokes;

    gimp_smudge_default($d, $n, $strokes);
  }

}
