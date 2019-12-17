use v6;

use NativeCall;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GTK::Box;

our subset GimpSelectButtonAncestry is export of Mu
  where GimpProgressBar | BoxAncestry;

# ABSTRACT

class GIMP::Widget::SelectButton is GTK::Box {
  has GimpSelectButton $!gs;

  submethod BUILD (:$gimp-progress) {
    given $gimp-progress {
      when GimpSelectButtonAncestry {
        self.setGimpSelectButton($gimp-progress);
      }

      when GIMP::Widget::SelectButton {
      }

      default {
      }
    }
  }

  method setGimpSelectButton (GimpSelectButtonAncestry $_) {
    my $to-parent;

    $!gs = do {
      when GimpSelectButton {
        $to-parent = cast(GtkBox, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpSelectButton, $_);
      }
    };
    self.setBox($to-parent);
  }

  method GIMP::Raw::Widgets::GimpSelectButton
  { $!gs }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_select_button_get_type, $n, $t );
  }

}

### /usr/include/gimp-2.0/libgimp/gimpselectbutton.h

sub gimp_select_button_close_popup (GimpSelectButton $button)
  is native(gimp)
  is export
{ * }

sub gimp_select_button_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }
