use v6;

use GIMP::Raw::Types;
use GIMP::PDB::Raw::Text;

use GLib::Roles::StaticClass;
use GIMP::PDB::Roles::Assumable;

class GIMP::PDB::Text {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method antialias is rw {
    Proxy.new:
      FETCH => -> $          { self.get_antialias },
      STORE => -> Int() \a   { self.set_antialias(a) };
  }

  method base_direction is rw {
    Proxy.new:
      FETCH => -> $          { self.get_base_direction },
      STORE => -> Int() \d   { self.set_base_direction(d) };
  }

  method color is rw {
    Proxy.new:
      FETCH => -> $          { self.get_color },
      STORE => -> GimpRGB \c { self.set_color(c) };
  }

  method font is rw {
    Proxy.new:
      FETCH => -> $          { self.get_font },
      STORE => -> Str() \f   { self.set_font(f) };
  }

  method font_size is rw {
    Proxy.new:
      FETCH => -> $          { self.get_font_size },
      STORE => -> Num() \s   { self.set_font_size(s) };
  }

  method hint_style is rw {
    Proxy.new:
      FETCH => -> $          { self.get_hint_style },
      STORE => -> Int() \h   { self.set_hint_style(h) };
  }

  method indent is rw {
    Proxy.new:
      FETCH => -> $          { self.get_indent },
      STORE => -> Num() \i   { self.set_indent(i) };
  }

  method justification is rw {
    Proxy.new:
      FETCH => -> $          { self.get_justification },
      STORE => -> Int() \j   { self.set_justification(j) };
  }

  method kerning is rw {
    Proxy.new:
      FETCH => -> $          { self.get_kerning },
      STORE => -> Int() \k   { self.set_kerning(k) };
  }

  method language is rw {
    Proxy.new:
      FETCH => -> $          { self.get_language },
      STORE => -> Str() \l   { self.set_language(l) };
  }

  method letter_spacing is rw {
    Proxy.new:
      FETCH => -> $          { self.get_letter_spacing },
      STORE => -> Int() \s   { self.set_letter_spacing(s) };
  }

  method line_spacing is rw {
    Proxy.new:
      FETCH => -> $          { self.get_line_spacing },
      STORE => -> Int() \s   { self.set_line_spacing(s) };
  }

  method markup is rw {
    Proxy.new:
      FETCH => -> $          { self.get_markup },
      STORE => -> Str() \ma  { self.set_markup(ma) };
  }

  method text is rw {
    Proxy.new:
      FETCH => -> $          { self.get_text },
      STORE => -> Str() \t   { self.set_text(t) };
  }

  method new_text (
    Int() $image_ID,
    Str() $text,
    Str() $fontname,
    Int() $size,
    Int() $unit
  ) {
    my gint32 $i = $image_ID;
    my gdouble $s = $size;
    my GimpUnit $u = $unit;

    gimp_text_layer_new($i, $text, $fontname, $s, $u);
  }

  method get_antialias (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_antialias($layer_ID);
  }

  method get_base_direction (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_base_direction($layer_ID);
  }

  method get_color (Int() $layer_ID, GimpRGB $color) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_color($l, $color);
  }

  method get_font (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_font($layer_ID);
  }

  method get_font_size (Int() $layer_ID, Int() $unit) {
    my gint32 $l = $layer_ID;
    my GimpUnit $u = $unit;

    gimp_text_layer_get_font_size($l, $u);
  }

  method get_hint_style (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_hint_style($layer_ID);
  }

  method get_indent (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_indent($layer_ID);
  }

  method get_justification (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_justification($layer_ID);
  }

  method get_kerning (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_kerning($layer_ID);
  }

  method get_language (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_language($layer_ID);
  }

  method get_letter_spacing (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_letter_spacing($layer_ID);
  }

  method get_line_spacing (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_line_spacing($layer_ID);
  }

  method get_markup (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_markup($layer_ID);
  }

  method get_text (Int() $layer_ID) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_get_text($layer_ID);
  }

  method resize (Int() $layer_ID, Num() $width, Num() $height) {
    my gint32 $l = $layer_ID;
    my gdouble ($w, $h) = ($width, $height);

    gimp_text_layer_resize($l, $w, $h);
  }

  method set_antialias (Int() $layer_ID, Int() $antialias) {
    my gint32 $l = $layer_ID;
    my gboolean $a = (so $antialias).Int;

    gimp_text_layer_set_antialias($l, $a);
  }

  method set_base_direction (Int() $layer_ID, Int() $direction) {
    my gint32 $l = $layer_ID;
    my GimpTextDirection $d = $direction;

    gimp_text_layer_set_base_direction($l, $direction);
  }

  method set_color (Int() $layer_ID, GimpRGB $color) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_set_color($l, $color);
  }

  method set_font (Int() $layer_ID, Str() $font) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_set_font($l, $font);
  }

  method set_font_size (Int() $layer_ID, Num() $font_size, Int() $unit) {
    my gint32 $l = $layer_ID;
    my gdouble $f = $font_size;
    my GimpUnit $u = $unit;

    gimp_text_layer_set_font_size($l, $f, $u);
  }

  method set_hint_style (Int() $layer_ID, Int() $style) {
    my gint32 $l = $layer_ID;
    my GimpTextHintStyle $s = $style;

    gimp_text_layer_set_hint_style($l, $s);
  }

  method set_indent (Int() $layer_ID, Num() $indent) {
    my gint32 $l = $layer_ID;
    my gdouble $i = $indent;

    gimp_text_layer_set_indent($l, $i);
  }

  method set_justification (Int() $layer_ID, Int() $justify) {
    my gint32 $l = $layer_ID;
    my GimpTextJustification $j = $justify;

    gimp_text_layer_set_justification($l, $j);
  }

  method set_kerning (Int() $layer_ID, Int() $kerning) {
    my gint32 $l = $layer_ID;
    my gboolean $k = (so $kerning).Int;

    gimp_text_layer_set_kerning($l, $k);
  }

  method set_language (Int() $layer_ID, Str() $language) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_set_language($l, $language);
  }

  method set_letter_spacing (Int() $layer_ID, Num() $letter_spacing) {
    my gint32 $l = $layer_ID;
    my gdouble $s = $letter_spacing;

    gimp_text_layer_set_letter_spacing($l, $s);
  }

  method set_line_spacing (Int() $layer_ID, Num() $line_spacing) {
    my gint32 $l = $layer_ID;
    my gdouble $s = $line_spacing;

    gimp_text_layer_set_line_spacing($l, $s);
  }

  method set_text (Int() $layer_ID, Str() $text) {
    my gint32 $l = $layer_ID;

    gimp_text_layer_set_text($l, $text);
  }

}

constant Text is export := GIMP::PDB::Text;
