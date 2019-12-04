use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::Palette;

### /usr/include/gimp-2.0/libgimp/gimppalette_pdb.h

sub gimp_palette_add_entry (
  Str $name,
  Str $entry_name,
  GimpRGB $color,
  gint $entry_num
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palette_delete (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palette_delete_entry (Str $name, gint $entry_num)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palette_duplicate (Str $name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_palette_entry_get_color (Str $name, gint $entry_num, GimpRGB $color)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palette_entry_get_name (Str $name, gint $entry_num, Str $entry_name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palette_entry_set_color (Str $name, gint $entry_num, GimpRGB $color)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palette_entry_set_name (Str $name, gint $entry_num, Str $entry_name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palette_get_colors (Str $name, gint $num_colors)
  returns GimpRGB
  is native(gimp)
  is export
{ * }

sub gimp_palette_get_columns (Str $name)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_palette_get_info (Str $name, gint $num_colors)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palette_is_editable (Str $name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_palette_new (Str $name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_palette_rename (Str $name, Str $new_name)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_palette_set_columns (Str $name, gint $columns)
  returns uint32
  is native(gimp)
  is export
{ * }
