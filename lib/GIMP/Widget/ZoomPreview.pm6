use v6;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;
use GIMP::Widget::Raw::ZoomPreview;

use GIMP::Widget::ScrolledPreview;

our subset GimpZoomPreviewAncestry is export of Mu
  where GimpZoomPreview | GimpScrolledPreviewAncestry;

# ABSTRACT

class GIMP::Widget::ZoomPreview is GIMP::Widget::ScrolledPreview {
  has GimpZoomPreview $!gzp;

  submethod BUILD ( :$zoom-preview ) {
    when GimpZoomPreviewAncestry   { self.setZoomPreview($zoom-preview) }
    when GIMP::Widget::ScrolledPreview { }
    default                            { }
  }

  proto method new (|)
  { * }

  multi method new (GimpZoomPreviewAncestry $zoom-preview) {
    return Nil unless $zoom-preview;

    self.bless( :$zoom-preview );
  }

  method setScrolledPreview (GimpZoomPreviewAncestry $_) {
    my $to-parent;
    $!gzp = do {
      when GimpZoomPreview {
        $to-parent = cast(GimpScrolledPreview, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpZoomPreview, $_);
      }
    }
    self.setZoomPreview($to-parent);
  }

  method GIMP::Raw::Widgets::GimpZoomPreview
  { $!gzp }

  method new_from_drawable_id (Int() $drawable_ID) {
    my gint $d = $drawable_ID;
    my $zoom-preview = gimp_zoom_preview_new_from_drawable_id($d);

    $zoom-preview ?? self.bless( :$zoom-preview ) !! Nil;
  }

  method new_with_model_from_drawable_id (
    Int() $drawable_ID,
    GimpZoomModel() $model
  ) {
    my gint $d = $drawable_ID;
    my $zoom-preview =
      gimp_zoom_preview_new_with_model_from_drawable_id($d, $model);

    $zoom-preview ?? self.bless( :$zoom-preview ) !! Nil;
  }

  method get_drawable_id {
    gimp_zoom_preview_get_drawable_id($!gzp);
  }

  method get_factor {
    gimp_zoom_preview_get_factor($!gzp);
  }

  method get_model (:$raw = False) {
    my $m = gimp_zoom_preview_get_model($!gzp);

    $m ??
      ( $raw ?? $m !! GIMP::ZoomModel.new($m) )
      !!
      Nil
  }

  proto method get_source (|)
  { * }

  multi method get_source (:$all = True) {
    samewith($, $, $, :$all);
  }
  multi method get_source (
    $width  is rw,
    $height is rw,
    $bpp    is rw,
    :$all = False
  ) {
    my gint ($w, $h, $b) = 0 xx 3;
    my $rv = gimp_zoom_preview_get_source($!gzp, $w, $h, $b);

    $all.not ?? $rv !! ($rv, $width = $w, $height = $h, $bpp = $b);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_zoom_preview_get_type, $n, $t );
  }

}
