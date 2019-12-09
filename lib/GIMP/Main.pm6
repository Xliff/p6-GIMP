use v6;

use NativeCall;

use GIMP::Raw::Types;

use GLib::Roles::StaticClass;

class GIMP::Main {
  also does GLib::Roles::StaticClass;

  method attach_new_parasite (Str $name, gint $flags, gint $size, gconstpointer $data) {
    gimp_attach_new_parasite($name, $flags, $size, $data);
  }

  method check_size {
    gimp_check_size();
  }

  method check_type {
    gimp_check_type();
  }

  method default_display {
    gimp_default_display();
  }

  method destroy_paramdefs (GimpParamDef $paramdefs, gint $n_params) {
    gimp_destroy_paramdefs($paramdefs, $n_params);
  }

  method destroy_params (GimpParam $params, gint $n_params) {
    gimp_destroy_params($params, $n_params);
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

  method extension_process (guint $timeout) {
    gimp_extension_process($timeout);
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

  method install_cmap {
    gimp_install_cmap();
  }

  method install_procedure (Str $name, Str $blurb, Str $help, Str $author, Str $copyright, Str $date, Str $menu_label, Str $image_types, GimpPDBProcType $type, gint $n_params, gint $n_return_vals, GimpParamDef $params, GimpParamDef $return_vals) {
    gimp_install_procedure($name, $blurb, $help, $author, $copyright, $date, $menu_label, $image_types, $type, $n_params, $n_return_vals, $params, $return_vals);
  }

  method install_temp_proc (Str $name, Str $blurb, Str $help, Str $author, Str $copyright, Str $date, Str $menu_label, Str $image_types, GimpPDBProcType $type, gint $n_params, gint $n_return_vals, GimpParamDef $params, GimpParamDef $return_vals, GimpRunProc $run_proc) {
    gimp_install_temp_proc($name, $blurb, $help, $author, $copyright, $date, $menu_label, $image_types, $type, $n_params, $n_return_vals, $params, $return_vals, $run_proc);
  }

  method main (GimpPlugInInfo $info, gint $argc, Str $argv) {
    gimp_main($info, $argc, $argv);
  }

  method min_colors {
    gimp_min_colors();
  }

  method monitor_number {
    gimp_monitor_number();
  }

  method parasite_attach (GimpParasite $parasite) {
    gimp_parasite_attach($parasite);
  }

  method parasite_detach (Str $name) {
    gimp_parasite_detach($name);
  }

  method parasite_find (Str $name) {
    gimp_parasite_find($name);
  }

  method parasite_list (gint $num_parasites, Str $parasites) {
    gimp_parasite_list($num_parasites, $parasites);
  }

  method quit {
    gimp_quit();
  }

  method run_procedure (Str $name, gint $n_return_vals, ...) {
    gimp_run_procedure($name, $n_return_vals);
  }

  method run_procedure2 (Str $name, gint $n_return_vals, gint $n_params, GimpParam $params) {
    gimp_run_procedure2($name, $n_return_vals, $n_params, $params);
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

  method uninstall_temp_proc (Str $name) {
    gimp_uninstall_temp_proc($name);
  }

  method user_time {
    gimp_user_time();
  }

  method wm_class {
    gimp_wm_class();
  }

}

sub MAIN (*@args) is export  {
  die '$PLUG_IN_INFO is not a GimpPluginInfo structure'
    unless $PLUG_IN_INFO ~~ GimpPluginInfo;

  gimp_main( $PLUG_IN_INFO, @args.elems, ArrayToCArray(@args) )
}
