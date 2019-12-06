use v6;

use GIMP::Raw::Types;
use GIMP::Raw::Env;

use GLib::Roles::StaticClass;

class GIMP::Env {
  also does GLib::Roles::StaticClass;

  method data_directory {
    gimp_data_directory();
  }

  method directory {
    gimp_directory();
  }

  method init (Int() $plug_in) {
    my gboolean $p = (so $plug_in).Int;

    gimp_env_init($plug_in);
  }

  # Deprecated
  # method gtkrc {
  #   gimp_gtkrc();
  # }

  method installation_directory {
    gimp_installation_directory();
  }

  method locale_directory {
    gimp_locale_directory();
  }

  method path_free (GList() $path) {
    gimp_path_free($path);
  }

  method path_get_user_writable_dir (GList() $path) {
    gimp_path_get_user_writable_dir($path);
  }

  proto method path_parse (|)
  { * }

  multi method path_parse (
    Str() $path,
    Int() $max_paths,
    Int() $check,
    :$glist = False,
    :$all = True
  ) {
    samewith($path, $max_paths, $check, $, :$glist);
  }
  multi method path_parse (
    Str() $path,
    Int() $max_paths,
    Int() $check,
    $check_failed is rw,
    :$glist = False,
    :$all = False
  ) {
    my gint $m = $max_paths;
    my gboolean $c = (so $check).Int;
    my $cf = CArray[CArray[GList]].new;
    $cf[0] = CArray[GList];

    my $pl = gimp_path_parse($path, $m, $c, $cf);
    $check_failed = $cf[0] ??
      ( $glist ?? $cf[0] !! GTK::Compat::GList.new($cf[0]) )
      !!
      Nil;
    $check_failed = ($check_failed but GTK::Compat::ListData[Str]).Array
      unless $glist;

    return Nil unless $pl;
    return $pl if     $glist;

    $pl = $pl but GTK::Compat::Roles::ListData[Str];
    $all.not ?? $pl.Array !! ($pl.Array, $check_failed);
  }

  method path_to_str (GList() $path) {
    gimp_path_to_str($path);
  }

  method personal_rc_file (Str $basename) {
    gimp_personal_rc_file($basename);
  }

  method plug_in_directory {
    gimp_plug_in_directory();
  }

  method sysconf_directory {
    gimp_sysconf_directory();
  }

  # Deprecated
  # method user_directory (GimpUserDirectory $type) {
  #   gimp_user_directory($type);
  # }

}
