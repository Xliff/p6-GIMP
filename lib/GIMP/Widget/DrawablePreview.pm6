use v6;

use Method::Also;
use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GIMP::Widget::ScrolledPreview;

our subset GimpDrawablePreviewAncestry is export of Mu
  where GimpDrawablePreview | GimpScrolledPreviewAncestry;

class GIMP::Widget::DrawablePreview is GIMP::Widget::ScrolledPreview {
  has GimpDrawablePreview $!gdp;

  submethod BUILD (:$aspect-preview) {
    when GimpDrawablePreviewAncestry   {
      self.setDrawablePreview($aspect-preview)
    }

    when GIMP::Widget::DrawablePreview { }
    default                            { }
  }

  method setPreview (GimpDrawablePreviewAncestry $_) {
    my $to-parent;
    $!gdp = do {
      when GimpAspectPreview {
        $to-parent = cast(GimpScrolledPreview, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpDrawablePreview, $_);
      }
    }
    self.setScrolledPreview($to-parent);
  }

  method GIMP::Raw::Widgets::GimpDrawablePreview
    is also<GimpDrawablePreview>
  { $!gdp }

  proto method new (|)
  { * }

  multi method new (GimpDrawablePreviewAncestry $drawable-preview) {
    return Nil unless $drawable-preview;

    self.bless( :$drawable-preview );
  }
  multi method new (Int() $drawable_ID) {
    self.new_from_drawable_id($drawable_ID);
  }

  method new_from_drawable_id (Int() $drawable_ID)
    is also<new-from-drawable-id>
  {
    my gint $d = $drawable_ID;

    my $drawable-preview = gimp_drawable_preview_new_from_drawable_id($d);
    $drawable-preview ?? self.bless( :$drawable-preview ) !! Nil;
  }

  method draw_region (GimpPixelRgn $region) is also<draw-region> {
    gimp_drawable_preview_draw_region($!gdp, $region);
  }

  method get_drawable_id
    is also<
      get-drawable-id
      drawable_id
      drawable-id
    >
  {
    gimp_drawable_preview_get_drawable_id($!gdp);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_drawable_preview_get_type, $n, $t );
  }

}

### /usr/include/gimp-2.0/libgimp/gimpdrawablepreview.h

sub gimp_drawable_preview_draw_region (
  GimpDrawablePreview $preview,
  GimpPixelRgn $region
)
  is native(gimp)
  is export
{ * }

sub gimp_drawable_preview_get_drawable_id (GimpDrawablePreview $preview)
  returns gint32
  is native(gimp)
  is export
{ * }

sub gimp_drawable_preview_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }

sub gimp_drawable_preview_new_from_drawable_id (gint32 $drawable_ID)
  returns GimpDrawablePreview
  is native(gimp)
  is export
{ * }
