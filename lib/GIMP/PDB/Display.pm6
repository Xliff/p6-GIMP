use v6;

use GTK::Compat::Types;

use GIMP::PDB::Raw::Display;

use GLib::Roles::StaticClass;

class GIMP::PDB::Display {
  also does GLib::Roles::StaticClass;

  method new_display (Int() $image_ID) {
    my guint32 $i = $image_ID;

    gimp_display_new($i);
  }

  method delete (Int() $display_ID) {
    my guint32 $d = $display_ID;

    gimp_display_delete($display_ID);
  }

  method get_window_handle (Int() $display_ID) {
    my guint32 $d = $display_ID;

    gimp_display_get_window_handle($display_ID);
  }

  method flush {
    gimp_displays_flush();
  }

  method reconnect (Int() $old_image_ID, Int() $new_image_ID) {
    my gint32 ($o, $n) = ($old_image_ID, $new_image_ID);

    gimp_displays_reconnect($o, $n);
  }

  method is_valid (Int() $display_ID) {
    my guint32 $d = $display_ID;

    gimp_display_is_valid($display_ID);
  }

}
