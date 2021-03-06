use v6.c;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Libs;
use GIMP::Raw::Enums;

unit package GIMP::Raw::Structs;

# Number of times we've bumped
constant forced = 4;

class GimpDrawable is repr<CStruct> is export { ... }

class GimpRGB is repr('CStruct') is export {
	has gdouble      $.r is rw;
	has gdouble      $.g is rw;
	has gdouble      $.b is rw;
	has gdouble      $.a is rw;
}

class GimpHSV is repr('CStruct') is export {
	has gdouble      $.h is rw;
	has gdouble      $.s is rw;
	has gdouble      $.v is rw;
	has gdouble      $.a is rw;

  method clamp {
    gimp_hsv_clamp(self);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_hsv_get_type, $n, $t );
  }

  method set (
    Num() $hue,
    Num() $saturation,
    Num() $value,
    Num() $alpha = 1e0
  ) {
    my gdouble ($h, $s, $v, $a) = ($hue, $saturation, $value, $alpha);

    gimp_hsva_set(self, $h, $s, $v, $a);
  }

}

class GimpHSL is repr('CStruct') is export {
	has gdouble      $.h is rw;
	has gdouble      $.s is rw;
	has gdouble      $.l is rw;
	has gdouble      $.a is rw;

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_hsl_get_type, $n, $t );
  }

  method set (Num() $h, Num() $s, Num() $l) {
    my gdouble ($hh, $ss, $ll) = ($h, $s, $l);

    gimp_hsl_set(self, $hh, $ss, $ll);
  }

  method set_alpha (Num() $a) {
    my gdouble $aa = $a;
    gimp_hsl_set_alpha(self, $aa);
  }
}

class GimpCMYK is repr('CStruct') is export {
	has gdouble      $.c is rw;
	has gdouble      $.m is rw;
	has gdouble      $.y is rw;
	has gdouble      $.k is rw;
	has gdouble      $.a is rw;
}

class GimpTile is repr('CStruct') is export {
	has guint        $.ewidth;
	has guint        $.eheight;
	has guint        $.bpp;
	has guint        $.tile_num;
	has guint16      $.ref_count;
	has guint        $.dirty;
	has guint        $.shadow;
	has Str          $.data;
	has GimpDrawable $.drawable;
}

class GimpDrawable {
	has gint32        $.drawable_id;
	has guint         $.width;
	has guint         $.height;
	has guint         $.bpp;
	has guint         $.ntile_rows;
	has guint         $.ntile_cols;
	has GimpTile      $.tiles;
	has GimpTile      $.shadow_tiles;
}

class GimpPixelRgn is repr('CStruct') is export {
	has Str           $!data;
	has GimpDrawable  $!drawable;
	has gint          $.bpp           is rw;
	has gint          $.rowstride     is rw;
	has gint          $.x             is rw;
	has gint          $.y             is rw;
	has gint          $.w             is rw;
	has gint          $.h             is rw;
	has guint         $.dirty         is rw;
	has guint         $.shadow        is rw;
	has gint          $.process_count is rw;
}

class GimpParamRegion is repr('CStruct') is export {
	has gint32        $.x      is rw;
	has gint32        $.y      is rw;
	has gint32        $.width  is rw;
	has gint32        $.height is rw;
}

class GimpParasite is repr('CStruct') is export {
	has Str                $!name;
	has guint32            $.flags is rw;
	has guint32            $.size  is rw;
	has Pointer            $!data;
}

class GimpParamData is repr('CStruct') is export {
	has gint32             $.d_int32; # Typedef<gint32>->«int» d_int32
	has gint16             $.d_int16; # Typedef<gint16>->«short int» d_int16
	has guint8             $.d_int8; # Typedef<guint8>->«unsigned char» d_int8
	has gdouble            $.d_float; # Typedef<gdouble>->«double» d_float
	has Str                $!d_string; # Typedef<gchar>->«char»* d_string
	has CArray[gint32]     $!d_int32array; # Typedef<gint32>->«int»* d_int32array
	has CArray[gint16]     $!d_int16array; # Typedef<gint16>->«short int»* d_int16array
	has CArray[guint8]     $!d_int8array; # Typedef<guint8>->«unsigned char»* d_int8array
	has CArray[gdouble]    $!d_floatarray; # Typedef<gdouble>->«double»* d_floatarray
	has CArray[Str]        $!d_stringarray; # Typedef<gchar>->«char»** d_stringarray
	has GimpRGB            $!d_colorarray; # Typedef<GimpRGB>->«_GimpRGB»* d_colorarray
	has GimpRGB            $!d_color; # Typedef<GimpRGB>->«_GimpRGB» d_color
	has GimpParamRegion    $!d_region; # Typedef<GimpParamRegion>->«_GimpParamRegion» d_region
	has gint32             $.d_display; # Typedef<gint32>->«int» d_display
	has gint32             $.d_image; # Typedef<gint32>->«int» d_image
	has gint32             $.d_item; # Typedef<gint32>->«int» d_item
	has gint32             $.d_layer; # Typedef<gint32>->«int» d_layer
	has gint32             $.d_layer_mask; # Typedef<gint32>->«int» d_layer_mask
	has gint32             $.d_channel; # Typedef<gint32>->«int» d_channel
	has gint32             $.d_drawable; # Typedef<gint32>->«int» d_drawable
	has gint32             $.d_selection; # Typedef<gint32>->«int» d_selection
	has gint32             $.d_boundary; # Typedef<gint32>->«int» d_boundary
	has gint32             $.d_path; # Typedef<gint32>->«int» d_path
	has gint32             $.d_vectors; # Typedef<gint32>->«int» d_vectors
	has gint32             $.d_unit; # Typedef<gint32>->«int» d_unit
	has GimpParasite       $!d_parasite; # Typedef<GimpParasite>->«_GimpParasite» d_parasite
	has gint32             $.d_tattoo; # Typedef<gint32>->«int» d_tattoo
	has int32              $.d_status; # Typedef<GimpPDBStatusType>->«GimpPDBStatusType» d_status
}

class GimpParam is repr('CStruct') is export {
	has int32              $.type is rw;
	HAS GimpParamData      $.data;
}

sub sprintf-SIPIrwP (
  Blob,
  Str,
  & (Str, gint, Pointer, gint is rw, Pointer),
  gpointer
 --> int64
)
    is native is symbol('sprintf') { * }

class GimpPluginInfo is repr('CStruct') is export {
	has Pointer       $!init;  # Typedef<GimpInitProc>->«F:void ( )*» init_proc
	has Pointer       $!quit;  # Typedef<GimpQuitProc>->«F:void ( )*» quit_proc
	has Pointer       $!query; # Typedef<GimpQueryProc>->«F:void ( )*» query_proc
	has Pointer       $!run;   # Typedef<GimpRunProc>->«F:void ( )*» run_proc

  submethod TWEAK {
    $!init  = Pointer unless $!init;
    $!quit  = Pointer unless $!quit;
    $!query = Pointer unless $!query;
    $!run   = Pointer unless $!run;
  }

  method init is rw {
    Proxy.new:
      FETCH => -> $ { $!init },
      STORE => -> $, \func {
        $!init := set_func_pointer( &(func), &sprintf-v);
      };
  }

  method quit is rw {
    Proxy.new:
      FETCH => -> $ { $!quit },
      STORE => -> $, \func {
        $!quit := set_func_pointer( &(func), &sprintf-v);
      };
  }

  method query is rw {
    Proxy.new:
      FETCH => -> $ { $!query },
      STORE => -> $, \func {
        $!query := set_func_pointer( &(func), &sprintf-v);
      };
  }

  method run is rw {
    Proxy.new:
      FETCH => -> $ { $!run },
      STORE => -> $, \func {
        $!run := set_func_pointer( &(func), &sprintf-SIPIrwP);
      };
  }
}

class GimpParamDef is repr('CStruct') is export {
	has int32         $.type         is rw;
	has Str           $!name;
	has Str           $!description;

  submethod BUILD (:$!type, :$name, :$description) {
    self.name        = $name;
    self.description = $description;
  }

  multi method new ($type, $name, $description) {
    self.bless(:$type, :$name, :$description);
  }

  method name is rw {
    Proxy.new:
      FETCH => -> $                { $!name },
      STORE => -> $, Str() $val    { self.^attributes(:local)[1]
                                         .set_value(self, $val)    };
  }

  method description is rw {
    Proxy.new:
      FETCH => -> $                { $!description },
      STORE => -> $, Str() $val    { self.^attributes(:local)[2]
                                         .set_value(self, $val)    };
  }
}

class GimpMatrix2 is repr('CStruct') is export {
	#HAS gdouble            @.coeff[4] is CArray; # Typedef<gdouble>->«double»[2][2] coeff
  has gdouble $.c0 is rw;
  has gdouble $.c1 is rw;
  has gdouble $.c2 is rw;
  has gdouble $.c3 is rw;
}

class GimpMatrix3 is repr('CStruct') is export {
	#HAS gdouble            @.coeff[9] is CArray; # Typedef<gdouble>->«double»[3][3] coeff
  has gdouble $.c0 is rw;
  has gdouble $.c1 is rw;
  has gdouble $.c2 is rw;
  has gdouble $.c3 is rw;
  has gdouble $.c4 is rw;
  has gdouble $.c5 is rw;
  has gdouble $.c6 is rw;
  has gdouble $.c7 is rw;
  has gdouble $.c8 is rw;
}

class GimpMatrix4 is repr('CStruct') is export {
	#HAS gdouble            @.coeff[16] is CArray; # Typedef<gdouble>->«double»[4][4] coeff
  has gdouble $.c0 is rw;
  has gdouble $.c1 is rw;
  has gdouble $.c2 is rw;
  has gdouble $.c3 is rw;
  has gdouble $.c4 is rw;
  has gdouble $.c5 is rw;
  has gdouble $.c6 is rw;
  has gdouble $.c7 is rw;
  has gdouble $.c8 is rw;
  has gdouble $.c9 is rw;
  has gdouble $.ca is rw;
  has gdouble $.cb is rw;
  has gdouble $.cc is rw;
  has gdouble $.cd is rw;
  has gdouble $.ce is rw;
  has gdouble $.cf is rw;

  method identity {
    ($.c0, $.c5, $.ca, $.cf) = 1e0 xx 4;
  }
}

class GimpVector2 is repr('CStruct') is export {
	has gdouble            $.x is rw;
	has gdouble            $.y is rw;
}

class GimpVector3 is repr('CStruct') is export {
	has gdouble            $.x is rw;
	has gdouble            $.y is rw;
	has gdouble            $.z is rw;
}

class GimpVector4 is repr('CStruct') is export {
	has gdouble            $.x is rw;
	has gdouble            $.y is rw;
	has gdouble            $.z is rw;
	has gdouble            $.w is rw;
}

class GimpDatafileData is repr('CStruct') is export {
	has Str                $!filename;
	has Str                $!dirname;
	has Str                $!basename;
	has int64              $.atime    is rw; # Typedef<time_t>->«Typedef<__time_t>->«long int»» atime
	has int64              $.mtime    is rw; # Typedef<time_t>->«Typedef<__time_t>->«long int»» mtime
	has int64              $.ctime    is rw; # Typedef<time_t>->«Typedef<__time_t>->«long int»» ctime
}

constant GIMP_PIXPIPE_MAXDIM is export = 4;
class GimpPixPipeParams is repr('CStruct') is export {
  has gint      $.step                           is rw;
  has gint      $.ncells                         is rw;
  has gint      $.dim                            is rw;
  has gint      $.cols                           is rw;
  has gint      $.rows                           is rw;
  has gint      $.cellwidth                      is rw;
  has gint      $.cellheight                     is rw;
  has Str       $.placement                      is rw;
  has gboolean  $.free_placement_string          is rw;
  # HAS gint      @.rank[GIMP_PIXPIPE_MAXDIM]      is CArray;
  # HAS Str       @!selection[GIMP_PIXPIPE_MAXDIM] is CArray;
  has gint      $.rank0                          is rw;
  has gint      $.rank1                          is rw;
  has gint      $.rank2                          is rw;
  has gint      $.rank3                          is rw;
  has Str       $!selection0;
  has Str       $!selection1;
  has Str       $!selection2;
  has Str       $!selection3;
  # this flag is now useless. All selection strings are allocated.
  has gboolean  $.free_selection_string          is rw;
}

class GimpProgressVtable is repr<CStruct> is export {
  has Pointer $!start;      # void    (* start)        (const gchar *message,
                            #                           gboolean     cancelable,
                            #                           gpointer     user_data);
  has Pointer $!end;        # void    (* end)          (gpointer     user_data);
  has Pointer $!set_text;   # void    (* set_text)     (const gchar *message,
                            #                           gpointer     user_data);
  has Pointer $!set_value;  # void    (* set_value)    (gdouble      percentage,
                            #                           gpointer     user_data);
  has Pointer $!pulse;      # void    (* pulse)        (gpointer     user_data);

  has Pointer $!get_window; # guint32 (* get_window)   (gpointer     user_data);

  method start is rw {
    Proxy.new:
      FETCH => -> $ { $!start },
      STORE => -> $, \func {
        $!start := set_func_pointer( &(func), &sprintf-SBP);
      };
  }

  method end is rw {
    Proxy.new:
      FETCH => -> $ { $!set_text },
      STORE => -> $, \func {
        $!set_text := set_func_pointer( &(func), &sprintf-P);
      };
  }

  method set_text is rw {
    Proxy.new:
      FETCH => -> $ { $!set_text },
      STORE => -> $, \func {
        $!set_text := set_func_pointer( &(func), &sprintf-SP);
      };
  }

  method set_value is rw {
    Proxy.new:
      FETCH => -> $ { $!set_value },
      STORE => -> $, \func {
        $!set_value := set_func_pointer( &(func), &sprintf-DP);
      };
  }

  method pulse is rw {
    Proxy.new:
      FETCH => -> $ { $!pulse },
      STORE => -> $, \func {
        $!pulse := set_func_pointer( &(func), &sprintf-P);
      };
  }

  method get_window is rw {
    Proxy.new:
      FETCH => -> $ { $!get_window },
      STORE => -> $, \func {
        $!get_window := set_func_pointer( &(func), &sprintf-P);
      };
  }

  # Padding for future expansion. Must be initialized with NULL! */
  has Pointer $!gimp_reserved1;
  has Pointer $!gimp_reserved2;
  has Pointer $!gimp_reserved3;
  has Pointer $!gimp_reserved4;
  has Pointer $!gimp_reserved5;
  has Pointer $!gimp_reserved6;
  has Pointer $!gimp_reserved7;
  has Pointer $!gimp_reserved8;
}

role Delegatable is export { };

class GimpColorConfig32 is repr<CStruct> {
  has GObject                    $!parent_instance;

  # Public
  has GimpColorManagementMode    $.mode                                    does Delegatable is rw;
  has Str                        $!rgb_profile                             does Delegatable;
  has Str                        $!cmyk_profile                            does Delegatable;
  has Str                        $!display_profile                         does Delegatable;
  has gboolean                   $.display_profile_from_gdk                does Delegatable is rw;
  has Str                        $!printer_profile                         does Delegatable;
  has GimpColorRenderingIntent   $.display_intent                          does Delegatable is rw;
  has GimpColorRenderingIntent   $.simulation_intent                       does Delegatable is rw;
  has Str                        $!display_module                          does Delegatable;
  has gboolean                   $.simulation_gamut_check                  does Delegatable is rw;
  has GimpRGB                    $!out_of_gamut_color                      does Delegatable;
  has gboolean                   $.display_use_black_point_compensation    does Delegatable is rw;
  has gboolean                   $.simulation_use_black_point_compensation does Delegatable is rw;
  has Str                        $.gray_profile                            does Delegatable;

  # Private
  has Pointer                    $!gimp_reserved4;
  has Pointer                    $!gimp_reserved5;
  has Pointer                    $!gimp_reserved6;
  has Pointer                    $!gimp_reserved7;
  has Pointer                    $!gimp_reserved8;

  method rgb_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[2].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[2].set_value(self, val) };
  }

  method cmyk_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[3].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[3].set_value(self, val) };
  }

  method display_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[4].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[4].set_value(self, val) };
  }

  method printer_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[6].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[6].set_value(self, val) };
  }


  method simulation_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[9].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[9].set_value(self, val) };
  }

  method out_of_gamut_color is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[11].get_value(self) },
      STORE => -> $, GimpRGB \val { self.^attributes[11].set_value(self, val) };
  }

  method gray_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[14].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[14].set_value(self, val) };
  }

}

class GimpColorConfig64 is repr<CStruct> {
  has GObject                    $!parent_instance;

  # Public
  has GimpColorManagementMode    $.mode                                    does Delegatable is rw;
  has Str                        $!rgb_profile                             does Delegatable;
  has Str                        $!cmyk_profile                            does Delegatable;
  has Str                        $!display_profile                         does Delegatable;
  has gboolean                   $.display_profile_from_gdk                does Delegatable is rw;
  has Str                        $!printer_profile                         does Delegatable;
  has GimpColorRenderingIntent   $.display_intent                          does Delegatable is rw;
  has GimpColorRenderingIntent   $.simulation_intent                       does Delegatable is rw;
  has Str                        $!display_module                          does Delegatable;
  has gboolean                   $.simulation_gamut_check                  does Delegatable is rw;
  has GimpRGB                    $!out_of_gamut_color                      does Delegatable;
  has gboolean                   $.display_use_black_point_compensation    does Delegatable is rw;
  has gboolean                   $.simulation_use_black_point_compensation does Delegatable is rw;
  has Str                        $.gray_profile                            does Delegatable;

  # Private
  has Pointer                    $!gimp_reserved3;
  has Pointer                    $!gimp_reserved4;
  has Pointer                    $!gimp_reserved5;
  has Pointer                    $!gimp_reserved6;
  has Pointer                    $!gimp_reserved7;
  has Pointer                    $!gimp_reserved8;

  method rgb_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[2].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[2].set_value(self, val) };
  }

  method cmyk_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[3].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[3].set_value(self, val) };
  }

  method display_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[4].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[4].set_value(self, val) };
  }

  method printer_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[6].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[6].set_value(self, val) };
  }


  method simulation_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[9].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[9].set_value(self, val) };
  }

  method out_of_gamut_color is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[11].get_value(self) },
      STORE => -> $, GimpRGB \val { self.^attributes[11].set_value(self, val) };
  }

  method gray_profile is rw {
    Proxy.new:
      FETCH => -> $               { self.^attributes[14].get_value(self) },
      STORE => -> $, Str() \val   { self.^attributes[14].set_value(self, val) };
  }

}

constant GimpColorConfig is export = $?BITS == 32 ??
    GimpColorConfig32 !! GimpColorConfig64;

### /usr/include/gimp-2.0/libgimpcolor/gimphsl.h

sub gimp_hsl_get_type ()
  returns GType
  is native(gimpcolor)
  is export
{ * }

sub gimp_hsl_set (GimpHSL $hsl, gdouble $h, gdouble $s, gdouble $l)
  is native(gimpcolor)
  is export
{ * }

sub gimp_hsl_set_alpha (GimpHSL $hsl, gdouble $a)
  is native(gimpcolor)
  is export
{ * }

### /usr/include/gimp-2.0/libgimpcolor/gimphsv.h

sub gimp_hsv_clamp (GimpHSV $hsv)
  is native(gimpcolor)
  is export
{ * }

sub gimp_hsv_get_type ()
  returns GType
  is native(gimpcolor)
  is export
{ * }

# Not currently used, but included for completeness.
sub gimp_hsv_set (
  GimpHSV $hsv,
  gdouble $hue,
  gdouble $saturation,
  gdouble $value
)
  is native(gimpcolor)
  is export
{ * }

sub gimp_hsva_set (
  GimpHSV $hsva,
  gdouble $hue,
  gdouble $saturation,
  gdouble $value,
  gdouble $alpha
)
  is native(gimpcolor)
  is export
{ * }
