use v6;

use Method::Also;
use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GLib::Value;

use GIMP::Widget::SelectButton;

use GIMP::Widget::Roles::Signals::PatternSelectButton;

our subset GimpPatternSelectButtonAncestry is export of Mu
  where GimpPatternSelectButton | GimpSelectButtonAncestry;

class GIMP::Widget::PatternSelectButton is GIMP::Widget::SelectButton {
  also does GIMP::Widget::Roles::Signals::PatternSelectButton;

  has GimpPatternSelectButton $!gpsb;

  submethod BUILD (:$pattern-select) {
    given $pattern-select {
      when GimpPatternSelectButtonAncestry {
        self.setGimpPatternSelectButton($pattern-select);
      }

      when GIMP::Widget::PatternSelectButton {
      }

      default {
      }
    }
  }

  method setGimpPatternSelectButton (GimpPatternSelectButtonAncestry $_) {
    my $to-parent;

    $!gpsb = do {
      when GimpPatternSelectButton {
        $to-parent = cast(GimpSelectButton, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpPatternSelectButton, $_);
      }
    };
    self.setBox($to-parent);
  }

  method GIMP::Raw::Widgets::GimpPatternSelectButton
    is also<GimpPatternSelectButton>
  { $!gpsb }

  proto method new (|)
  { * }

  multi method new (GimpPatternSelectButtonAncestry $pattern-select) {
    return Nil unless $pattern-select;

    self.bless( :$pattern-select );
  }
  multi method new (Str() $title, Str() $pattern_name) {
    my $pattern-select =
      gimp_pattern_select_button_new($title, $pattern_name);

    $pattern-select ?? self.bless( :$pattern-select ) !! Nil;
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

  method palette is rw is also<pattern-name> {
    Proxy.new:
      FETCH => -> $        { self.get_pattern },
      STORE => -> Str() \p { self.set_pattern(p) };
  }

  # Is originally:
  # GimpPatternSelectButton, gchar, gint, gint, gint, gpointer, gboolean, gpointer --> void
  method pattern-set {
    self.connect-pattern-set($!gpsb);
  }

  method get_pattern is also<get-palette> {
    gimp_pattern_select_button_get_pattern($!gpsb);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &gimp_pattern_select_button_get_type,
      $n,
      $t
    );
  }

  method set_pattern (Str() $pattern_name) is also<set-palette> {
    gimp_pattern_select_button_set_pattern($!gpsb, $pattern_name);
  }

}

### /usr/include/gimp-2.0/libgimp/gimpatternselectbutton.h

sub gimp_pattern_select_button_get_pattern (GimpPatternSelectButton $button)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_pattern_select_button_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }

sub gimp_pattern_select_button_new (Str $title, Str $pattern_name)
  returns GimpPatternSelectButton
  is native(gimp)
  is export
{ * }

sub gimp_pattern_select_button_set_pattern (
  GimpPatternSelectButton $button,
  Str $pattern_name
)
  is native(gimp)
  is export
{ * }
