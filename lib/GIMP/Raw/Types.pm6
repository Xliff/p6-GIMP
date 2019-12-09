use v6;

use NativeCall;

use GTK::Compat::Types;
use GIMP::Raw::Enums;
use GIMP::Raw::Structs;

use GTK::Roles::Pointers;

package GIMP::Raw::Types {
  constant gimp      is export = 'gimp-2.0',v0;
  constant gimpbase  is export = 'gimpbase-2.0',v0;
  constant gimpcolor is export = 'gimpcolor-2.0',v0;

  constant Babl      is export := Pointer;

  class GimpValueArray   is repr<CPointer> does GTK::Roles::Pointers is export {}
  class GimpColorProfile is repr<CPointer> does GTK::Roles::Pointers is export {}
}

sub EXPORT {
  %(
    GTK::Compat::Types::EXPORT::DEFAULT::,
    GIMP::Raw::Enums::EXPORT::DEFAULT::,
    GIMP::Raw::Structs::EXPORT::DEFAULT::,
    GIMP::Raw::Types::EXPORT::DEFAULT::
  )
}
