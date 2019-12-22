use v6;

use Method::Also;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GIMP::Widget::Raw::ColorSelection;

use GTK::Box;

our subset GimpColorSelectionionAncestry is export
  where GimpColorSelection | BoxAncestry;

class GIMP::Widget::ColorSelector is GTK::Box {
  use GTK::Roles::Signals::Generic;
  
  also does GIMP::Widget::Roles::Signals::ColorSelector;

  has GimpColorSelection $!gcs is implementor;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType($o.^name);
    $o;
  }

  submethod BUILD(:$color-selection) {
    given $color-selection {
      when GimpColorSelectionAncestry {
        self.setBox($_);
      }

      when GIMP::Widget::ColorSelection {
        my $class = ::?CLASS.^name;
        warn "To copy a { $class }, use { $class }.clone.";
      }

      default {
      }
    }
  }

  method GIMP::Raw::Widgets::GimpColorSelection
    is also<GimpColorSelection>
  { $!gcs }

  method setGimpColorSelection(GimpColorSelectionAncestry $_) {
    my $to-parent;
    $!gcs = do {
      when GimpColorSelection {
        $to-parent = cast(GtkBox, $_);
        $_;
      }
      default {
        $to-parent = $_;
        cast(GimpColorSelection, $_);
      }
    }
    self.setBox($to-parent);
  }

  proto method new (|)
  { * }

  multi method new (GimpColorSelectionAncestry $color-selection) {
    return Nil unless $color-selection;

    my $o = self.bless( :$color-selection );
    $o.upref;
    $o;
  }
  multi method new {
    my $color-selection = gimp_color_selection_new();

    $color-selection ?? self.bless( :$color-selection ) !! Nil;
  }

  # Is originally:
  # GimpColorSelection, gpointer --> void
  method color-changed is also<color_changed> {
    self.connect($!w, 'color-changed');
  }

  method emit_color_changed is also<emit-color-changed> {
    gimp_color_selection_color_changed($!gcs);
  }

  method get_color (GimpRGB $color) is also<get-color> {
    gimp_color_selection_get_color($!gcs, $color);
  }

  method get_old_color (GimpRGB $color) is also<get-old-color> {
    gimp_color_selection_get_old_color($!gcs, $color);
  }

  method get_show_alpha is also<get-show-alpha> {
    gimp_color_selection_get_show_alpha($!gcs);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_color_selection_get_type, $n, $t );
  }

  method reset {
    gimp_color_selection_reset($!gcs);
  }

  method set_color (GimpRGB $color) is also<set-color> {
    gimp_color_selection_set_color($!gcs, $color);
  }

  method set_config (GimpColorConfig $config) is also<set-config> {
    gimp_color_selection_set_config($!gcs, $config);
  }

  method set_old_color (GimpRGB $color) is also<set-old-color> {
    gimp_color_selection_set_old_color($!gcs, $color);
  }

  method set_show_alpha (Int() $show_alpha) is also<set-show-alpha> {
    my gboolean $s = $show_alpha.so.Int;

    gimp_color_selection_set_show_alpha($!gcs, $s);
  }

}
