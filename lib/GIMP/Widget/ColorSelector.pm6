use v6;

use Method::Also;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GIMP::Widget::Raw::ColorSelector;

use GTK::Box;

use GIMP::Widget::Roles::Signals::ColorSelector;

our subset GimpColorSelectorAncestry is export
  where GimpColorSelector | BoxAncestry;

class GIMP::Widget::ColorSelector is GTK::Box {
  also does GIMP::Widget::Roles::Signals::ColorSelector;

  has GimpColorSelector $!gcs is implementor;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType($o.^name);
    $o;
  }

  submethod BUILD(:$color-selector) {
    given $color-selector {
      when GimpColorSelectorAncestry {
        self.setBox($_);
      }

      when GIMP::Widget::ColorSelector {
        my $class = ::?CLASS.^name;
        warn "To copy a { $class }, use { $class }.clone.";
      }

      default {
      }
    }
  }

  method GIMP::Raw::Widgets::GimpColorSelector
    is also<GimpColorSelector>
  { $!gcs }

  method setGimpColorSelector(GimpColorSelectorAncestry $_) {
    my $to-parent;
    $!gcs = do {
      when GimpColorSelector {
        $to-parent = cast(GtkBox, $_);
        $_;
      }
      default {
        $to-parent = $_;
        cast(GimpColorSelector, $_);
      }
    }
    self.setBox($to-parent);
  }

  proto method new (|)
  { * }

  multi method new (GimpColorSelectorAncestry $color-selector) {
    return Nil unless $color-selector;

    my $o = self.bless( :$color-selector );
    $o.upref;
    $o;
  }
  multi method new (
    GimpRGB $rgb,
    GimpHSV $hsv,
    Int() $channel
  ) {
    my GimpColorSelectorChannel $c = $channel;
    my $color-selector = gimp_color_selector_new($!gcs, $rgb, $hsv, $c);

    $color-selector ?? self.bless( :$color-selector ) !! Nil;
  }

  # Is originally:
  # GimpColorSelector, gint, gpointer --> void
  method channel-changed is also<channel_changed> {
    self.connect-int($!gcs, 'channel-changed');
  }

  # Is originally:
  # GimpColorSelector, gpointer, gpointer, gpointer --> void
  method color-changed is also<color_changed> {
    self.connect-color-changed($!gcs);
  }


  method emit_channel_changed is also<emit-channel-changed> {
    gimp_color_selector_channel_changed($!gcs);
  }

  method emit_color_changed is also<emit-color-changed> {
    gimp_color_selector_color_changed($!gcs);
  }

  method get_channel is also<get-channel> {
    gimp_color_selector_get_channel($!gcs);
  }

  method get_color (GimpRGB $rgb, GimpHSV $hsv) is also<get-color> {
    gimp_color_selector_get_color($!gcs, $rgb, $hsv);
  }

  method get_model_visible (Int() $model) is also<get-model-visible> {
    my GimpColorSelectorModel $m = $model;

    gimp_color_selector_get_model_visible($!gcs, $m);
  }

  method get_show_alpha is also<get-show-alpha> {
    gimp_color_selector_get_show_alpha($!gcs);
  }

  method get_toggles_sensitive is also<get-toggles-sensitive> {
    gimp_color_selector_get_toggles_sensitive($!gcs);
  }

  method get_toggles_visible is also<get-toggles-visible> {
    gimp_color_selector_get_toggles_visible($!gcs);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_color_selector_get_type, $n, $t );
  }

  method model_visible_changed (Int() $model) is also<model-visible-changed> {
    my GimpColorSelectorModel $m = $model;

    gimp_color_selector_model_visible_changed($!gcs, $m);
  }

  method set_channel (Int() $channel) is also<set-channel> {
    my GimpColorSelectorChannel $c = $channel;

    gimp_color_selector_set_channel($!gcs, $c);
  }

  method set_color (GimpRGB $rgb, GimpHSV $hsv) is also<set-color> {
    gimp_color_selector_set_color($!gcs, $rgb, $hsv);
  }

  method set_config (GimpColorConfig $config) is also<set-config> {
    gimp_color_selector_set_config($!gcs, $config);
  }

  method set_model_visible (Int() $model, Int() $visible)
    is also<set-model-visible>
  {
    my GimpColorSelectorModel $m = $model;
    my gboolean $v = $visible.so.Int;

    gimp_color_selector_set_model_visible($!gcs, $model, $v);
  }

  method set_show_alpha (Int() $show_alpha) is also<set-show-alpha> {
    my gboolean $s = $show_alpha.so.Int;

    gimp_color_selector_set_show_alpha($!gcs, $s);
  }

  method set_toggles_sensitive (Int() $sensitive)
    is also<set-toggles-sensitive>
  {
    my gboolean $s = $sensitive.so.Int;

    gimp_color_selector_set_toggles_sensitive($!gcs, $s);
  }

  method set_toggles_visible (Int() $visible) is also<set-toggles-visible> {
    my gboolean $v = $visible.so.Int;

    gimp_color_selector_set_toggles_visible($!gcs, $v);
  }

}
