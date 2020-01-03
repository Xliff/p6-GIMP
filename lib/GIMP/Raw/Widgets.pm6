use v6;

use NativeCall;

use GLib::Roles::Pointers;

unit package GIMP::Raw::Widgets;

# Number of times we've bumped
constant forced = 3;

class GimpAspectPreview         is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpBrowser               is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpBrushSelectButton     is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpBusyBox               is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpButton                is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpCellRendererColor     is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpCellRendererToggle    is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpChainButton           is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpColorArea             is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpColorSelector         is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpColorSelection        is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpDialog                is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpDrawablePreview       is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpFontSelectButton      is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpGradientSelectButton  is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpPaletteSelectButton   is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpPatternSelectButton   is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpPreview               is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpProcBrowserDialog     is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpProgressBar           is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpScrolledPreview       is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpSelectButton          is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpZoomModel             is repr<CPointer> is export does GLib::Roles::Pointers {}
class GimpZoomPreview           is repr<CPointer> is export does GLib::Roles::Pointers {}
