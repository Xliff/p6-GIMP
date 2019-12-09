use v6;

use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::ColorProfile;

use GTK::Raw::Utils;

use GTK::Compat::Roles::Object;

class GIMP::ColorProfile {
  also does GTK::Compat::Roles::Object;

  has GimpColorProfile $!cp;

  submethod BUILD (:$profile) {
    $!cp = $profile;

    self.roleInit-Object;
  }

  method GIMP::Raw::Types::GimpColorProfile
  { $!cp }

  method new_d50_gray_lab_trc {
    my $profile = gimp_color_profile_new_d50_gray_lab_trc();

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  method new_d65_gray_linear {
    my $profile = gimp_color_profile_new_d65_gray_linear();

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  method new_d65_gray_srgb_trc {
    my $profile = gimp_color_profile_new_d65_gray_srgb_trc();

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  method new_from_file (
    GFile() $file,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $profile = gimp_color_profile_new_from_file($file, $error);
    set_error($error);

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  proto method new_from_icc_profile (|)
  { * }

  multi method new_from_icc_profile (
    @data,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my $ca = ArrayToCArray(guint8, @data);

    samewith($ca, @data.elems, $error)
  }
  multi method new_from_icc_profile (
    Blob $d,
    CArray[Pointer[GError]] $error = gerror
  ) {
    samewith( cast($d, CArray[gint8]), $d.elems, $error);
  }
  multi method new_from_icc_profile (
    CArray[guint8] $data,
    Int() $length,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my gsize $l = $length;

    clear_error;
    my $profile = gimp_color_profile_new_from_icc_profile(
      $!cp,
      $length,
      $error
    );
    set_error($error);

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  method new_from_lcms_profile (
    Pointer $lcms_profile,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $profile = gimp_color_profile_new_from_lcms_profile(
      $lcms_profile,
      $error
    );
    set_error($error);

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  method new_linear_from_color_profile (GimpColorProfile() $p) {
    my $profile = gimp_color_profile_new_linear_from_color_profile($p);

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  method new_rgb_adobe {
    my $profile = gimp_color_profile_new_rgb_adobe();

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  method new_rgb_srgb {
    my $profile = gimp_color_profile_new_rgb_srgb();

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  method new_rgb_srgb_linear {
    my $profile = gimp_color_profile_new_rgb_srgb_linear();

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  method new_srgb_trc_from_color_profile (GimpColorProfile() $p) {
    my $profile = gimp_color_profile_new_srgb_trc_from_color_profile($p);

    $profile ?? self.bless( :$profile ) !! Nil;
  }

  method get_copyright {
    gimp_color_profile_get_copyright($!cp);
  }

  method get_description {
    gimp_color_profile_get_description($!cp);
  }

  method get_format (
    Babl $format,
    Int() $intent,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my GimpColorRenderingIntent $i = $intent;

    gimp_color_profile_get_format($!cp, $format, $i, $error);
  }

  proto method get_icc_profile (|)
  { * }

  multi method get_icc_profile {
    samewith($);
  }
  multi method get_icc_profile ($length is rw) {
    my gsize $l = 0;
    my $rv = gimp_color_profile_get_icc_profile($!cp, $l);
    $length = $l;

    $rv ?? CArrayToArray($rv) !! Nil;
  }

  method get_label {
    gimp_color_profile_get_label($!cp);
  }

  method get_lcms_format (Int() $lcms_format) {
    my guint32 $l = $lcms_format;

    gimp_color_profile_get_lcms_format($, $l);
  }

  method get_lcms_profile {
    gimp_color_profile_get_lcms_profile($!cp);
  }

  method get_manufacturer {
    gimp_color_profile_get_manufacturer($!cp);
  }

  method get_model {
    gimp_color_profile_get_model($!cp);
  }

  method get_space (
    Int() $intent;
    CArray[Pointer[GError]] $error = gerror
  ) {
    my GimpColorRenderingIntent $i = $intent;
    clear_error;
    my $rv = gimp_color_profile_get_space($!cp, $i, $error);
    set_error($error);

    $rv;
  }

  method get_summary {
    gimp_color_profile_get_summary($!cp);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_color_profile_get_type, $n, $t );
  }

  method is_cmyk {
    so gimp_color_profile_is_cmyk($!cp);
  }

  multi method is_equal (
    GIMP::ColorProfile:D:
    GimpColorProfile() $profile2
  ) {
    GIMP::ColorProfile.is_equal($!cp, $profile2);
  }
  multi method is_equal (
    GIMP::ColorProfile:U:
    GimpColorProfile() $profile1,
    GimpColorProfile() $profile2
  ) {
    so gimp_color_profile_is_equal($profile1, $profile2);
  }

  method is_gray {
    so gimp_color_profile_is_gray($!cp);
  }

  method is_linear {
    so gimp_color_profile_is_linear($!cp);
  }

  method is_rgb {
    so gimp_color_profile_is_rgb($!cp);
  }

  method save_to_file (
    GFile() $file,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so gimp_color_profile_save_to_file($!cp, $file, $error);
    set_error($error);
    $rv;
  }

}
