use v6;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::Progress

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

sub gimp_progress_cancel (Str $progress_callback)
  returns uint32
  is native(gimpbase)
  is export
{ * }

sub gimp_progress_end ()
  returns uint32
  is native(gimpbase)
  is export
{ * }

sub gimp_progress_get_window_handle ()
  returns gint
  is native(gimpbase)
  is export
{ * }

sub gimp_progress_pulse ()
  returns uint32
  is native(gimpbase)
  is export
{ * }

sub gimp_progress_set_text (Str $message)
  returns uint32
  is native(gimpbase)
  is export
{ * }


### /usr/include/gimp-2.0/libgimp/gimpprogress.h

sub gimp_progress_init (Str $message)
  returns uint32
  is native(gimpbase)
  is export
{ * }

sub gimp_progress_install_vtable (
  GimpProgressVtable $vtable,
  gpointer $user_data
)
  returns Str
  is native(gimpbase)
  is export
{ * }


sub gimp_progress_uninstall (Str $progress_callback)
  returns Pointer
  is native(gimpbase)
  is export
{ * }

sub gimp_progress_update (gdouble $percentage)
  returns uint32
  is native(gimpbase)
  is export
{ * }
