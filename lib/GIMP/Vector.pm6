use v6;

use MONKEY-TYPING;

use GIMP::Raw::Types;
use GIMP::Raw::Vector;

use GLib::Roles::StaticClass;

augment class GIMP::Raw::Structs::GimpVector2 {

  method new (
    GIMP::Raw::Structs::GimpVector2:U:
    Num() $x,
    Num() $y
  ) {
    my gdouble ($xx, $yy) = ($x, $y);

    gimp_vector2_new($xx, $yy);
  }

  method add (GimpVector2 $vector2) {
    my $r = GimpVector2.new;

    gimp_vector2_add($r, self, $vector2);
    $r;
  }

  method cross_product (GimpVector2 $vector2) {
    gimp_vector2_cross_product(self, $vector2);
  }

  method inner_product (GimpVector2 $vector2) {
    gimp_vector2_inner_product(self, $vector2);
  }

  method length {
    gimp_vector2_length(self);
  }

  method mul (Num() $factor) {
    my gdouble $f = $factor;

    gimp_vector2_mul(self, $f);
  }

  method neg {
    gimp_vector2_neg(self);
  }

  method normal {
    gimp_vector2_normal(self);
  }

  method normalize {
    gimp_vector2_normalize(self);
  }

  method rotate (Num() $alpha) {
    my gdouble $α = $alpha;

    gimp_vector2_rotate(self, $α);
  }

  method set (Num() $x, Num() $y) {
    my gdouble ($xx, $yy) = ($x, $y);

    gimp_vector2_set(self, $xx, $yy);
  }

  method sub (GimpVector2 $vector2) {
    my $r = GimpVector2.new;

    gimp_vector2_sub($r, self, $vector2);
    $r;
  }

}

augment class GIMP::Raw::Structs::GimpVector3 {

  method new (
    GIMP::Raw::Structs::GimpVector3:U:
    Num() $x,
    Num() $y,
    Num() $z
  ) {
    my gdouble ($xx, $yy, $zz) = ($x, $y, $z);

    gimp_vector3_new($xx, $yy, $zz);
  }

  method add (GimpVector3 $vector2) {
    my $r = GimpVector3.new;

    gimp_vector3_add($r, self, $vector2);
    $r;
  }

  method cross_product (GimpVector3 $vector2) {
    gimp_vector3_cross_product(self, $vector2);
  }

  method inner_product (GimpVector3 $vector2) {
    gimp_vector3_inner_product(self, $vector2);
  }

  method length {
    gimp_vector3_length(self);
  }

  method mul (Num() $factor) {
    my gdouble $f = $factor;

    gimp_vector3_mul(self, $f);
  }

  method neg {
    gimp_vector3_neg(self);
  }

  method normalize {
    gimp_vector3_normalize(self);
  }

  method rotate (Num() $alpha, Num() $beta, Num() $gamma) {
    my gdouble ($α, $β, $ξ) = ($alpha, $beta, $gamma);

    gimp_vector3_rotate(self, $α, $β, $ξ);
  }

  method rotate_val (Num() $alpha, Num() $beta, Num() $gamma) {
    my gdouble ($α, $β, $ξ) = ($alpha, $beta, $gamma);

    gimp_vector3_rotate_val(self, $α, $β, $ξ);
  }

  method set (Num() $x, Num() $y, Num() $z) {
    my gdouble ($xx, $yy, $zz) = ($x, $y, $z);

    gimp_vector3_set(self, $xx, $yy, $zz);
  }

  method sub (GimpVector3 $vector2) {
    my $r = GimpVector3.new;

    gimp_vector3_sub($r, self, $vector2);
    $r;
  }

}

class GIMP::Vector {
  also does GLib::Roles::StaticClass;

  method vector_2d_to_3d (
    Int() $sx,
    Int() $sy,
    Int() $w,
    Int() $h,
    Int() $x,
    Int() $y,
    GimpVector3 $vp, # Pass by value!
    GimpVector3 $p   # Pass by value!
  ) {
    my gint ($sxx, $syy, $ww, $hh, $xx, $yy) = ($sx, $sy, $w, $h, $x, $y);

    gimp_vector_2d_to_3d($sxx, $syy, $ww, $hh, $xx, $yy, $vp, $p);
  }


  proto method vector_3d_to_2d (|)
  { * }

  multi method vector_3d_to_2d (
    Int() $sx,
    Int() $sy,
    Int() $w,
    Int() $h,
    GimpVector3 $vp,
    GimpVector3 $p
  ) {
    samewith($sx, $sy, $w, $h, $, $, $vp, $p);
  }
  multi method vector_3d_to_2d (
    Int() $sx,
    Int() $sy,
    Int() $w,
    Int() $h,
    $x is rw,
    $y is rw,
    GimpVector3 $vp,
    GimpVector3 $p
  ) {
    my gint ($sxx, $syy, $ww, $hh) = ($sx, $sy, $w, $h);
    my gdouble ($xx, $yy) = 0e0 xx 2;

    gimp_vector_3d_to_2d($sx, $sy, $w, $h, $x, $y, $vp, $p);
    ($x, $y) = ($xx, $yy);
  }

}
