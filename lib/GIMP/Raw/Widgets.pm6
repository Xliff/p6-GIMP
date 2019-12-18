use v6;

use NativeCall;

use GTK::Roles::Pointers;

unit package GIMP::Raw::Widgets;

# Number of times we've bumped
constant forced = 3;

class GimpAspectPreview         is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpBrushSelectButton     is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpDialog                is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpDrawablePreview       is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpFontSelectButton      is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpGradientSelectButton  is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpPaletteSelectButton   is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpPatternSelectButton   is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpPreview               is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpProcBrowserDialog     is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpProgressBar           is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpScrolledPreview       is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpSelectButton          is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpZoomModel             is repr<CPointer> is export does GTK::Roles::Pointers {}
class GimpZoomPreview           is repr<CPointer> is export does GTK::Roles::Pointers {}
