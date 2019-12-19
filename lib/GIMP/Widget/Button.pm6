use v6;

use NativeCall;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GTK::Button;

use GIMP::Widget::Roles::Signals::Button;

our subset GimpButtonAncestry is export of Mu
  where GimpButton | ButtonAncestry;

class GIMP::Widget::Button is GTK::Button {
  also does GIMP::Widget::Roles::Signals::Button;

  has GimpButton $!gb;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType(self.^name);
    $o;
  }

  submethod BUILD(:$gimp-button) {
    given $gimp-button {
      when GimpButtonAncestry { self.setGimpButton($gimp-button) }

      when GIMP::Widget::Button {
        my $c = ::?CLASS.^name;
        warn "To copy a { $c } object, use { $c }.clone.";
      }

      default {
        # DO NOT throw an exception!
      }
    }
  }

  method setGimpButton(GimpButtonAncestry $_) {
    my $to-parent;
    $!gb = do {
      when GimpButton {
        $to-parent = cast(GtkButton, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpButton, $_);
      }
    };
    self.setButton($to-parent);
  }

  proto method new (|)
  { * }

  multi method new(GimpButtonAncestry $gimp-button) {
    return Nil unless $gimp-button;

    my $o = self.bless( :$gimp-button );
    $o.upref;
    $o;
  }
  multi method new {
    my $gimp-button = gimp_button_new();

    $gimp-button ?? self.bless( :$gimp-button ) !! Nil;
  }

  # Is originally:
  # GimpButton, GdkModifierType, gpointer --> void
  method extended-clicked {
    self.connect-extended-clicked($!gb);
  }

  method emit_extended_clicked (Int() $state) {
    my guint $s = $state; # GdkModifierType

    gimp_button_extended_clicked($!gb, $s);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_button_get_type, $n, $t );
  }

}

### /usr/include/gimp-2.0/libgimpwidgets/gimpbutton.h

sub gimp_button_extended_clicked (
  GimpButton $button,
  guint32 $state  # GdkModifierType
)
  is native(gimpwidget)
  is export
{ * }

sub gimp_button_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_button_new ()
  returns GimpButton
  is native(gimpwidget)
  is export
{ * }
