use v6;

use GTK::Compat::Types;

use GIMP::Raw::Structs;

use GLib::Roles::StaticClass;

use GTK::Compat::Roles::TypedBuffer;

class GIMP::PDB::Palette {
  also does GLib::Roles::StaticClass;

  method new_palette (Str() $name) {
    gimp_palette_new($name);
  }

  proto method add_entry (|)
  { * }

  multi method add_entry (
    Str() $name,
    Str() $entry_name,
    GimpRGB $color,
    :$all = True
  ) {
    samewith($name, $entry_name, $color, $, :$all);
  }
  multi method add_entry (
    Str() $name,
    Str() $entry_name,
    GimpRGB $color,
    $entry_num is rw,
    :$all = False
  ) {
    my gint $e = 0;
    my $rv = gimp_palette_add_entry($name, $entry_name, $color, $e);

    $entry_num = $e;
    $all.not ?? $rv !! ($rv, $entry_num);
  }

  method delete (Str() $name) {
    gimp_palette_delete($name);
  }

  method delete_entry (Str() $name, Int() $entry_num) {
    my gint $e = $entry_num;

    gimp_palette_delete_entry($name, $entry_num);
  }

  method duplicate (Str() $name) {
    gimp_palette_duplicate($name);
  }

  method entry_get_color (Str() $name, Int() $entry_num, GimpRGB $color) {
    my gint $e = $entry_num;

    gimp_palette_entry_get_color($name, $entry_num, $color);
  }

  method entry_get_name (Str() $name, Int() $entry_num, Str() $entry_name) {
    my gint $e = $entry_num;

    gimp_palette_entry_get_name($name, $entry_num, $entry_name);
  }

  method entry_set_color (Str() $name, Int() $entry_num, GimpRGB $color) {
    gimp_palette_entry_set_color($name, $entry_num, $color);
  }

  method entry_set_name (Str() $name, Int() $entry_num, Str() $entry_name) {
    my gint $e = $entry_num;

    gimp_palette_entry_set_name($name, $e, $entry_name);
  }

  proto method get_colors (|)
  { * }

  multi method get_colors (Str() $name) {
    samewith($name, $);
  }
  multi method get_colors (Str() $name, $num_colors is rw, :$raw = False) {
    my gint $n = 0;

    my $rv = gimp_palette_get_colors($name, $n);
    $num_colors = $n;

    return $rv if $raw;
    my $b = GTK::Compat::Roles::TypedBuffer[GimpRGB].new($rv);
    $b.setSize($n, :forced);
    $b.Array;
  }

  method get_columns (Str() $name) {
    gimp_palette_get_columns($name);
  }

  proto method get_info (|)
  { * }

  multi method get_info (:$all = True) {
    samewith($, $, :$all);
  }
  multi method get_info ($name is rw, $num_colors is rw) {
    my gint $n = 0e0;
    my $s = Str;

    my $rv = gimp_palette_get_info($s, $n);
    ($name, $num_colors) = ($s, $n);
    $all.not ?? $rv !! ($rv, $name, $num_colors);
  }

  method is_editable (Str() $name) {
    so gimp_palette_is_editable($name);
  }

  method rename (Str() $name, Str() $new_name) {
    gimp_palette_rename($name, $new_name);
  }

  method set_columns (Str() $name, Int() $columns) {
    my gint $c = $columns;

    gimp_palette_set_columns($name, $c);
  }

}
