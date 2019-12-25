use v6;

use Method::Also;
use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GLib::Value;

use GIMP::Widget::SelectButton;

use GIMP::Widget::Roles::Signals::BrushSelectButton;

our subset GimpBrushSelectButtonAncestry is export of Mu
  where GimpBrushSelectButton | GimpSelectButtonAncestry;

class GIMP::Widget::BrushSelectButton is GIMP::Widget::SelectButton {
  also does GIMP::Widget::Roles::Signals::BrushSelectButton;

  has GimpBrushSelectButton $!gbsb;

  submethod BUILD (:$brush-select) {
    given $brush-select {
      when GimpBrushSelectButtonAncestry {
        self.setGimpBrushSelectButton($brush-select);
      }

      when GIMP::Widget::BrushSelectButton {
      }

      default {
      }
    }
  }

  method setGimpBrushSelectButton (GimpBrushSelectButtonAncestry $_) {
    my $to-parent;

    $!gbsb = do {
      when GimpBrushSelectButton {
        $to-parent = cast(GimpSelectButton, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpBrushSelectButton, $_);
      }
    };
    self.setBox($to-parent);
  }

  method GIMP::Raw::Widgets::GimpBrushSelectButton
    is also<GimpBrushSelectButton>
  { $!gbsb }

  proto method new (|)
  { * }

  multi method new (GimpBrushSelectButtonAncestry $brush-select) {
    return Nil unless $brush-select;

    self.bless( :$brush-select );
  }
  multi method new (
    Str() $title,
    Str() $brush_name,
    Num() $opacity,
    Int() $spacing,
    Int() $paint_mode
  ) {
    my gdouble $o = $opacity;
    my gint $s = $spacing;
    my GimpLayerMode $p = $paint_mode;
    my $brush-select =
      gimp_brush_select_button_new($title, $brush_name, $o, $s, $p);

    $brush-select ?? self.bless( :$brush-select ) !! Nil;
  }


  # Type: gchar
  method brush-name is rw  {
    my GLib::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('brush-name', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('brush-name', $gv);
      }
    );
  }

  # Type: gdouble
  method brush-opacity is rw  {
    my GLib::Value $gv .= new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('brush-opacity', $gv)
        );
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('brush-opacity', $gv);
      }
    );
  }

  # Type: gint
  method brush-paint-mode is rw  {
    my GLib::Value $gv .= new( G_TYPE_INT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('brush-paint-mode', $gv)
        );
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('brush-paint-mode', $gv);
      }
    );
  }

  # Type: gint
  method brush-spacing is rw  {
    my GLib::Value $gv .= new( G_TYPE_INT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('brush-spacing', $gv)
        );
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('brush-spacing', $gv);
      }
    );
  }

  # Type: gchar
  method title is rw  {
    my GLib::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('title', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn "{ self.^name }.title can only be set at creation time."
          if $DEBUG;
      }
    );
  }

  method brush is rw {
    Proxy.new:
      FETCH => -> $,                   { self.get_brush },
      STORE => -> $, @b where +@b == 4 { self.set_brush(|@b) };
  }

  # Is originally:
  # GimpBrushSelectButton, gchar, gdouble, gint, gint, gint, gint, gpointer, gboolean, gpointer --> void
  method brush-set {
    self.connect-brush-set($!gbsb);
  }

  proto method get_brush (|)
  { * }

  multi method get_brush (:$all = True) {
    samewith($, $, $, :$all);
  }
  multi method get_brush (
    $opacity is rw,
    $spacing is rw,
    $paint_mode is rw,
    :$all = False
  ) {
    my gdouble $o = 0e0;
    my gint $s = 0;
    my GimpLayerMode $p = 0;
    my $rv = gimp_brush_select_button_get_brush($!gbsb, $o, $s, $p);
    ($opacity, $spacing, $paint_mode) = ($o, $s, $p);

    $all.not ?? $rv !! ($rv, $opacity, $spacing, $paint_mode);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_brush_select_button_get_type, $n, $t );
  }

  method set_brush (
    Str() $brush_name,
    Num() $opacity,
    Int() $spacing,
    Int() $paint_mode
  ) {
    my gdouble $o = $opacity;
    my gint $s = $spacing;
    my GimpLayerMode $p = $paint_mode;

    gimp_brush_select_button_set_brush($!gbsb, $brush_name, $o, $s, $p);
  }

}

### /usr/include/gimp-2.0/libgimp/gimpbrushselectbutton.h

sub gimp_brush_select_button_get_brush (
  GimpBrushSelectButton $button,
  gdouble $opacity is rw,
  gint $spacing is rw,
  GimpLayerMode $paint_mode
)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_brush_select_button_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }

sub gimp_brush_select_button_new (
  Str $title,
  Str $brush_name,
  gdouble $opacity,
  gint $spacing,
  GimpLayerMode $paint_mode
)
  returns GimpBrushSelectButton
  is native(gimp)
  is export
{ * }

sub gimp_brush_select_button_set_brush (
  GimpBrushSelectButton $button,
  Str $brush_name,
  gdouble $opacity,
  gint $spacing,
  GimpLayerMode $paint_mode
)
  is native(gimp)
  is export
{ * }
