use v6;

use NativeCall;

use GTK::Compat::Types;
use GIMP::Raw::Enums;
use GIMP::Raw::Structs;
use GIMP::Raw::Libs;

use GTK::Roles::Pointers;

package GIMP::Raw::Types {
  constant Babl      is export := Pointer;

  class GimpValueArray   is repr<CPointer> does GTK::Roles::Pointers is export {}
  class GimpColorProfile is repr<CPointer> does GTK::Roles::Pointers is export {}
}

sub EXPORT {
  %(
    GTK::Compat::Types::EXPORT::DEFAULT::,
    GIMP::Raw::Libs::EXPORT::DEFAULT::,
    GIMP::Raw::Enums::EXPORT::DEFAULT::,
    GIMP::Raw::Structs::EXPORT::DEFAULT::,
    GIMP::Raw::Types::EXPORT::DEFAULT::
  )
}
