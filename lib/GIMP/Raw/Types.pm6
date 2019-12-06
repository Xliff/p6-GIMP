use v6;

use GTK::Compat::Types;
use GIMP::Raw::Enums;
use GIMP::Raw::Structs;

package GIMP::Raw::Types {
  constant gimp     is export = 'gimp-2.0',v0;
  constant gimpbase is export = 'gimpbase-2.0',v0;

  class GimpValueArray is repr<CPointer> does GTK::Roles::Pointers is export {}
}

sub EXPORT {
  %(
    GTK::Compat::Types::EXPORT::DEFAULT::,
    GIMP::Raw::Enums::EXPORT::DEFAULT::,
    GIMP::Raw::Structs::EXPORT::DEFAULT::,
    GIMP::Raw::Types::EXPORT::DEFAULT::
  )
}
