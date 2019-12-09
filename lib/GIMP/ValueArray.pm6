use v6;

use GIMP::Raw::Types;
use GIMP::Raw::ValueArray;

use GLib::Object::ParamSpec;

use GLib::Roles::StaticClass;

class GIMP::ValueArray {
  has GimpValueArray $!va;

  submethod BUILD (:$array) {
    $!va = $array;
  }

  multi method new (GimpValueArray $array) {
    return Nil unless $array;

    self.bless( :$array );
  }
  multi method new (Int() $preallocated) {
    my gint $p = $preallocated;
    my $a = gimp_value_array_new($p);

    $a ?? self.bless( array => $a ) !! Nil;
  }

  method append (GValue() $value) {
    gimp_value_array_append($!va, $value);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_value_array_get_type, $n, $t );
  }

  method index (Int() $index) {
    my gint $i = $index;

    gimp_value_array_index($!va, $index);
  }

  method insert (Int() $index, GValue() $value) {
    my gint $i = $index;

    gimp_value_array_insert($!va, $index, $value);
  }

  method length {
    gimp_value_array_length($!va);
  }

  method prepend (GValue() $value) {
    gimp_value_array_prepend($!va, $value);
  }

  method ref {
    gimp_value_array_ref($!va);
  }

  method remove (Int() $index) {
    my gint $i = $index;

    gimp_value_array_remove($!va, $i);
  }

  method truncate (Int() $n_values) {
    my gint $n = $n_values;

    gimp_value_array_truncate($!va, $n);
  }

  method unref {
    gimp_value_array_unref($!va);
  }

}

class GIMP::ValueArray::Param {
  also does GLib::Roles::StaticClass;

  method spec_value_array (
    Str() $name,
    Str() $nick,
    Str() $blurb,
    GParamSpec $element_spec,
    Int() $flags,
    :$raw = False
  ) {
    my GParamFlags $f = $flags;
    my $ps = gimp_param_spec_value_array(
      $name,
      $nick,
      $blurb,
      $element_spec,
      $f
    );

    $ps ??
      ( $raw ?? $ps !! GLib::Object::ParamSpec.new($ps) )
      !!
      Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_param_value_array_get_type, $n, $t);
  }

}
