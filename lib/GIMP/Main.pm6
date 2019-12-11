use v6;

use NativeCall;

use GTK::Raw::Utils;

use GIMP::Raw::Types;
use GIMP::Raw::Main;

use GLib::Roles::StaticClass;

use GTK::Compat::Roles::TypedBuffer;

package GIMP::MainVar {
  our $PLUG_IN_INFO is export;
}

class GIMP::Main {
  also does GLib::Roles::StaticClass;

  method check_size {
    gimp_check_size();
  }

  method check_type {
    gimp_check_type();
  }

  method default_display {
    gimp_default_display();
  }

  proto method destroy_paramdefs (|)
  { * }

  multi method destroy_paramdefs (
    GTK::Compat::Roles::TypedBuffer[GimpParamDef] $defs
  ) {
    samewith($defs.p, $defs.size);
  }
  multi method destroy_paramdefs (Pointer $paramdefs, Int() $n_params) {
    my gint $n = $n_params;

    gimp_destroy_paramdefs($paramdefs, $n);
  }

  proto method destroy_params (|)
  { * }

  multi method destroy_params (
    GTK::Compat::Roles::TypedBuffer[GimpParam] $defs
  ) {
    samewith($defs.p, $defs.size);
  }
  multi method destroy_params (Pointer $params, Int() $n_params) {
    my gint $n = $n_params;

    gimp_destroy_params($params, $n);
  }

  method display_name {
    gimp_display_name();
  }

  method export_color_profile {
    gimp_export_color_profile();
  }

  method export_exif {
    gimp_export_exif();
  }

  method export_iptc {
    gimp_export_iptc();
  }

  method export_xmp {
    gimp_export_xmp();
  }

  method extension_ack {
    gimp_extension_ack();
  }

  method extension_enable {
    gimp_extension_enable();
  }

  method extension_process (Int() $timeout) {
    my guint $t = $timeout;

    gimp_extension_process($t);
  }

  method gamma {
    gimp_gamma();
  }

  method get_pdb_error {
    gimp_get_pdb_error();
  }

  method get_pdb_status {
    gimp_get_pdb_status();
  }

  method get_progname {
    gimp_get_progname();
  }

  method icon_theme_dir {
    gimp_icon_theme_dir();
  }

  proto method install_procedure (|)
  { * }

  multi method install_procedure (
    Str() $name,
    Str() $blurb,
    Str() $help,
    Str() $author,
    Str() $copyright,
    Str() $date,
    Str() $menu_label,
    Str() $image_types,
    Int() $type,
    @params,
    @returns
  ) {
    die '@params must only contain GimpParamDef elements!'
      unless @params.all ~~ GimpParamDef;
    die '@returns must only contain GimpParamDef elements!'
      unless @returns.all ~~ GimpParamDef;
    my $p = GTK::Compat::Roles::TypedBuffer[GimpParamDef].new(@params);
    my $r = GTK::Compat::Roles::TypedBuffer[GimpParamDef].new(@returns);

    samewith(
      $name,
      $blurb,
      $help,
      $author,
      $copyright,
      $date,
      $menu_label,
      $image_types,
      $type,
      $p.size,
      $r.size,
      $p.p,
      $r.p
    );
  }

  multi method install_procedure (
    Str() $name,
    Str() $blurb,
    Str() $help,
    Str() $author,
    Str() $copyright,
    Str() $date,
    Str() $menu_label,
    Str() $image_types,
    Int() $type,
    Int() $n_params,
    Int() $n_return_vals,
    Pointer $params,
    Pointer $return_vals
  ) {
    my gint ($np, $nr) = ($n_params, $n_return_vals);
    my GimpPDBProcType $t = $type;

    gimp_install_procedure(
      $name,
      $blurb,
      $help,
      $author,
      $copyright,
      $date,
      $menu_label,
      $image_types,
      $t,
      $np,
      $nr,
      $params,
      $return_vals
    );
  }

  proto method install_temp_proc (|)
  { * }

  multi method install_temp_proc (
    Str() $name,
    Str() $blurb,
    Str() $help,
    Str() $author,
    Str() $copyright,
    Str() $date,
    Str() $menu_label,
    Str() $image_types,
    Int() $type,
    @params,
    @returns
  ) {
    die '@params must only contain GimpParamDef elements!'
      unless @params.all ~~ GimpParamDef;
    die '@returns must only contain GimpParamDef elements!'
      unless @returns.all ~~ GimpParamDef;
    my $p = GTK::Compat::Roles::TypedBuffer[GimpParamDef].new(@params);
    my $r = GTK::Compat::Roles::TypedBuffer[GimpParamDef].new(@returns);

    samewith(
      $name,
      $blurb,
      $help,
      $author,
      $copyright,
      $date,
      $menu_label,
      $image_types,
      $type,
      $p.size,
      $r.size,
      $p.p,
      $r.p
    );
  }
  multi method install_temp_proc (
    Str() $name,
    Str() $blurb,
    Str() $help,
    Str() $author,
    Str() $copyright,
    Str() $date,
    Str() $menu_label,
    Str() $image_types,
    Int() $type,
    Int() $n_params,
    Int() $n_return_vals,
    Pointer $params,      # Array - GimpParamDef $parms
    Pointer $return_vals, # Array -GimpParamDef $return_vals,
    &run_proc
  ) {
    my gint ($np, $nr) = ($n_params, $n_return_vals);
    my GimpPDBProcType $t = $type;

    gimp_install_temp_proc(
      $name,
      $blurb,
      $help,
      $author,
      $copyright,
      $date,
      $menu_label,
      $image_types,
      $type,
      $np,
      $nr,
      $params,
      $return_vals,
      &run_proc
    );
  }

  multi method main (GimpPluginInfo $info, @args) {
    samewith( $info, @args.elems, ArrayToCArray(Str, @args) );
  }
  multi method main (GimpPluginInfo $info, gint $argc, CArray[Str] $argv) {
    gimp_main($info, $argc, $argv);
  }

  method monitor_number {
    gimp_monitor_number();
  }

  method quit {
    gimp_quit();
  }

  proto method run_procedure (|)
  { * }

  multi method run_procedure (
    Str() $name,
    @params,
    :$raw = False
  ) {
    my $pb = GTK::Compat::roles::TypedBuffer[GimpParam].new(@params);

    samewith($name, $, @params.elems, $pb.p);
  }
  multi method run_procedure (
    Str() $name,
    $n_return_vals is rw,
    Int() $n_params,
    Pointer $params,
    :$raw = False
  ) {
    my gint ($np, $nr) = ($n_params, 0);
    my $p = gimp_run_procedure($name, $nr, $np, $params);

    return Nil unless $p;
    return $p  if $raw;

    GTK::Compat::Roles::TypedBuffer[GimpParam].new($p);
  }

  method shm_ID {
    gimp_shm_ID();
  }

  method shm_addr {
    gimp_shm_addr();
  }

  method show_help_button {
    gimp_show_help_button();
  }

  method show_tool_tips {
    gimp_show_tool_tips();
  }

  method tile_height {
    gimp_tile_height();
  }

  method tile_width {
    gimp_tile_width();
  }

  method uninstall_temp_proc (Str() $name) {
    gimp_uninstall_temp_proc($name);
  }

  method user_time {
    gimp_user_time();
  }

  method wm_class {
    gimp_wm_class();
  }

}

sub gimp_MAIN (*@args) is export  {
  die '$PLUG_IN_INFO is not a GimpPluginInfo structure'
    unless $PLUG_IN_INFO ~~ GimpPluginInfo;

  GIMP::Main.main( $PLUG_IN_INFO, @args )
}
