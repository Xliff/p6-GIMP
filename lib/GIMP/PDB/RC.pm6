use v6;

use GTK::Compat::Types;

use GIMP::PDB::Raw::RC;

use GLib::Roles::StaticClass;

class GIMP::PDB::RC {
  also does GLib::Roles::StaticClass;

  # method _gimp_get_color_configuration {
  #   _gimp_get_color_configuration();
  # }

  method default_comment {
    gimp_get_default_comment();
  }

  method default_unit {
    GimpUnitEnum( gimp_get_default_unit() );
  }

  method icon_theme_dir {
    gimp_get_icon_theme_dir();
  }

  method module_load_inhibit {
    gimp_get_module_load_inhibit();
  }

  method monitor_resolution (Num() $xres, Num() $yres) {
    my gdouble ($xr, $yr) = ($xres, $yres);

    gimp_get_monitor_resolution($xr, $yr);
  }

  method theme_dir {
    gimp_get_theme_dir();
  }

  method query (Str() $token) {
    gimp_gimprc_query($token);
  }

  method set (Str() $token, Str() $value) {
    gimp_gimprc_set($token, $value);
  }

}
