use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::Text;

### /usr/include/gimp-2.0/libgimp/gimptextlayer_pdb.h

sub gimp_text_layer_get_antialias (gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_base_direction (gint32 $layer_ID)
  returns GimpTextDirection
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_color (gint32 $layer_ID, GimpRGB $color)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_font (gint32 $layer_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_font_size (gint32 $layer_ID, GimpUnit $unit)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_hint_style (gint32 $layer_ID)
  returns GimpTextHintStyle
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_hinting (gint32 $layer_ID, gboolean $autohint)
  is DEPRECATED
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_indent (gint32 $layer_ID)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_justification (gint32 $layer_ID)
  returns GimpTextJustification
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_kerning (gint32 $layer_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_language (gint32 $layer_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_letter_spacing (gint32 $layer_ID)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_line_spacing (gint32 $layer_ID)
  returns gdouble
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_markup (gint32 $layer_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_get_text (gint32 $layer_ID)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_new (
  gint32 $image_ID,
  Str $text,
  Str $fontname,
  gdouble $size,
  GimpUnit $unit
)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_resize (gint32 $layer_ID, gdouble $width, gdouble $height)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_antialias (gint32 $layer_ID, gboolean $antialias)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_base_direction (
  gint32 $layer_ID,
  GimpTextDirection $direction
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_color (gint32 $layer_ID, GimpRGB $color)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_font (gint32 $layer_ID, Str $font)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_font_size (
  gint32 $layer_ID,
  gdouble $font_size,
  GimpUnit $unit
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_hint_style (gint32 $layer_ID, GimpTextHintStyle $style)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_indent (gint32 $layer_ID, gdouble $indent)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_justification (
  gint32 $layer_ID,
  GimpTextJustification $justify
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_kerning (gint32 $layer_ID, gboolean $kerning)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_language (gint32 $layer_ID, Str $language)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_letter_spacing (
  gint32 $layer_ID,
  gdouble $letter_spacing
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_line_spacing (gint32 $layer_ID, gdouble $line_spacing)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_text_layer_set_text (gint32 $layer_ID, Str $text)
  returns uint32
  is native(gimp)
  is export
{ * }
