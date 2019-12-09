use v6;

use GIMP::Raw::Types;
use GIMP::Raw::Unit;

use GLib::Object::ParamSpec;

use GLib::Roles::StaticClass;

class GIMP::Unit {
  also does GLib::Roles::StaticClass;

  method new_unit (
    Str() $identifier,
    Num() $factor,
    Int() $digits,
    Str() $symbol,
    Str() $abbreviation,
    Str() $singular,
    Str() $plural
  ) {
    my gdouble $f = $factor;
    my gint $d = $digits;

    gimp_unit_new(
      $identifier,
      $f,
      $d,
      $symbol,
      $abbreviation,
      $singular,
      $plural
    );
  }

  method format_string (Str() $format, Int() $unit) {
    my GimpUnit $u = $unit;

    gimp_unit_format_string($format, $u);
  }

  method get_abbreviation (Int() $unit) {
    my GimpUnit $u = $unit;

    gimp_unit_get_abbreviation($u);
  }

  method get_digits (Int() $unit) {
    my GimpUnit $u = $unit;

    gimp_unit_get_digits($u);
  }

  method get_factor (Int() $unit) {
    my GimpUnit $u = $unit;

    gimp_unit_get_factor($u);
  }

  method get_identifier (Int() $unit) {
    my GimpUnit $u = $unit;

    gimp_unit_get_identifier($u);
  }

  method get_number_of_built_in_units {
    gimp_unit_get_number_of_built_in_units();
  }

  method get_number_of_units {
    gimp_unit_get_number_of_units();
  }

  method get_plural (Int() $unit) {
    my GimpUnit $u = $unit;

    gimp_unit_get_plural($u);
  }

  method get_scaled_digits (Int() $unit, Num() $resolution) {
    my GimpUnit $u = $unit;
    my gdouble $r = $resolution;

    gimp_unit_get_scaled_digits($u, $resolution);
  }

  method get_symbol (Int() $unit) {
    my GimpUnit $u = $unit;

    gimp_unit_get_symbol($u);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_unit_get_type, $n, $t );
  }

  method pixels_to_units (Num() $pixels, Int() $unit, Num() $resolution) {
    my gdouble ($p, $r) = ($pixels, $resolution);
    my GimpUnit $u = $unit;

    gimp_pixels_to_units($pixels, $u, $resolution);
  }

  method units_to_pixels (Num() $value, Int() $unit, Num() $resolution) {
    my gdouble ($v, $r) = ($value, $resolution);
    my GimpUnit $u = $unit;

    gimp_units_to_pixels($v, $u, $resolution);
  }

  method units_to_points (Num() $value, Int() $unit, Num() $resolution) {
    my gdouble ($v, $r) = ($value, $resolution);
    my GimpUnit $u = $unit;

    gimp_units_to_points($v, $u, $resolution);
  }

  method is_metric (Int() $unit) {
    my GimpUnit $u = $unit;

    so gimp_unit_is_metric($u);
  }

}

class GIMP::Units::Param {
  also does GLib::Roles::StaticClass;

  method spec_unit (
    Str() $name,
    Str() $nick,
    Str() $blurb,
    Int() $allow_pixels,
    Int() $allow_percent,
    Int() $default_value,
    Int() $flags,
    :$raw = False
  ) {
    my gboolean ($apix, $apct) = (so $allow_pixels, so $allow_percent)».Int;
    my GimpUnit $d = $default_value;
    my GParamFlags $f = $flags;

    # GParamSpec
    my $ps = gimp_param_spec_unit($name, $nick, $blurb, $apix, $apct, $d, $f);

    $ps ??
      ( $raw ?? $ps !! GLib::Object::ParamSpec.new($ps) )
      !!
      Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_param_unit_get_type, $n, $t );
  }
}
