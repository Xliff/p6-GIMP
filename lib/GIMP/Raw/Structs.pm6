use v6.c;

unit package GIMP::Raw::Structs;

class GimpDrawable is repr<CStruct> { ... }

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
}

class GimpHSL is repr('CStruct') is export {
	has gdouble      $.h is rw;
	has gdouble      $.s is rw;
	has gdouble      $.l is rw;
	has gdouble      $.a is rw;
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

class GimpDrawable is repr('CStruct') is export {
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

class GimpPlugInInfo is repr('CStruct') is export {
	has Pointer       $!init_proc; # Typedef<GimpInitProc>->«F:void ( )*» init_proc
	has Pointer       $!quit_proc; # Typedef<GimpQuitProc>->«F:void ( )*» quit_proc
	has Pointer       $!query_proc; # Typedef<GimpQueryProc>->«F:void ( )*» query_proc
	has Pointer       $!run_proc; # Typedef<GimpRunProc>->«F:void ( )*» run_proc
}

class GimpParamDef is repr('CStruct') is export {
	has int32         $.type         is rw;
	has Str           $!name;
	has Str           $!description;
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

class GimpParamData is repr('CUnion') is export {
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
	has GimpParamData      $!data;
}

class GimpMatrix2 is repr('CStruct') is export {
	HAS gdouble            @.coeff[4] is CArray; # Typedef<gdouble>->«double»[2][2] coeff
}

class GimpMatrix3 is repr('CStruct') is export {
	HAS gdouble            @.coeff[9] is CArray; # Typedef<gdouble>->«double»[3][3] coeff
}

class GimpMatrix4 is repr('CStruct') is export {
	HAS gdouble            @.coeff[16] is CArray; # Typedef<gdouble>->«double»[4][4] coeff
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
