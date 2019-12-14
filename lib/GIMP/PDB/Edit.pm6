use v6;

use GIMP::Raw::Types;
use GIMP::PDB::Raw::Edit;

use GLib::Roles::StaticClass;
use GIMP::PDB::Roles::Assumable;

class GIMP::PDB::Edit {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method copy (Int() $drawable_ID) {
    my gint32 $d = $drawable_ID;

    gimp_edit_copy($drawable_ID);
  }

  method cut (Int() $drawable_ID) {
    my gint32 $d = $drawable_ID;

    gimp_edit_cut($drawable_ID);
  }

  method named_copy (Int() $drawable_ID, Str() $buffer_name) {
    my gint32 $d = $drawable_ID;

    gimp_edit_named_copy($drawable_ID, $buffer_name);
  }

  method named_cut (Int() $drawable_ID, Str() $buffer_name) {
    my gint32 $d = $drawable_ID;

    gimp_edit_named_cut($drawable_ID, $buffer_name);
  }

  method named_paste (
    Int() $drawable_ID,
    Str() $buffer_name,
    Int() $paste_into
  ) {
    my gint32 $d = $drawable_ID;
    my gboolean $p = (so $paste_into).Int;

    gimp_edit_named_paste($drawable_ID, $buffer_name, $paste_into);
  }

  method named_paste_as_new_image (Str() $buffer_name) {
    gimp_edit_named_paste_as_new_image($buffer_name);
  }

  method paste (Int() $drawable_ID, Int() $paste_into) {
    my gint32 $d = $drawable_ID;
    my gboolean $p = (so $paste_into).Int;

    gimp_edit_paste($drawable_ID, $p);
  }

  method paste_as_new_image {
    gimp_edit_paste_as_new_image();
  }

}

class GIMP::PDB::Edit::Visible {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method copy (Int() $image_ID) {
    my gint32 $i = $image_ID;

    gimp_edit_copy_visible($image_ID);
  }

  method named_copy (Int() $image_ID, Str() $buffer_name) {
    my gint32 $i = $image_ID;

    gimp_edit_named_copy_visible($image_ID, $buffer_name);
  }
}
