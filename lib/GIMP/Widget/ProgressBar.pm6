use v6;

use NativeCall;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GTK::ProgressBar;

our subset GimpProgressBarAncestry is export of Mu
  where GimpProgressBar | ProgressBarAncestry;

class GIMP::Widget::ProgressBar is GTK::ProgressBar {
  has GimpProgressBar $!gp;

  submethod BUILD (:$gimp-progress) {
    given $gimp-progress {
      when GimpProgressBarAncestry {
        self.setGimpProgressBar($gimp-progress);
      }

      when GIMP::Widget::ProgressBar {
      }

      default {
      }
    }
  }

  method setGimpProgressBar (GimpProgressBarAncestry $_) {
    my $to-parent;

    $!gp = do {
      when GimpProgressBar {
        $to-parent = cast(GtkProgressBar, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpProgressBar, $_);
      }
    };
    self.setProgressBar($to-parent);
  }

  method GIMP::Raw::Widgets::GimpProgressBar
  { $!gp }

  method new {
    my $gimp-progress = gimp_progress_bar_new();

    $gimp-progress ?? self.bless( :$gimp-progress ) !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_progress_bar_get_type, $n, $t );
  }

}

### /usr/include/gimp-2.0/libgimp/gimpprogressbar.h

sub gimp_progress_bar_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }

sub gimp_progress_bar_new ()
  returns GimpProgressBar
  is native(gimp)
  is export
{ * }
