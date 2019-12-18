use v6;

use Method::Also;
use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GTK::Compat::Value;
use GIMP::Widget::SelectButton;

use GIMP::Widget::Roles::Signals::FontSelectButton;

our subset GimpFontSelectButtonAncestry is export of Mu
  where GimpFontSelectButton | GimpSelectButtonAncestry;

class GIMP::Widget::FontSelectButton is GIMP::Widget::SelectButton {
  also does GIMP::Widget::Roles::Signals::FontSelectButton;

  has GimpFontSelectButton $!gfsb;

  submethod BUILD (:$font-select) {
    given $font-select {
      when GimpFontSelectButtonAncestry {
        self.setGimpFontSelectButton($font-select);
      }

      when GIMP::Widget::FontSelectButton {
      }

      default {
      }
    }
  }

  method setGimpFontSelectButton (GimpFontSelectButtonAncestry $_) {
    my $to-parent;

    $!gfsb = do {
      when GimpFontSelectButton {
        $to-parent = cast(GimpSelectButton, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpFontSelectButton, $_);
      }
    };
    self.setBox($to-parent);
  }

  method GIMP::Raw::Widgets::GimpFontSelectButton
    is also<GimpFontSelectButton>
  { $!gfsb }

  proto method new (|)
  { * }

  multi method new (GimpFontSelectButtonAncestry $font-select) {
    return Nil unless $font-select;

    self.bless( :$font-select );
  }
  multi method new (Str() $title, Str() $font_name) {
    my $font-select = gimp_font_select_button_new($title, $font_name);

    $font-select ?? self.bless( :$font-select ) !! Nil;
  }

  # Type: gchar
  method font-name is rw  is also<font_name> {
    my GTK::Compat::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('font-name', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('font-name', $gv);
      }
    );
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
        warn "{ self.^name }.title can only be set at creation time."
          if $DEBUG;
      }
    );
  }

  method font is rw {
    Proxy.new:
      FETCH => -> $           { self.get_font },
      STORE => -> $, Str() \f { self.set_font(f) };
  }

  # Is originally:
  # GimpFontSelectButton, gchar, gboolean, gpointer --> void
  method font-set is also<font_set> {
    self.connect-font-set($!gfsb);
  }

  method get_font is also<get-font> {
    gimp_font_select_button_get_font($!gfsb);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_font_select_button_get_type, $n, $t );
  }

  method set_font (Str() $font_name) is also<set-font> {
    gimp_font_select_button_set_font($!gfsb, $font_name);
  }

}


### /usr/include/gimp-2.0/libgimp/gimpfontselectbutton.h

sub gimp_font_select_button_get_font (GimpFontSelectButton $button)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_font_select_button_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }

sub gimp_font_select_button_new (Str $title, Str $font_name)
  returns GimpFontSelectButton
  is native(gimp)
  is export
{ * }

sub gimp_font_select_button_set_font (GimpFontSelectButton $button, Str $font_name)
  is native(gimp)
  is export
{ * }
