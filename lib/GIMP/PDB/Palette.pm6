use v6;

use GTK::Compat::Types;

use GIMP::Raw::Str()ucts;

use GLib::Roles::StaticClass;

class GIMP::PDB::Palette {
  also does GLib::Roles::StaticClass;

  method add_entry (
    Str() $name,
    Str() $entry_name,
    GimpRGB $color,
    Int() $entry_num
  ) {
    my gint $e = $entry_num;

    gimp_palette_add_entry($name, $entry_name, $color, $entry_num);
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

  method get_colors (Str() $name, Int() $num_colors) {
    my gint $n = $num_colors;

    gimp_palette_get_colors($name, $n);
  }

  method get_columns (Str() $name) {
    gimp_palette_get_columns($name);
  }

  method get_info (Str() $name, Int() $num_colors) {
    my gint $n = $num_colors;

    gimp_palette_get_info($name, $n);
  }

  method is_editable (Str() $name) {
    gimp_palette_is_editable($name);
  }

  method new (Str() $name) {
    gimp_palette_new($name);
  }

  method rename (Str() $name, Str() $new_name) {
    gimp_palette_rename($name, $new_name);
  }

  method set_columns (Str() $name, Int() $columns) {
    my gint $c = $columns;

    gimp_palette_set_columns($name, $c);
  }

}
