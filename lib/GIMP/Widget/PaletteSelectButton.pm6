use v6;

use Method::Also;
use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GLib::Value;

use GIMP::Widget::SelectButton;

use GIMP::Widget::Roles::Signals::PaletteSelectButton;

our subset GimpPaletteSelectButtonAncestry is export of Mu
  where GimpPaletteSelectButton | GimpSelectButtonAncestry;

class GIMP::Widget::PaletteSelectButton is GIMP::Widget::SelectButton {
  also does GIMP::Widget::Roles::Signals::PaletteSelectButton;

  has GimpPaletteSelectButton $!gpsb;

  submethod BUILD (:$palette-select) {
    given $palette-select {
      when GimpPaletteSelectButtonAncestry {
        self.setGimpPaletteSelectButton($palette-select);
      }

      when GIMP::Widget::PaletteSelectButton {
      }

      default {
      }
    }
  }

  method setGimpPaletteSelectButton (GimpPaletteSelectButtonAncestry $_) {
    my $to-parent;

    $!gpsb = do {
      when GimpPaletteSelectButton {
        $to-parent = cast(GimpSelectButton, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpPaletteSelectButton, $_);
      }
    };
    self.setBox($to-parent);
  }

  method GIMP::Raw::Widgets::GimpPaletteSelectButton
    is also<GimpPaletteSelectButton>
  { $!gpsb }

  proto method new (|)
  { * }

  multi method new (GimpPaletteSelectButtonAncestry $palette-select) {
    return Nil unless $palette-select;

    self.bless( :$palette-select );
  }
  multi method new (Str() $title, Str() $palette_name) {
    my $palette-select =
      gimp_palette_select_button_new($title, $palette_name);

    $palette-select ?? self.bless( :$palette-select ) !! Nil;
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

  method palette is rw is also<palette-name> {
    Proxy.new:
      FETCH => -> $        { self.get_palette },
      STORE => -> Str() \p { self.set_palette(p) };
  }

  # Is originally:
  # GimpPaletteSelectButton, gchar, gboolean, gpointer --> void
  method palette-set is also<palette_set> {
    self.connect-palette-set($!gpsb);
  }

  method get_palette is also<get-palette> {
    gimp_palette_select_button_get_palette($!gpsb);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &gimp_palette_select_button_get_type,
      $n,
      $t
    );
  }

  method set_palette (Str() $palette_name) is also<set-palette> {
    gimp_palette_select_button_set_palette($!gpsb, $palette_name);
  }

}

### /usr/include/gimp-2.0/libgimp/gimppaletteselectbutton.h

sub gimp_palette_select_button_get_palette (GimpPaletteSelectButton $button)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_palette_select_button_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }

sub gimp_palette_select_button_new (Str $title, Str $palette_name)
  returns GimpPaletteSelectButton
  is native(gimp)
  is export
{ * }

sub gimp_palette_select_button_set_palette (
  GimpPaletteSelectButton $button,
  Str $palette_name
)
  is native(gimp)
  is export
{ * }
