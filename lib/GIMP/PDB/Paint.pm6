use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

use GIMP::PDB::Raw::Utils;
use GIMP::PDB::Raw::Paint;

use GLib::Roles::StaticClass;

class GIMP::PDB::Raw::Paint {
  also does GLib::Roles::StaticClass;

  method airbrush (gint32 $drawable_ID, gdouble $pressure, gint $num_strokes, gdouble $strokes) {
    gimp_airbrush($drawable_ID, $pressure, $num_strokes, $strokes);
  }

  method airbrush_default (gint32 $drawable_ID, gint $num_strokes, gdouble $strokes) {
    gimp_airbrush_default($drawable_ID, $num_strokes, $strokes);
  }

  method clone (gint32 $drawable_ID, gint32 $src_drawable_ID, GimpCloneType $clone_type, gdouble $src_x, gdouble $src_y, gint $num_strokes, gdouble $strokes) {
    gimp_clone($drawable_ID, $src_drawable_ID, $clone_type, $src_x, $src_y, $num_strokes, $strokes);
  }

  method clone_default (gint32 $drawable_ID, gint $num_strokes, gdouble $strokes) {
    gimp_clone_default($drawable_ID, $num_strokes, $strokes);
  }

  method convolve (gint32 $drawable_ID, gdouble $pressure, GimpConvolveType $convolve_type, gint $num_strokes, gdouble $strokes) {
    gimp_convolve($drawable_ID, $pressure, $convolve_type, $num_strokes, $strokes);
  }

  method convolve_default (gint32 $drawable_ID, gint $num_strokes, gdouble $strokes) {
    gimp_convolve_default($drawable_ID, $num_strokes, $strokes);
  }

  method dodgeburn (gint32 $drawable_ID, gdouble $exposure, GimpDodgeBurnType $dodgeburn_type, GimpTransferMode $dodgeburn_mode, gint $num_strokes, gdouble $strokes) {
    gimp_dodgeburn($drawable_ID, $exposure, $dodgeburn_type, $dodgeburn_mode, $num_strokes, $strokes);
  }

  method dodgeburn_default (gint32 $drawable_ID, gint $num_strokes, gdouble $strokes) {
    gimp_dodgeburn_default($drawable_ID, $num_strokes, $strokes);
  }

  method eraser (gint32 $drawable_ID, gint $num_strokes, gdouble $strokes, GimpBrushApplicationMode $hardness, GimpPaintApplicationMode $method) {
    gimp_eraser($drawable_ID, $num_strokes, $strokes, $hardness, $method);
  }

  method eraser_default (gint32 $drawable_ID, gint $num_strokes, gdouble $strokes) {
    gimp_eraser_default($drawable_ID, $num_strokes, $strokes);
  }

  method heal (gint32 $drawable_ID, gint32 $src_drawable_ID, gdouble $src_x, gdouble $src_y, gint $num_strokes, gdouble $strokes) {
    gimp_heal($drawable_ID, $src_drawable_ID, $src_x, $src_y, $num_strokes, $strokes);
  }

  method heal_default (gint32 $drawable_ID, gint $num_strokes, gdouble $strokes) {
    gimp_heal_default($drawable_ID, $num_strokes, $strokes);
  }

  method paintbrush (gint32 $drawable_ID, gdouble $fade_out, gint $num_strokes, gdouble $strokes, GimpPaintApplicationMode $method, gdouble $gradient_length) {
    gimp_paintbrush($drawable_ID, $fade_out, $num_strokes, $strokes, $method, $gradient_length);
  }

  method paintbrush_default (gint32 $drawable_ID, gint $num_strokes, gdouble $strokes) {
    gimp_paintbrush_default($drawable_ID, $num_strokes, $strokes);
  }

  method pencil (gint32 $drawable_ID, gint $num_strokes, gdouble $strokes) {
    gimp_pencil($drawable_ID, $num_strokes, $strokes);
  }

  method smudge (gint32 $drawable_ID, gdouble $pressure, gint $num_strokes, gdouble $strokes) {
    gimp_smudge($drawable_ID, $pressure, $num_strokes, $strokes);
  }

  method smudge_default (gint32 $drawable_ID, gint $num_strokes, gdouble $strokes) {
    gimp_smudge_default($drawable_ID, $num_strokes, $strokes);
  }

}
