use v6;

use Method::Also;
use NativeCall;

use GIMP::Compat::Deprecated;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GTK::Table;

use GTK::Roles::Signals::Generic;

our subset GimpChainButtonAncestry is export of Mu
  where GimpChainButton | TableAncestry;

class GIMP::Widget::ChainButton is GTK::Table {
  also does GTK::Roles::Signals::Generic;

  has GimpChainButton $!gcb;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType(self.^name);
    $o;
  }

  submethod BUILD(:$chain) {
    given $chain {
      when GimpChainButtonAncestry   { self.setGimpChainButton($_) }
      when GIMP::Widget::ChainButton { }
      default                        { }
    }
  }

  method setGimpChainButton (GimpChainButtonAncestry $_) {
    my $to-parent;
    $!gcb = do {
      when GimpChainButton  {
        $to-parent = cast(GtkTable, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpChainButton, $_);
      }
    }
    self.setTable($to-parent);
  }

  method GIMP::Raw::Widgets::GimpChainButton
    is also<GimpChainButton>
  { $!gcb }

  proto method new(|)
  { * }

  multi method new (GimpChainButtonAncestry $chain) {
    return Nil unless $chain;

    my $o = self.bless( :$chain );
    $o.upref;
    $o;
  }
  multi method new (Int() $position) {
    my GimpChainPosition $p = $position;
    my $chain = gimp_chain_button_new($p);

    $chain ?? self.bless( :$chain ) !! Nil;
  }

  # Is originally:
  # GimpChainButton, gpointer --> void
  method toggled {
    self.connect($!gcb, 'toggled');
  }

  method get_active is also<get-active> {
    gimp_chain_button_get_active($!gcb);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_chain_button_get_type, $n, $t );
  }

  method set_active (Int() $active) is also<set-active> {
    my gboolean $a = $active.so.Int;

    gimp_chain_button_set_active($!gcb, $a);
  }

}

### /usr/include/gimp-2.0/libgimpwidgets/gimpchainbutton.h

sub gimp_chain_button_get_active (GimpChainButton $button)
  returns uint32
  is native(gimpwidget)
  is export
{ * }

sub gimp_chain_button_get_type ()
  returns GType
  is native(gimpwidget)
  is export
{ * }

sub gimp_chain_button_new (GimpChainPosition $position)
  returns GimpChainButton
  is native(gimpwidget)
  is export
{ * }

sub gimp_chain_button_set_active (GimpChainButton $button, gboolean $active)
  is native(gimpwidget)
  is export
{ * }
