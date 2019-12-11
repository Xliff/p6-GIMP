use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::Raw::Main;

our $PLUG_IN_INFO is export;

### /usr/include/gimp-2.0/libgimp/gimp.h

sub gimp_check_size ()
  returns GimpCheckSize
  is native(gimp)
  is export
{ * }

sub gimp_check_type ()
  returns GimpCheckType
  is native(gimp)
  is export
{ * }

sub gimp_default_display ()
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_destroy_paramdefs (
  Pointer $paramdefs, # Array-GimpParamDef
  gint $n_params
)
  is native(gimp)
  is export
{ * }

sub gimp_destroy_params (
  Pointer $params, # Array-GimpParam
  gint $n_params
)
  is native(gimp)
  is export
{ * }

sub gimp_display_name ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_export_color_profile ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_export_exif ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_export_iptc ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_export_xmp ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_extension_ack ()
  is native(gimp)
  is export
{ * }

sub gimp_extension_enable ()
  is native(gimp)
  is export
{ * }

sub gimp_extension_process (guint $timeout)
  is native(gimp)
  is export
{ * }

sub gimp_gamma ()
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_get_pdb_error ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_get_pdb_status ()
  returns GimpPDBStatusType
  is native(gimp)
  is export
{ * }

sub gimp_get_progname ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_icon_theme_dir ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_install_procedure (
  Str $name,
  Str $blurb,
  Str $help,
  Str $author,
  Str $copyright,
  Str $date,
  Str $menu_label,
  Str $image_types,
  GimpPDBProcType $type,
  gint $n_params,
  gint $n_return_vals,
  Pointer $params,       # Array-GimpParamDef $params,
  Pointer $return_vals,  # Array-GimpParamDef $return_vals,
)
  is native(gimp)
  is export
{ * }

sub gimp_install_temp_proc (
  Str $name,
  Str $blurb,
  Str $help,
  Str $author,
  Str $copyright,
  Str $date,
  Str $menu_label,
  Str $image_types,
  GimpPDBProcType $type,
  gint $n_params,
  gint $n_return_vals,
  Pointer $params,       # Array-GimpParamDef $params,
  Pointer $return_vals,  # Array-GimpParamDef $return_vals,

  # &run_proc will need to set $carray[0] ONLY! Best done with a TypedBuffer.
  &run_proc (Str, gint, GimpParam, gint, CArray[Pointer])
)
  is native(gimp)
  is export
{ * }

sub gimp_main (
  GimpPluginInfo $info, # Array-GimpPlugInInfo $info,
  gint $argc,
  CArray[Str] $argv
)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_monitor_number ()
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_quit ()
  is native(gimp)
  is export
{ * }

# sub gimp_run_procedure (Str $name, gint $n_return_vals, ...)
#   returns GimpParam
#   is native(gimp)
#   is export
# { * }

sub gimp_run_procedure (
  Str $name,
  gint $n_return_vals is rw,
  gint $n_params,
  Pointer $params              # Array - GParam
)
  returns Pointer              # Array - GParam
  is native(gimp)
  is export
{ * }

sub gimp_shm_ID ()
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_shm_addr ()
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_show_help_button ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_show_tool_tips ()
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_tile_height ()
  returns guint
  is native(gimp)
  is export
{ * }

sub gimp_tile_width ()
  returns guint
  is native(gimp)
  is export
{ * }

sub gimp_uninstall_temp_proc (Str $name)
  is native(gimp)
  is export
{ * }

sub gimp_user_time ()
  returns guint32
  is native(gimp)
  is export
{ * }

sub gimp_wm_class ()
  returns Str
  is native(gimp)
  is export
{ * }
