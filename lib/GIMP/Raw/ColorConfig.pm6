use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::Raw::ColorConfig;

### /usr/include/gimp-2.0/libgimpconfig/gimpcolorconfig.h

sub gimp_color_config_get_cmyk_color_profile (
  GimpColorConfig $config,
  CArray[Pointer[GError]] $error
)
  returns GimpColorProfile
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_display_bpc (GimpColorConfig $config)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_display_color_profile (
  GimpColorConfig $config,
  CArray[Pointer[GError]] $error
)
  returns GimpColorProfile
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_display_intent (GimpColorConfig $config)
  returns GimpColorRenderingIntent
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_display_optimize (GimpColorConfig $config)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_display_profile_from_gdk (GimpColorConfig $config)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_gray_color_profile (
  GimpColorConfig $config,
  CArray[Pointer[GError]] $error
)
  returns GimpColorProfile
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_mode (GimpColorConfig $config)
  returns GimpColorManagementMode
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_rgb_color_profile (
  GimpColorConfig $config,
  CArray[Pointer[GError]] $error
)
  returns GimpColorProfile
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_simulation_bpc (GimpColorConfig $config)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_simulation_color_profile (
  GimpColorConfig $config,
  CArray[Pointer[GError]] $error
)
  returns GimpColorProfile
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_simulation_gamut_check (GimpColorConfig $config)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_simulation_intent (GimpColorConfig $config)
  returns GimpColorRenderingIntent
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_simulation_optimize (GimpColorConfig $config)
  returns uint32
  is native(gimpconfig)
  is export
{ * }

sub gimp_color_config_get_type ()
  returns GType
  is native(gimpconfig)
  is export
{ * }
