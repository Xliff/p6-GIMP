use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::PDB::Raw::Progress;

use GLib::Roles::StaticClass;

class GIMP::PDB::Progress {
  also does GLib::Roles::StaticClass;

  method cancel (Str() $progress_callback) {
    gimp_progress_cancel($progress_callback);
  }

  method end {
    gimp_progress_end();
  }

  method get_window_handle {
    gimp_progress_get_window_handle();
  }

  method init (Str() $message) {
    gimp_progress_init($message);
  }

  method install_vtable (GimpProgressVtable $vtable, gpointer $user_data) {
    gimp_progress_install_vtable($vtable, $user_data);
  }

  method pulse {
    gimp_progress_pulse();
  }

  method set_text (Str() $message) {
    gimp_progress_set_text($message);
  }

  method uninstall (Str $progress_callback) {
    gimp_progress_uninstall($progress_callback);
  }

  method update (gdouble $percentage) {
    gimp_progress_update($percentage);
  }

}
