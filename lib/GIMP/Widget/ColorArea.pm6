use v6;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GIMP::Widget::Raw::ColorArea;

use GLib::Value;
use GTK::DrawingArea;

use GTK::Roles::Signals::Generic;

our subset GimpColorAreaAncestry is export of Mu
  where GimpColorArea | GtkDrawingArea;

class GIMP::Widget::ColorArea is GTK::DrawingArea {
  also does GTK::Roles::Signals::Generic;

  has GimpColorArea $!gca;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType($o.^name);
    $o;
  }

  submethod BUILD(:$color-area) {
    given $color-area {
      when GimpColorAreaAncestry   { self.setGimpColorArea($_) }
      when GIMP::Widget::ColorArea { }
      default                      { }
    }
  }

  method setGimpColorArea (GimpColorAreaAncestry $_) {
    my $to-parent;
    $!gca = do {
      when GimpColorArea {
        $to-parent = cast(GtkDrawingArea, $_);
        $_;
      }
      default {
        $to-parent = $_;
        cast(GimpColorArea, $_);
      }
    }
    self.setDrawingArea($to-parent);
  }

  multi method new (GimpColorAreaAncestry $color-area) {
    return unless $color-area;

    my $o = self.bless( :$color-area );
    $o.upref;
    $o;
  }
  multi method new (
    GimpRGB $color,
    Int() $type,
    Int() $drag_mask
  ) {
    my GimpColorAreaType $t = $type;
    my guint32 $d = $drag_mask; # GdkModifierType $drag_mask
    my $color-area = gimp_color_area_new($color, $t, $d);

    $color-area ?? self.bless( :$color-area ) !! Nil;
  }

  # Type: GimpRGB
  method color is rw  {
    Proxy.new:
      FETCH => -> $             { self.get_color },
      STORE => -> $, GimpRGB \c { self.set_color(c) };
  }

  # Type: gboolean
  method draw-border is rw  {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('draw-border', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val.so.Int;
        self.prop_set('draw-border', $gv);
      }
    );
  }

  # Type: GimpColorAreaType
  method type is rw  {
    my GLib::Value $gv .= new( G_TYPE_UINT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('type', $gv)
        );
        GimpColorAreaTypeEnum( $gv.uint );
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('type', $gv);
      }
    );
  }

  # Is originally:
  # GimpColorArea, gpointer --> void
  method color-changed {
    self.connect($!gca, 'color-changed');
  }

  method get_color (GimpRGB $color) {
    gimp_color_area_get_color($!gca, $color);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_color_area_get_type, $n, $t );
  }

  method has_alpha {
    so gimp_color_area_has_alpha($!gca);
  }

  method set_color (GimpRGB $color) {
    gimp_color_area_set_color($!gca, $color);
  }

  method set_color_config (GimpColorConfig() $config) {
    gimp_color_area_set_color_config($!gca, $config);
  }

  method set_draw_border (Int() $draw_border) {
    my gboolean $d = $draw_border.so.Int;

    gimp_color_area_set_draw_border($!gca, $d);
  }

  method set_type (Int() $type) {
    my GimpColorAreaType $t = $type;

    gimp_color_area_set_type($!gca, $t);
  }

}
