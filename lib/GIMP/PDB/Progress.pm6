use v6;

use NativeCall;

use GIMP::Raw::Types;

use GLib::Roles::StaticClass;

class GIMP::PDB::Progress {
  also does GLib::Roles::StaticClass;

  method get_window_handle {
    gimp_progress_get_window_handle();
  }

  method set_text (Str() $message) {
    gimp_progress_set_text($message);
  }

}


### /usr/include/gimp-2.0/libgimp/gimpprogress_pdb.h

sub gimp_progress_get_window_handle ()
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_progress_set_text (Str $message)
  returns uint32
  is native(gimp)
  is export
{ * }
