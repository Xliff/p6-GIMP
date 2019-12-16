use v6;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GIMP::Widget::Raw::ScrolledPreview;

use GIMP::Widget::Preview;

our subset GimpScrolledPreviewAncestry is export of Mu
  where GimpScrolledPreview | GimpPreviewAncestry;

# ABSTRACT

class GIMP::Widget::ScrolledPreview is GIMP::Widget::Preview {
  has GimpScrolledPreview $!gsp;

  submethod BUILD ( :$scrolled-preview ) {
    when GimpScrolledPreviewAncestry   { self.setPreview($scrolled-preview) }
    when GIMP::Widget::ScrolledPreview { }
    default                            { }
  }

  proto method new (|)
  { * }

  multi method new (GimpScrolledPreviewAncestry $scrolled-preview) {
    return Nil unless $scrolled-preview;

    self.bless( :$scrolled-preview );
  }

  method setScrolledPreview (GimpScrolledPreviewAncestry $_) {
    my $to-parent;
    $!gsp = do {
      when GimpScrolledPreview {
        $to-parent = cast(GimpPreview, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpScrolledPreview, $_);
      }
    }
    self.setPreview($to-parent);
  }

  method freeze {
    gimp_scrolled_preview_freeze($!gsp);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_scrolled_preview_get_type, $n, $t );
  }

  method set_policy (Int() $hscrollbar_policy, Int() $vscrollbar_policy) {
    my GtkPolicyType ($hp, $vp) = ($hscrollbar_policy, $vscrollbar_policy);

    gimp_scrolled_preview_set_policy($!gsp, $hp, $vp);
  }

  method set_position (Int() $x, Int() $y) {
    my gint ($xx, $yy) = ($x, $y);

    gimp_scrolled_preview_set_position($!gsp, $x, $y);
  }

  method thaw {
    gimp_scrolled_preview_thaw($!gsp);
  }

}
