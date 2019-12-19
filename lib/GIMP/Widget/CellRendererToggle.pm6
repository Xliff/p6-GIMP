use v6;

use NativeCall;

use GTK::Compat::RGBA;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GTK::CellRenderer;

use GIMP::Widget::Roles::Signals::CellRendererToggle;

our subset GimpCellRendererToggleAncestry is export of Mu
  where GimpCellRendererToggle | GtkCellRenderer;

class GIMP::Widget::CellRendererToggle is GTK::CellRenderer {
  also does GIMP::Widget::Roles::Signals::CellRendererToggle;
  
  has GimpCellRendererToggle $!gcrt;

  submethod BUILD (:$toggle-cell) {
    given $toggle-cell {
      when GimpCellRendererToggleAncestry {
        self.setGimpCellRendererToggle($toggle-cell);
      }

      when GIMP::Widget::CellRendererToggle { }
      default                              { }
    }
  }

  method setGimpCellRendererToggle (GimpCellRendererToggleAncestry $_) {
    my $to-parent;
    $!gcrt = do {
      when GimpCellRendererToggle {
        $to-parent = cast(GtkCellRenderer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpCellRendererToggle, $_);
      }
    }
    self.setCellRenderer($to-parent);
  }

  method GIMP::Raw::Widget::GimpCellRendererToggle
  { $!gcrt }

  proto method new(|)
  { * }

  multi method new(GimpCellRendererToggleAncestry $toggle-cell) {
    return Nil unless $toggle-cell;

    my $o = self.bless( :$toggle-cell );
    $o.upref;
    $o;
  }
  multi method new (Str() $icon_name) {
    my $toggle-cell = gimp_cell_renderer_toggle_new($icon_name);

    $toggle-cell ?? self.bless( :$toggle-cell ) !! Nil;
  }

  # Is originally:
  # GimpCellRendererToggle, gchar, GdkModifierType, gpointer --> void
  method clicked {
    self.connect-clicked($!gcrt);
  }

  method emit_clicked (Str() $path, Int() $state) {
    my GdkModifierType $s = $state;

    gimp_cell_renderer_toggle_clicked($!gcrt, $path, $s);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &gimp_cell_renderer_toggle_get_type,
      $n,
      $t
    );
  }

}


### /usr/include/gimp-2.0/libgimpwidgets/gimpcellrenderertoggle.h

sub gimp_cell_renderer_toggle_clicked (
  GimpCellRendererToggle $cell,
  Str $path,
  guint32 $state # GdkModifierType $state
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_cell_renderer_toggle_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_cell_renderer_toggle_new (Str $icon_name)
  returns GtkCellRenderer
  is native(gimpwidget)
  is export
{ * }
