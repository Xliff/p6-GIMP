use v6;

use NativeCall;

use GTK::Raw::Utils;

use GIMP::Raw::Types;

use GIMP::PDB::Raw::Utils;
use GIMP::PDB::Raw::Image;

use GTK::Compat::Pixbuf;

use GLib::Roles::StaticClass;
use GIMP::PDB::Roles::Assumable;

class GIMP::PDB::Image {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method new_image (Int() $width, Int() $height, Int() $type) {
    my gint ($w, $h) = ($width, $height);
    my GimpImageBaseType $t = $type;

    gimp_image_new($w, $h, $t);
  }

  method new_image_with_precision (
    Int() $width,
    Int() $height,
    Int() $type,
    Int() $precision
  ) {
    my gint ($w, $h) = ($width, $height);
    my GimpImageBaseType $t = $type;
    my GimpPrecision $p = $precision;

    gimp_image_new_with_precision($w, $h, $t, $p);
  }

  # Color

  method color_profile_from_file (
    Int() $image_ID,
    Str() $uri,
    Int() $intent,
    Int() $bpc
  ) {
    my gint32 $i = $image_ID;
    my GimpColorRenderingIntent $in = $intent,
    my gboolean $b = (so $bpc).Int;

    gimp_image_convert_color_profile_from_file($i, $uri, $in, $b);
  }

  method set_color_profile_from_file (
    Int() $image_ID,
    Str() $uri
  ) {
    my gint32 $i = $image_ID;

    gimp_image_set_color_profile_from_file($i, $uri);
  }

  # Guides

  method add_hguide (Int() $image_ID, Int() $yposition) {
    my gint32 $i = $image_ID;
    my gint $y = $yposition;

    gimp_image_add_hguide($i, $y);
  }

  method add_vguide (Int() $image_ID, Int() $xposition) {
    my gint32 $i = $image_ID;
    my gint $x = $xposition;

    gimp_image_add_vguide($i, $x);
  }

  method delete_guide (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_delete_guide($i, $g);
  }

  method find_next_guide (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_find_next_guide($i, $g);
  }

  method get_guide_orientation (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_get_guide_orientation($i, $g);
  }

  method get_guide_position (Int() $image_ID, Int() $guide_ID) {
    my gint32 ($i, $g) = ($image_ID, $guide_ID);

    gimp_image_get_guide_position($i, $g);
  }

  # Sample Points

  method add_sample_point (
    Int() $image_ID,
    Int() $position_x,
    Int() $position_y
  ) {
    my gint32 $i = $image_ID;
    my gint ($x, $y) = ($position_x, $position_y);

    gimp_image_add_sample_point($i, $x, $y);
  }

  method delete_sample_point (Int() $image_ID, Int() $sample_point_ID) {
    my gint32 ($i, $s) = ($image_ID, $sample_point_ID);

    gimp_image_delete_sample_point($i, $s);
  }

  method find_next_sample_point (Int() $image_ID, Int() $sample_point_ID) {
    my gint32 ($i, $s) = ($image_ID, $sample_point_ID);

    gimp_image_find_next_sample_point($i, $s);
  }

  proto method get_sample_point (|)
  { * }

  multi method get_sample_point_position (
    Int() $image_ID,
    Int() $sample_point_ID
  ) {
    samewith($image_ID, $sample_point_ID, $);
  }
  multi method get_sample_point_position (
    Int() $image_ID,
    Int() $sample_point_ID,
    $position_y is rw
  ) {
    my gint32 ($i, $s) = ($image_ID, $sample_point_ID);
    my gint $y = 0;

    gimp_image_get_sample_point_position($i, $s, $y);
    $position_y = $y;
  }

  # Pixbuf

  method gimp_image_get_thumbnail (
    Int() $image_ID,
    Int() $width,
    Int() $height,
    Int() $alpha,
    :$raw = False
  ) {
    my gint32 $i = $image_ID;
    my gint ($w, $h) = ($width, $height);
    my GimpPixbufTransparency $a = $alpha;

    my $p = gimp_image_get_thumbnail($i, $w, $h, $a);

    $p ??
      ( $raw ?? $p !! GTK::Compat::Pixbuf.new($p) )
      !!
      Nil;
  }

  # PDB

  method attach_parasite (Int() $image_ID, GimpParasite $parasite) {
    my gint32 $i = $image_ID;

    gimp_image_attach_parasite($i, $parasite);
  }

  method base_type (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_base_type($i);
  }

  method clean_all (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_clean_all($i);
  }

  method delete (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_delete($i);
  }

  method detach_parasite (Int() $image_ID, Str() $name) {
    my gint32 $i = $image_ID;

    gimp_image_detach_parasite($i, $name);
  }

  method duplicate (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_duplicate($i);
  }

  method flatten (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_flatten($i);
  }

  method floating_sel_attached_to (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_floating_sel_attached_to($i);
  }

  method freeze_channels (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_freeze_channels($i);
  }

  method freeze_layers (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_freeze_layers($i);
  }

  method freeze_vectors (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_freeze_vectors($i);
  }

  method get_active_channel (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_active_channel($i);
  }

  method get_active_drawable (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_active_drawable($i);
  }

  method get_active_layer (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_active_layer($i);
  }

  method get_active_vectors (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_active_vectors($i);
  }

  method get_channel_by_name (Int() $image_ID, Str() $name) {
    my gint32 $i = $image_ID;

    gimp_image_get_channel_by_name($i, $name);
  }

  method get_channel_by_tattoo (Int() $image_ID, Int() $tattoo) {
    my gint32 $i = $image_ID;
    my gint $t = $tattoo;

    gimp_image_get_channel_by_tattoo($i, $t);
  }

  proto method get_channels (|)
  { * }

  multi method get_channels (Int() $image_ID) {
    samewith($image_ID, $);
  }
  multi method get_channels (Int() $image_ID, $num_channels is rw) {
    my gint32 $i = $image_ID;
    my gint $n = 0;
    my $cl = gimp_image_get_channels($i, $n);

    $num_channels = $n;
    CArrayToArray($cl, $n);
  }

  method get_component_active (
    Int() $image_ID,
    Int() $component
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelType $c = $component;

    gimp_image_get_component_active($i, $c);
  }

  method get_component_visible (
    Int() $image_ID,
    Int() $component
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelType $c = $component;

    gimp_image_get_component_visible($i, $c);
  }

  method get_default_new_layer_mode (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_default_new_layer_mode($i);
  }

  method get_exported_uri (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_exported_uri($i);
  }

  method get_filename (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_filename($i);
  }

  method get_floating_sel (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_floating_sel($i);
  }

  method get_imported_uri (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_imported_uri($i);
  }

  method get_item_position (Int() $image_ID, Int() $item_ID) {
    my gint32 ($i, $ii) = ($image_ID, $item_ID);

    gimp_image_get_item_position($i, $item_ID);
  }

  method get_layer_by_name (Int() $image_ID, Str() $name) {
    my gint32 $i = $image_ID;

    gimp_image_get_layer_by_name($i, $name);
  }

  method get_layer_by_tattoo (Int() $image_ID, Int() $tattoo) {
    my gint32 $i = $image_ID;
    my gint $t = $tattoo;

    gimp_image_get_layer_by_tattoo($i, $tattoo);
  }

  proto method get_layers (|)
  { * }

  multi method get_layers (Int() $image_ID) {
    samewith($image_ID, $);
  }
  multi method get_layers (Int() $image_ID, $num_layers is rw) {
    my gint32 $i = $image_ID;
    my gint $n = 0;
    my $ll = gimp_image_get_layers($i, $n);

    $num_layers = $n;
    CArrayToArray($ll, $n);
  }

  method get_name (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_name($i);
  }

  method get_parasite (Int() $image_ID, Str() $name) {
    my gint32 $i = $image_ID;

    gimp_image_get_parasite($i, $name);
  }

  proto method get_parasite_list (Int() $image_ID)
  { * }

  multi method get_parasite_list(Int() $image_ID) {
    samewith($image_ID, $);
  }
  multi method get_parasite_list (Int() $image_ID, $num_parasites is rw) {
    my gint32 $i = $image_ID;
    my gint $n = 0;
    my $pl = gimp_image_get_parasite_list($i, $n);

    $num_parasites = $n;
    CArrayToArray($pl, $n);
  }

  method get_precision (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_precision($i);
  }

  proto method get_resolution (|)
  { * }

  multi method get_resolution(Int() $image_ID) {
    samewith($image_ID, $, $);
  }
  multi method get_resolution (
    Int() $image_ID,
    $xresolution is rw,
    $yresolution is rw
  ) {
    my gint32 $i = $image_ID;
    my gdouble ($xr, $yr) = 0e0 xx 2;

    gimp_image_get_resolution($i, $xr, $yr);
    ($xresolution, $yresolution) = ($xr, $yr);
  }

  method get_selection (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_selection($i);
  }

  method get_tattoo_state (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_tattoo_state($i);
  }

  method get_unit (Int() $image_ID) {
    my gint32 $i = $image_ID;

    GimpUnitEnum( gimp_image_get_unit($i) );
  }

  method get_uri (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_uri($i);
  }

  proto method get_vectors (|)
  { * }

  multi method get_vectors (Int() $image_ID) {
    samewith($image_ID, $);
  }
  multi method get_vectors (Int() $image_ID, $num_vectors is rw) {
    my gint32 $i = $image_ID;
    my gint $n = 0;
    my $ia = gimp_image_get_vectors($i, $n);

    $num_vectors = $n;
    CArrayToArray($ia, $num_vectors);
  }

  method get_vectors_by_name (Int() $image_ID, Str() $name) {
    my gint32 $i = $image_ID;

    gimp_image_get_vectors_by_name($i, $name);
  }

  method get_vectors_by_tattoo (Int() $image_ID, Int() $tattoo) {
    my gint32 $i = $image_ID;

    gimp_image_get_vectors_by_tattoo($i, $tattoo);
  }

  method get_xcf_uri (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_get_xcf_uri($i);
  }

  method height (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_height($i);
  }

  method insert_channel (
    Int() $image_ID,
    Int() $channel_ID,
    Int() $parent_ID,
    Int() $position
  ) {
    my gint32 ($i, $c, $p) = ($image_ID, $channel_ID, $parent_ID);
    my gint $pos = $position;

    gimp_image_insert_channel($i, $c, $p, $pos);
  }

  method insert_layer (
    Int() $image_ID,
    Int() $channel_ID,
    Int() $parent_ID,
    Int() $position
  ) {
    my gint32 ($i, $c, $p) = ($image_ID, $channel_ID, $parent_ID);
    my gint $pos = $position;

    gimp_image_insert_layer($i, $c, $p, $pos);
  }

  method insert_vectors (
    Int() $image_ID,
    Int() $channel_ID,
    Int() $parent_ID,
    Int() $position
  ) {
    my gint32 ($i, $c, $p) = ($image_ID, $channel_ID, $parent_ID);
    my gint $pos = $position;

    gimp_image_insert_vectors($i, $c, $p, $pos);
  }

  method is_dirty (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_image_is_dirty($i);
  }

  method is_valid (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_image_is_valid($i);
  }

  proto method list (|)
  { * }

  multi method list {
    samewith($);
  }
  multi method list ($num_images is rw) {
    my gint $n = 0;
    my $il = gimp_image_list($n);

    $num_images = $n;
    CArrayToArray($il, $n);
  }

  method lower_item (Int() $image_ID, Int() $item_ID) {
    my gint32 ($i, $ii) = ($image_ID, $item_ID);

    gimp_image_lower_item($i, $item_ID);
  }

  method lower_item_to_bottom (Int() $image_ID, Int() $item_ID) {
    my gint32 ($i, $ii) = ($image_ID, $item_ID);

    gimp_image_lower_item_to_bottom($i, $item_ID);
  }

  method merge_down (
    Int() $image_ID,
    Int() $merge_layer_ID,
    Int() $merge_type
  ) {
    my gint32 ($i, $m) = ($image_ID, $merge_layer_ID);
    my GimpMergeType $t = $merge_type;

    gimp_image_merge_down($i, $m, $t);
  }

  method merge_visible_layers (
    Int() $image_ID,
    Int() $merge_type
  ) {
    my gint32 $i = $image_ID;
    my GimpMergeType $t = $merge_type;

    gimp_image_merge_visible_layers($i, $t);
  }

  method pick_color (
    Int() $image_ID,
    Int() $drawable_ID,
    Num() $x,
    Num() $y,
    Int() $sample_merged,
    Int() $sample_average,
    Num() $average_radius,
    GimpRGB $color
  ) {
    my gint32 ($i, $d) = ($image_ID, $drawable_ID);
    my gdouble ($xx, $yy, $r) = ($x, $y, $average_radius);
    my gboolean ($m, $a) = ($sample_merged, $sample_average).map( *.so.Int );

    gimp_image_pick_color($i, $d, $xx, $yy, $m, $a, $r, $color);
  }

  method pick_correlate_layer (Int() $image_ID, Int() $x, Int() $y) {
    my gint32 $i = $image_ID;
    my gint ($xx, $yy) = ($x, $y);

    gimp_image_pick_correlate_layer($i, $xx, $yy);
  }

  method raise_item (Int() $image_ID, Int() $item_ID) {
    my gint32 ($i, $ii) = ($image_ID, $item_ID);

    gimp_image_raise_item($i, $ii);
  }

  method raise_item_to_top (Int() $image_ID, Int() $item_ID) {
    my gint32 ($i, $ii) = ($image_ID, $item_ID);

    gimp_image_raise_item_to_top($i, $ii);
  }

  method remove_channel (Int() $image_ID, Int() $channel_ID) {
    my gint32 ($i, $c) = ($image_ID, $channel_ID);

    gimp_image_remove_channel($i, $c);
  }

  method remove_layer (Int() $image_ID, Int() $layer_ID) {
    my gint32 ($i, $l) = ($image_ID, $layer_ID);

    gimp_image_remove_layer($i, $l);
  }

  method remove_vectors (Int() $image_ID, Int() $vectors_ID) {
    my gint32 ($i, $v) = ($image_ID, $vectors_ID);

    gimp_image_remove_vectors($i, $v);
  }

  method reorder_item (
    Int() $image_ID,
    Int() $item_ID,
    Int() $parent_ID,
    Int() $position
  ) {
    my gint32 ($i, $ii, $p) = ($image_ID, $item_ID, $parent_ID);
    my gint $pos = $position;

    gimp_image_reorder_item($i, $ii, $p, $pos);
  }

  method set_active_channel (Int() $image_ID, Int() $active_channel_ID) {
    my gint32 ($i, $a) = ($image_ID, $active_channel_ID);

    gimp_image_set_active_channel($i, $a);
  }

  method set_active_layer (Int() $image_ID, Int() $active_layer_ID) {
    my gint32 ($i, $a) = ($image_ID, $active_layer_ID);

    gimp_image_set_active_layer($i, $a);
  }

  method set_active_vectors (Int() $image_ID, Int() $active_vectors_ID) {
    my gint32 ($i, $a) = ($image_ID, $active_vectors_ID);

    gimp_image_set_active_vectors($i, $a);
  }

  method set_component_active (
    Int() $image_ID,
    Int() $component,
    Int() $active
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelType $c = $component;
    my gboolean $a = (so $active).Int;

    gimp_image_set_component_active($i, $c, $a);
  }

  method set_component_visible (
    Int() $image_ID,
    Int() $component,
    Int() $visible
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelType $c = $component;
    my gboolean $v = (so $visible).Int;

    gimp_image_set_component_visible($i, $c, $v);
  }

  method set_filename (Int() $image_ID, Str() $filename) {
    my gint32 $i = $image_ID;

    gimp_image_set_filename($i, $filename);
  }

  method set_resolution (
    Int() $image_ID,
    Num() $xresolution,
    Num() $yresolution
  ) {
    my gint32 $i = $image_ID;
    my gdouble ($xr, $yr) = ($xresolution, $yresolution);

    gimp_image_set_resolution($i, $xr, $yr);
  }

  method set_tattoo_state (Int() $image_ID, Int() $tattoo_state) {
    my gint32 $i = $image_ID;
    my gint $t = $tattoo_state;

    gimp_image_set_tattoo_state($i, $t);
  }

  method set_unit (Int() $image_ID, Int() $unit) {
    my gint32 $i = $image_ID;
    my GimpUnit $u = $unit;

    gimp_image_set_unit($i, $u);
  }

  method thaw_channels (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_thaw_channels($i);
  }

  method thaw_layers (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_thaw_layers($i);
  }

  method thaw_vectors (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_thaw_vectors($i);
  }

  method unset_active_channel (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_unset_active_channel($i);
  }

  method width (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_width($i);
  }

}

class GIMP::PDB::Image::Convert {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  # Convert

  method grayscale (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_convert_grayscale($i);
  }

  method indexed (
    Int() $image_ID,
    Int() $dither_type,
    Int() $palette_type,
    Int() $num_cols,
    Int() $alpha_dither,
    Int() $remove_unused,
    Str() $palette
  ) {
    my gint32 $i = $image_ID;
    my gint $n = $num_cols;
    my GimpConvertDitherType $d = $dither_type;
    my GimpConvertPaletteType $p = $palette_type;
    my gboolean ($a, $r) = ($alpha_dither, $remove_unused)».so».Int;

    gimp_image_convert_indexed($i, $d, $p, $n, $a, $r, $palette);
  }

  method precision (Int() $image_ID, Int() $precision) {
    my gint32 $i = $image_ID;
    my GimpPrecision $p = $precision;

    gimp_image_convert_precision($i, $p);
  }

  method rgb (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_convert_rgb($i);
  }

  method set_dither_matrix (
    Int() $width,
    Int() $height,
    Int() $matrix_length,
    CArray[guint8] $matrix
  ) {
    my gint ($w, $h, $m) = ($width, $height, $matrix_length);

    gimp_image_convert_set_dither_matrix($w, $h, $m, $matrix);
  }

}

class GIMP::PDB::Image::Grid {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method get_background_color (Int() $image_ID, GimpRGB $bgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_get_background_color($i, $bgcolor);
  }

  method get_foreground_color (Int() $image_ID, GimpRGB $fgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_get_foreground_color($i, $fgcolor);
  }

  method get_offset (Int() $image_ID, $xoffset is rw, $yoffset is rw) {
    my gint32 $i = $image_ID;
    my gdouble ($xo, $yo) = 0e0 xx 2;

    gimp_image_grid_get_offset($i, $xo, $yo);
    ($xoffset, $yoffset) = ($xo, $yo)
  }

  proto method get_spacing (|)
  { * }

  multi method get_spacing (Int() $image_ID) {
    samewith($image_ID, $, $);
  }
  multi method get_spacing (
    Int() $image_ID,
    $xspacing is rw,
    $yspacing is rw
  ) {
    my gint32 $i = $image_ID;
    my gdouble ($xs, $ys) = 0e0 xx 2;

    gimp_image_grid_get_spacing($i, $xs, $ys);
    ($xspacing, $yspacing) = ($xs, $ys);
  }

  method get_style (Int() $image_ID) {
    my gint32 $i = $image_ID;

    GimpGridStyleEnum( gimp_image_grid_get_style($i) );
  }

  method set_background_color (Int() $image_ID, GimpRGB $bgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_set_background_color($i, $bgcolor);
  }

  method set_foreground_color (Int() $image_ID, GimpRGB $fgcolor) {
    my gint32 $i = $image_ID;

    gimp_image_grid_set_foreground_color($i, $fgcolor);
  }

  method set_offset (Int() $image_ID, Num() $xoffset, Num() $yoffset) {
    my gint32 $i = $image_ID;
    my gdouble ($xo, $yo) = ($xoffset, $yoffset);

    gimp_image_grid_set_offset($i, $xo, $yo);
  }

  method set_spacing (Int() $image_ID, Num() $xspacing, Num() $yspacing) {
    my gint32 $i = $image_ID;
    my gdouble ($xs, $ys) = ($xspacing, $yspacing);

    gimp_image_grid_set_spacing($i, $xs, $ys);
  }

  method set_style (Int() $image_ID, Int() $style) {
    my gint32 $i = $image_ID;
    my GimpGridStyle $s = $style;

    gimp_image_grid_set_style($i, $s);
  }
}

class GIMP::PDB::Image::Select {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method color (
    Int() $image_ID,
    Int() $operation,
    Int() $drawable_ID,
    GimpRGB $color
  ) {
    my gint32 ($i, $d) = ($image_ID, $drawable_ID);
    my GimpChannelOps $o = $operation;

    gimp_image_select_color($i, $o, $d, $color);
  }

  method contiguous_color (
    Int() $image_ID,
    Int() $operation,
    Int() $drawable_ID,
    Num() $x,
    Num() $y
  ) {
    my gint32 ($i, $d) = ($image_ID, $drawable_ID);
    my GimpChannelOps $o = $operation;
    my gdouble ($xx, $yy) = ($x, $y);

    gimp_image_select_contiguous_color($i, $o, $d, $xx, $yy);
  }

  method ellipse (
    Int() $image_ID,
    Int() $operation,
    Num() $x,
    Num() $y,
    Num() $width,
    Num() $height
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelOps $o = $operation;
    my gdouble ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    gimp_image_select_ellipse($i, $o, $xx, $yy, $w, $h);
  }

  method item (Int() $image_ID, Int() $operation, Int() $item_ID) {
    my gint32 ($i, $it) = ($image_ID, $item_ID);
    my GimpChannelOps $o = $operation;

    gimp_image_select_item($i, $o, $it);
  }

  proto method polygon (|)
  { * }

  multi method polygon (
    Int() $image_ID,
    Int() $operation,
    @segs
  ) {
    samewith( $image_ID, $operation, @segs.elems, DoubleArrayToCArray(@segs) );
  }
  multi method polygon (
    Int() $image_ID,
    Int() $operation,
    Int() $num_segs,
    CArray[gdouble] $segs
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelOps $o = $operation;
    my gint $n = $num_segs;

    gimp_image_select_polygon($i, $o, $n, $segs);
  }

  method rectangle (
    Int() $image_ID,
    Int() $operation,
    Num() $x,
    Num() $y,
    Num() $width,
    Num() $height
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelOps $o = $operation;
    my gdouble ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    gimp_image_select_rectangle($i, $o, $xx, $yy, $w, $h);
  }

  method round_rectangle (
    Int() $image_ID,
    Int() $operation,
    Num() $x,
    Num() $y,
    Num() $width,
    Num() $height,
    Num() $corner_radius_x,
    Num() $corner_radius_y
  ) {
    my gint32 $i = $image_ID;
    my GimpChannelOps $o = $operation;
    my gdouble ($xx, $yy, $w, $h, $cx, $cy) = (
      $x,
      $y,
      $width,
      $height,
      $corner_radius_x,
      $corner_radius_y
    );

    gimp_image_select_round_rectangle($i, $o, $xx, $yy, $w, $h, $cx, $cy);
  }

}

class GIMP::PDB::Image::Undo {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method disable (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_disable($i);
  }

  method enable (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_enable($i);
  }

  method freeze (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_freeze($i);
  }

  method group_end (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_group_end($i);
  }

  method group_start (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_group_start($i);
  }

  method is_enabled (Int() $image_ID) {
    my gint32 $i = $image_ID;

    so gimp_image_undo_is_enabled($i);
  }

  method thaw (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_image_undo_thaw($i);
  }

}

constant Image        is export := GIMP::PDB::Image;
constant ImageConvert is export := GIMP::PDB::Image::Convert;
constant ImageGrid    is export := GIMP::PDB::Image::Grid;
constant ImageSelect  is export := GIMP::PDB::Image::Select;
constant ImageUndo    is export := GIMP::PDB::Image::Undo;
