use v6;

use NativeCall;

use GLib::Roles::Pointers;

unit package GIMP::Compat::Deprecated;

# Number of times we've bumped
constant forced = 0;

class GtkTable          is repr<CPointer> is export does GLib::Roles::Pointers {}
