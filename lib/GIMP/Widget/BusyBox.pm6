use v6;

use NativeCall;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GTK::Bin;

our subset BusyBoxAncestry is export of Mu
  where GimpBusyBox | BinAncestry;

class GIMP::Widget::BusyBox is GTK::Bin {
  has GimpBusyBox $!gbb;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType(self.^name);
    $o;
  }

  submethod BUILD(:$busybox) {
    given $busybox {
      when BusyBoxAncestry { self.setBusybox($busybox) }

      when GTK::Bin {
        my $c = ::?CLASS.^name;
        warn "To copy a { $c } object, use { $c }.clone.";
      }

      default { }
    }
  }

  method setBusyBox(BusyBoxAncestry $_) {
    my $to-parent;
    $!gbb = do {
      when GtkBin {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      when BusyBoxAncestry {
        $to-parent = $_;
        cast(GimpBusyBox, $_);
      }

    };
    self.setBin($to-parent);
  }

  method GIMP::Raw::Widgets::GimpBusyBox
  { $!gbb }

  proto method new (|)
  { * }

  multi method new (BusyBoxAncestry $busybox) {
    return unless $busybox;

    my $o = self.bless( :$busybox );
    $o.upref;
    $o;
  }
  multi method new (Str() $message) {
    my $busybox = gimp_busy_box_new($message);

    $busybox ?? self.bless( :$busybox ) !! Nil;
  }

  method get_message {
    gimp_busy_box_get_message($!gbb);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_busy_box_get_type, $n, $t );
  }

  method set_message (Str() $message) {
    gimp_busy_box_set_message($!gbb, $message);
  }

}

### /usr/include/gimp-2.0/libgimpwidgets/gimpbusybox.h

sub gimp_busy_box_get_message (GimpBusyBox $box)
  returns Str
  is native(gimpwidget)
  is export
{ * }

sub gimp_busy_box_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_busy_box_new (Str $message)
  returns GimpBusyBox
  is native(gimpwidget)
  is export
{ * }

sub gimp_busy_box_set_message (GimpBusyBox $box, Str $message)
  is native(gimpwidget)
  is export
{ * }
