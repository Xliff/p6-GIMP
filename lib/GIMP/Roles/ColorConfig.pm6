use v6;

use NativeCall;

use GIMP::Raw::Types;

use GIMP::Raw::ColorConfig;

use GIMP::Roles::Config;

role GIMP::Roles::ColorConfig {
  also does GIMP::Roles::Config;

  has GimpColorConfig $!gcc;

  method !configCheckForRole {
    my \i = findProperImplementor(self.^attributes);
    $!gcc does Implementor unless i;
  }

  multi submethod BUILD (
    :$color-config is required
  ) {
    $!gcc = $color-config if $color-config.defined;

    self!configCheckForRole;
    self.roleInit-Config;
  }
  multi submethod BUILD (
    :$color-config,
    :$mode,
    :$rgb_profile,
    :$cmyk_profile,
    :$display_profile,
    :$display_profile_from_gdk,
    :$printer_profile,
    :$display_intent,
    :$simulation_intent,
    :$display_module,
    :$simulation_gamut_check,
    :$out_of_gamut_color,
    :$display_use_black_point_compensation,
    :$simulation_use_black_point_compensation,
    :$gray_profile
  ) {
    $!gcc = GimpColorConfig.new;

    # Insures methods are used, if defined.
    self.mode                     = $mode;
    self.rgb_profile              = $rgb_profile;
    self.cmyk_profile             = $cmyk_profile;
    self.display_profile          = $display_profile;
    self.display_profile_from_gdk = $display_profile_from_gdk;
    self.printer_profile          = $printer_profile;
    self.display_intent           = $display_intent;
    self.simulation_intent        = $simulation_intent;
    self.display_module           = $display_module;
    self.simulation_gamut_check   = $simulation_gamut_check;
    self.out_of_gamut_color       = $out_of_gamut_color;
    self.gray_profile             = $gray_profile;

    self.display_use_black_point_compensation    =
      $display_use_black_point_compensation;
    self.simulation_use_black_point_compensation =
      $simulation_use_black_point_compensation;

    self!configCheckForRole;
    self.roleInit-Config;
  }

  method get_cmyk_color_profile (
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = gimp_color_config_get_cmyk_color_profile($!gcc, $error);
    set_error($error);
    $rv;
  }

  method get_display_bpc {
    gimp_color_config_get_display_bpc($!gcc);
  }

  method get_display_color_profile (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $rv = gimp_color_config_get_display_color_profile($!gcc, $error);
    set_error($error);
    $rv;
  }

  method get_display_intent {
    GimpColorRenderingIntent(
      gimp_color_config_get_display_intent($!gcc)
    );
  }

  method get_display_optimize {
    gimp_color_config_get_display_optimize($!gcc);
  }

  method get_display_profile_from_gdk {
    gimp_color_config_get_display_profile_from_gdk($!gcc);
  }

  method get_gray_color_profile (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $rv = gimp_color_config_get_gray_color_profile($!gcc, $error);
    set_error($error);
    $rv;
  }

  method get_mode {
    GimpColorManagementMode( gimp_color_config_get_mode($!gcc) );
  }

  method get_rgb_color_profile (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $rv = gimp_color_config_get_rgb_color_profile($!gcc, $error);
    set_error($error);
    $rv;
  }

  method get_simulation_bpc {
    gimp_color_config_get_simulation_bpc($!gcc);
  }

  method get_simulation_color_profile (
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = gimp_color_config_get_simulation_color_profile($!gcc, $error);
    set_error($error);
    $rv;
  }

  method get_simulation_gamut_check {
    gimp_color_config_get_simulation_gamut_check($!gcc);
  }

  method get_simulation_intent {
    GimpColorRenderingIntentEnum(
      gimp_color_config_get_simulation_intent($!gcc)
    );
  }

  method get_simulation_optimize {
    gimp_color_config_get_simulation_optimize($!gcc);
  }

  method colorconfig_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_color_config_get_type, $n, $t );
  }

}

BEGIN {
  # Circle back after lizmat++ makes this easier in core.
  my \ra := GimpColorConfig;

  for ra.^attributes.grep({ $_ ~~ Delegatable }) {
    # Does NOT currently handle aliases.
    trait_mod:<handles>(
      GIMP::Roles::ColorConfig.^attributes[0],
      .name.substr(2)
    )
  }
}
