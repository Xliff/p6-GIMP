use v6;

use Method::Also;
use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GTK::Compat::Value;

use GIMP::Widget::SelectButton;

our subset GimpGradientSelectButtonAncestry is export of Mu
  where GimpGradientSelectButton | GimpSelectButtonAncestry;

class GIMP::Widget::GradientSelectButton is GIMP::Widget::SelectButton {
  has GimpGradientSelectButton $!ggsb;

  submethod BUILD (:$gimp-progress) {
    given $gimp-progress {
      when GimpGradientSelectButtonAncestry {
        self.setGimpGradientSelectButton($gimp-progress);
      }

      when GIMP::Widget::GradientSelectButton {
      }

      default {
      }
    }
  }

  method setGimpSelectButton (GimpGradientSelectButtonAncestry $_) {
    my $to-parent;

    $!ggsb = do {
      when GimpGradientSelectButton {
        $to-parent = cast(GimpSelectButton, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpGradientSelectButton, $_);
      }
    };
    self.setBox($to-parent);
  }

  method GIMP::Raw::Widgets::GimpGradientSelectButton
    is also<GimpGradientSelectButton>
  { $!ggsb }

  proto method new (|)
  { * }

  multi method new (
    GimpGradientSelectButtonAncestry $gradient-select-button
  ) {
    return Nil unless $gradient-select-button;

    self.bless( :$gradient-select-button );
  }
  multi method new (Str() $title, Str() $gradient_name) {
    my $gradient-select-button =
      gimp_gradient_select_button_new($title, $gradient_name);

    $gradient-select-button ?? self.bless( :$gradient-select-button ) !! Nil;
  }

  # Type: gchar
  method title is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('title', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('title', $gv);
      }
    );
  }

  method gradient is rw is also<gradient-name> {
    Proxy.new:
      FETCH => -> $        { self.get_gradient },
      STORE => -> Str() \g { self.set_gradient(g) };
  }

  # Is originally:
  # GimpGradientSelectButton, gchar, gint, gpointer, gboolean, gpointer --> void
  method gradient-set {
    self.connect-gradient-set($!ggsb);
  }

  method get_gradient is also<get-gradient> {
    gimp_gradient_select_button_get_gradient($!ggsb);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &gimp_gradient_select_button_get_type,
      $n,
      $t
    );
  }

  method set_gradient (Str() $gradient_name) is also<set-gradient> {
    gimp_gradient_select_button_set_gradient($!ggsb, $gradient_name);
  }
}

### /usr/include/gimp-2.0/libgimp/gimpgradientselectbutton.h

sub gimp_gradient_select_button_get_gradient (GimpGradientSelectButton $button)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_gradient_select_button_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }

sub gimp_gradient_select_button_new (Str $title, Str $gradient_name)
  returns GimpGradientSelectButton
  is native(gimp)
  is export
{ * }

sub gimp_gradient_select_button_set_gradient (
  GimpGradientSelectButton $button,
  Str $gradient_name
)
  is native(gimp)
  is export
{ * }
