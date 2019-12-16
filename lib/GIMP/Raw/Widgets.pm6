use v6;

use NativeCall;

use GTK::Roles::Pointers;

unit package GIMP::Raw::Widgets;

class GimpPreview      is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpProgressBar  is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpSelectButton is repr<CPointer> is export does GTK::Roles::Pointers {}
