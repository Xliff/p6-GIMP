use v6;

use NativeCall;

use GTK::Compat::RGBA;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GTK::CellRenderer;

our subset GimpCellRendererColorAncestry is export of Mu
  where GimpCellRendererColor | GtkCellRenderer;

class GIMP::Widget::CellRendererColor is GTK::CellRenderer {
  has GimpCellRendererColor $!gcrc;

  submethod BUILD (:$color-cell) {
    given $color-cell {
      when GimpCellRendererColorAncestry {
        self.setGimpCellRendererColor($color-cell);
      }

      when GIMP::Widget::CellRendererColor { }
      default                              { }
    }
  }

  method setGimpCellRendererColor (GimpCellRendererColorAncestry $_) {
    my $to-parent;
    $!gcrc = do {
      when GimpCellRendererColor {
        $to-parent = cast(GtkCellRenderer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpCellRendererColor, $_);
      }
    }
    self.setCellRenderer($to-parent);
  }

  method GIMP::Raw::Widget::GimpCellRendererColor
  { $!gcrc }

  multi method new(GimpCellRendererColorAncestry $color-cell) {
    return Nil unless $color-cell;

    my $o = self.bless( :$color-cell );
    $o.upref;
    $o;
  }
  multi method new {
    my $color-cell = gimp_cell_renderer_color_new();

    $color-cell ?? self.bless( :$color-cell ) !! Nil;
  }

  # Type: GimpRGB
  method color is rw  {
    my GTK::Compat::Value $gv .= new( GTK::Compat::RGBA.get_type );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('color', $gv)
        );
        cast(GimpRGB, $gv.boxed);
      },
      STORE => -> $, GimpRGB $val is copy {
        $gv.boxed = $val;
        self.prop_set('color', $gv);
      }
    );
  }

  # Type: gint
  method icon-size is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_INT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('icon-size', $gv)
        );
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        warn "{ self.^name }.icon-size can only be set at construction time."
          if $DEBUG;
      }
    );
  }

  # Type: gboolean
  method opaque is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('opaque', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn "{ self.^name }.opaque can only be set at construction time."
          if $DEBUG;
      }
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &gimp_cell_renderer_color_get_type,
      $n,
      $t
    );
  }

}


### /usr/include/gimp-2.0/libgimpwidgets/gimpcellrenderercolor.h

sub gimp_cell_renderer_color_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_cell_renderer_color_new ()
  returns GimpCellRendererColor
  is native(gimpwidget)
  is export
{ * }
