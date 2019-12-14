use v6.c;

use NativeCall;

use GIMP::Raw::Types;

use GLib::Roles::StaticClass;
use GIMP::PDB::Roles::Assumable;

class GIMP::PDB::Pattern {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  proto method get_info (|)
  { * }

  multi method get_info (Str() $name, :$all = True) {
    samewith($name, $, $, $, :$all);
  }
  multi method get_info (
    Str() $name,
    $width  is rw,
    $height is rw,
    $bpp    is rw,
    :$all = False
  ) {
    my gint ($w, $h, $b) = 0 xx 3;
    my $rv = gimp_pattern_get_info($name, $w, $h, $b);

    ($width, $height, $bpp) = ($w, $h, $b);
    $all.not ?? $rv !! ($rv, $width, $height, $bpp);
  }

  proto method get_pixels (|)
  { * }

  multi method get_pixels (Str() $name, :$all = True) {
    samewith($name, $, $, $, $, $, :$all);
  }
  multi method get_pixels (
    Str() $name,
    $width           is rw,
    $height          is rw,
    $bpp             is rw,
    $num_color_bytes is rw,
    $color_bytes     is rw,
    :$raw            = False,
    :$all            = False
  ) {
    my gint ($w, $h, $b, $n) = 0 xx 3;
    my $ca = CArray[CArray[gint8]].new;
    $ca[0] = CArray[gint8].new;

    my $rv = gimp_pattern_get_pixels($name, $w, $h, $b, $n, $ca);
    ($width, $height, $bpp, $num_color_bytes) = ($w, $h, $b, $n);
    # Can this be converted to idiomatic perl while still retaining the
    # ability to directly manipulate the data in $ca?
    $color_bytes = $ca;

    $all.not ??
      $rv
      !!
      ($rv, $width, $height, $bpp, $num_color_bytes, $color_bytes)
  }

}

### /usr/include/gimp-2.0/libgimp/gimppattern_pdb.h

sub gimp_pattern_get_info (
  Str $name,
  gint $width  is rw,
  gint $height is rw,
  gint $bpp    is rw
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_pattern_get_pixels (
  Str $name,
  gint $width           is rw,
  gint $height          is rw,
  gint $bpp             is rw,
  gint $num_color_bytes is rw,
  CArray[CArray[guint8]] $color_bytes
)
  returns uint32
  is native(gimp)
  is export
{ * }
