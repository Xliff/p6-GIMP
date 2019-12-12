use v6;

use MONKEY-TYPING;

use GTK::Compat::Types;

use GIMP::Raw::Structs;
use GIMP::Raw::Matrix;

use GLib::Object::ParamSpec;

use GLib::Roles::StaticClass;

augment class GIMP::Raw::Structs::GimpMatrix2 {

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_matrix2_get_type, $n, $t );
  }

  method identity {
    gimp_matrix2_identity(self);
  }

  method mult (GimpMatrix2 $matrix2) {
    gimp_matrix2_mult($matrix2, self);
  }

}

augment class GIMP::Raw::Structs::GimpMatrix3 {

  method affine (
    Num() $a,
    Num() $b,
    Num() $c,
    Num() $d,
    Num() $e,
    Num() $f
  ) {
    my gdouble ($aa, $bb, $cc, $dd, $ee, $ff) = ($a, $b, $c, $d, $e, $f);

    gimp_matrix3_affine(self, $aa, $bb, $cc, $dd, $ee, $ff);
  }

  method determinant {
    gimp_matrix3_determinant(self);
  }

  method get_type {
    gimp_matrix3_get_type();
  }

  method identity {
    gimp_matrix3_identity(self);
  }

  method invert  {
    gimp_matrix3_invert(self);
  }

  method is_affine  {
    so gimp_matrix3_is_affine(self);
  }

  method is_diagonal  {
    so gimp_matrix3_is_diagonal(self);
  }

  method is_identity  {
    so gimp_matrix3_is_identity(self);
  }

  method is_simple  {
    so gimp_matrix3_is_simple(self);
  }

  method mult (GimpMatrix3 $matrix2) {
    gimp_matrix3_mult($matrix2, self);
  }

  method rotate (Num() $theta) {
    my gdouble $θ = $theta;

    gimp_matrix3_rotate(self, $θ);
  }

  method scale (Num() $x, Num() $y) {
    my gdouble ($xx, $yy) = ($x, $y);

    gimp_matrix3_scale(self, $x, $y);
  }

  proto method transform_point (|)
  { * }

  multi method transform_point (
    Num() $x,
    Num() $y,
  ) {
    samewith($x, $y, $, $);
  }
  multi method transform_point (
    Num() $x,
    Num() $y,
    $newx is rw,
    $newy is rw
  ) {
    my gdouble ($xx, $yy, $nx, $ny) = ($x, $y, 0, 0);

    gimp_matrix3_transform_point(self, $x, $y, $nx, $ny);
    ($newx, $newy) = ($nx, $ny);
  }

  method translate (Num() $x, Num() $y) {
    my gdouble ($xx, $yy) = ($x, $y);

    gimp_matrix3_translate(self, $xx, $yy);
  }

  method xshear (Num() $amount) {
    my gdouble $a = $amount;

    gimp_matrix3_xshear(self, $amount);
  }

  method yshear (Num() $amount) {
    my gdouble $a = $amount;

    gimp_matrix3_yshear(self, $amount);
  }

}

augment class GIMP::Raw::Structs::GimpMatrix4 {

  proto method to_deg (|)
  { * }

  multi method to_deg {
    samewith($, $, $);
  }
  multi method to_deg ($a is rw, $b is rw, $c is rw) {
    my gdouble ($aa, $bb, $cc) = 0e0 xx 3;

    gimp_matrix4_to_deg(self, $aa, $bb, $cc);
    ($a, $b, $c) = ($aa, $bb, $cc);
  }

}

class GIMP::Matrix2::Param {
  also does GLib::Roles::StaticClass;

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_param_matrix2_get_type, $n, $t );
  }

  method spec (
    Str() $name,
    Str() $nick,
    Str() $blurb,
    GimpMatrix2 $default_value,
    Int() $flags,
    :$raw = False
  ) {
    my GParamFlags $f = $flags;

    my $ps = gimp_param_spec_matrix2($name, $nick, $blurb, $default_value, $f);

    $ps ??
      ( $raw ?? $ps !! GLib::Object::ParamSpec.new($ps) )
      !!
      Nil;
  }
}

class GIMP::Matrix3::Param {
  also does GLib::Roles::StaticClass;

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_param_matrix3_get_type, $n, $t);
  }

  method spec (
    Str() $name,
    Str() $nick,
    Str() $blurb,
    GimpMatrix3 $default_value,
    Int() $flags,
    :$raw = False
  ) {
    my GParamFlags $f = $flags;

    my $ps = gimp_param_spec_matrix3($name, $nick, $blurb, $default_value, $f);

    $ps ??
      ( $raw ?? $ps !! GLib::Object::ParamSpec.new($ps) )
      !!
      Nil;
  }
}
