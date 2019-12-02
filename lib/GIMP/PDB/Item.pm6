use v6;

use GTK::Compat::Types;

use GIMP::Raw::Structs;

use GIMP::PDB::Raw::Item;

use GLib::Roles::StaticClass;

class GIMP::PDB::Item {
  also does GLib::Roles::StaticClass;

  method attach_parasite (Int() $image_ID, GimpParasite $parasite) {
    my gint32 $i = $item_ID;

    gimp_item_attach_parasite($i, $parasite);
  }

  method delete (Int() $image_ID) {
    my gint32 $i = $item_ID;

    gimp_item_delete($i);
  }

  method detach_parasite (Int() $image_ID, Str() $name) {
    my gint32 $i = $item_ID;

    gimp_item_detach_parasite($i, $name);
  }

  method get_children (Int() $image_ID, Int() $num_children) {
    my gint32 $i = $item_ID;
    my gint $n = $num_children

    gimp_item_get_children($i, $n);
  }

  method get_color_tag (Int() $image_ID) {
    my gint32 $i = $item_ID;

    GimpColorTagEnum( gimp_item_get_color_tag($i) );
  }

  method get_expanded (Int() $image_ID) {
    my gint32 $i = $item_ID;

    gimp_item_get_expanded($i);
  }

  method get_image (Int() $image_ID) {
    my gint32 $i = $item_ID;

    gimp_item_get_image($i);
  }

  method get_linked (Int() $image_ID) {
    my gint32 $i = $item_ID;

    gimp_item_get_linked($i);
  }

  method get_lock_content (Int() $image_ID) {
    my gint32 $i = $item_ID;

    gimp_item_get_lock_content($i);
  }

  method get_lock_position (Int() $image_ID) {
    my gint32 $i = $item_ID;

    gimp_item_get_lock_position($i);
  }

  method get_name (Int() $image_ID) {
    my gint32 $i = $item_ID;

    gimp_item_get_name($i);
  }

  method get_parasite (Int() $image_ID, Str() $name) {
    my gint32 $i = $item_ID;

    gimp_item_get_parasite($i, $name);
  }

  proto method get_parasite_list (|)
  { * }

  multi method get_parasite_list(Int() $image_ID) {
    samewith($image_ID, $);
  }
  multi method get_parasite_list (Int() $image_ID, $num_parasites is rw) {
    my gint32 $i = $item_ID;
    my gint $n = 0;
    my $pa = gimp_item_get_parasite_list($i, $n);
    $num_parasites = $n;

    CStringArrayToArray($pa, $n);
  }

  method get_parent (Int() $image_ID) {
    my gint32 $i = $item_ID;

    gimp_item_get_parent($i);
  }

  method get_tattoo (Int() $image_ID) {
    my gint32 $i = $item_ID;

    gimp_item_get_tattoo($i);
  }

  method get_visible (Int() $image_ID) {
    my gint32 $i = $item_ID;

    so gimp_item_get_visible($i);
  }

  method is_channel (Int() $image_ID) {
    my gint32 $i = $item_ID;

    so gimp_item_is_channel($i);
  }

  method is_drawable (Int() $image_ID) {
    my gint32 $i = $item_ID;

    so gimp_item_is_drawable($i);
  }

  method is_group (Int() $image_ID) {
    my gint32 $i = $item_ID;

    so gimp_item_is_group($i);
  }

  method is_layer (Int() $image_ID) {
    my gint32 $i = $item_ID;

    so gimp_item_is_layer($i);
  }

  method is_layer_mask (Int() $image_ID) {
    my gint32 $i = $item_ID;

    so gimp_item_is_layer_mask($i);
  }

  method is_selection (Int() $image_ID) {
    my gint32 $i = $item_ID;

    so gimp_item_is_selection($i);
  }

  method is_text_layer (Int() $image_ID) {
    my gint32 $i = $item_ID;

    so gimp_item_is_text_layer($i);
  }

  method is_valid (Int() $image_ID) {
    my gint32 $i = $item_ID;

    so gimp_item_is_valid($i);
  }

  method is_vectors (Int() $image_ID) {
    my gint32 $i = $item_ID;

    so gimp_item_is_vectors($i);
  }

  method set_color_tag (Int() $image_ID, Int() $color_tag) {
    my gint32 $i = $item_ID;
    my GimpColorTag $c = $color_tag;

    gimp_item_set_color_tag($i, $c);
  }

  method set_expanded (Int() $image_ID, Int() $expanded) {
    my gint32 $i = $item_ID;
    my gboolean $e = (so $expanded).Int;

    so gimp_item_set_expanded($i, $expanded);
  }

  method set_linked (Int() $image_ID, Int() $linked) {
    my gint32 $i = $item_ID;
    my gboolean $l = (so $linked).Int;

    so gimp_item_set_linked($i, $linked);
  }

  method set_lock_content (Int() $image_ID, Int() $lock_content) {
    my gint32 $i = $item_ID;
    my gboolean $l = (so $lock_content).Int;

    so gimp_item_set_lock_content($i, $l);
  }

  method set_lock_position (Int() $image_ID, Int() $lock_position) {
    my gint32 $i = $item_ID;
    my gboolean $l = (so $lock_position).Int;

    so gimp_item_set_lock_position($i, $l);
  }

  method set_name (Int() $image_ID, Str $name) {
    my gint32 $i = $item_ID;

    so gimp_item_set_name($i, $name);
  }

  method set_tattoo (Int() $image_ID, Int() $tattoo) {
    my gint32 $i = $item_ID;
    my gint $t = $tattoo;

    so gimp_item_set_tattoo($i, $t);
  }

  method set_visible (Int() $image_ID, Int() $visible) {
    my gint32 $i = $item_ID;
    my gboolean $v = (so $visible).Int;

    so gimp_item_set_visible($i, $v);
  }

}
