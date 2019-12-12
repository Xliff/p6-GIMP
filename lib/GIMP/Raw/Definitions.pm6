use v6;

use NativeCall;

use GTK::Roles::Pointers;

unit package GIMP::Raw::Definitions;

constant Babl      is export := Pointer;

class GimpValueArray   is repr<CPointer> does GTK::Roles::Pointers is export {}
class GimpColorProfile is repr<CPointer> does GTK::Roles::Pointers is export {}

constant GIMP_RGB_INTENSITY_RED   is export = 0.30;
constant GIMP_RGB_INTENSITY_GREEN is export = 0.59;
constant GIMP_RGB_INTENSITY_BLUE  is export = 0.11;

sub GIMP_RGB_INTENSITY ($r, $g, $b) is export {
  $r * GIMP_RGB_INTENSITY_RED   +
  $g * GIMP_RGB_INTENSITY_GREEN +
  $b * GIMP_RGB_INTENSITY_BLUE
}
