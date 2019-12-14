use v6;

use NativeCall;

use GIMP::Raw::Types;

use GLib::Roles::StaticClass;

class GIMP::PDB::TextTool {
  also does GLib::Roles::StaticClass;

  method fontname (
    Int() $image_ID,
    Int() $drawable_ID,
    Num() $x,
    Num() $y,
    Str() $text,
    Int() $border,
    Int() $antialias,
    Num() $size,
    Int() $size_type,
    Str() $fontname
  ) {
    my gint32 ($i, $d) = ($image_ID, $drawable_ID);
    my gint $b = $border;
    my gdouble ($xx, $yy, $s) = ($x, $y, $size);
    my gboolean $a = (so $antialias).Int;
    my GimpSizeType $st = $size_type;

    gimp_text_fontname($i, $d, $xx, $yy, $text, $b, $a, $s, $st, $fontname);
  }

  proto method get_extents_fontname (|)
  { * }

  multi method get_extents_fontname (
    Str() $text,
    Num() $size,
    Int() $size_type,
    Str() $fontname,
    :$all = True
  ) {
    samewith($text, $size, $size_type, $fontname, $, $, $, $, :$all);
  }
  multi method get_extents_fontname (
    Str() $text,
    Num() $size,
    Int() $size_type,
    Str() $fontname,
    $width   is rw,
    $height  is rw,
    $ascent  is rw,
    $descent is rw,
    :$all = False
  ) {
    my gdouble $s = $size;
    my GimpSizeType $st = $size_type;
    my gint ($w, $h, $a, $d) = ($width, $height, $ascent, $descent);
    my $rv = gimp_text_get_extents_fontname(
      $text,
      $s,
      $st,
      $fontname,
      $w,
      $h,
      $a,
      $d
    );
    ($width, $height, $ascent, $descent) = ($w, $h, $a, $d);
    $all.not ?? $rv !! ($rv, $width, $height, $ascent, $descent);
  }
}

### /usr/include/gimp-2.0/libgimp/gimptexttool_pdb.h

sub gimp_text_fontname (
  gint32 $image_ID,
  gint32 $drawable_ID,
  gdouble $x,
  gdouble $y,
  Str $text,
  gint $border,
  gboolean $antialias,
  gdouble $size,
  GimpSizeType $size_type,
  Str $fontname
)
  returns gint32
  is native(gimp)
  is export
{ * }


sub gimp_text_get_extents_fontname (
  Str $text,
  gdouble $size,
  GimpSizeType $size_type,
  Str $fontname,
  gint $width is rw,
  gint $height is rw,
  gint $ascent is rw,
  gint $descent is rw
)
  returns uint32
  is native(gimp)
  is export
{ * }
