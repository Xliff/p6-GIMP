use v6;

use Method::Also;
use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GIMP::Widget::Preview;

our subset GimpAspectPreviewAncestry is export of Mu
  where GimpAspectPreview | GimpPreviewAncestry;

class GIMP::Widget::AspectPreview is GIMP::Widget::Preview {
  has GimpAspectPreview $!gap;

  submethod BUILD (:$aspect-preview) {
    when GimpAspectPreviewAncestry   { self.setAsectPreview($aspect-preview) }
    when GIMP::Widget::AspectPreview { }
    default                          { }
  }

  method setPreview (GimpAspectPreviewAncestry $_) {
    my $to-parent;
    $!gap = do {
      when GimpAspectPreview {
        $to-parent = cast(GimpPreview, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpAspectPreview, $_);
      }
    }
    self.setPreview($to-parent);
  }

  method GIMP::Raw::Widgets::GimpAspectPreview
    is also<GimpAspectPreview>
  { $!gap }

  proto method new (|)
  { * }

  multi method new (GimpAspectPreviewAncestry $aspect-preview) {
    return Nil unless $aspect-preview;

    self.bless( :$aspect-preview );
  }
  multi method new (Int() $drawable_ID) {
    self.new_from_drawable_id($drawable_ID);
  }

  method new_from_drawable_id (Int() $drawable_ID)
    is also<new-from-drawable-id>
  {
    my gint $d = $drawable_ID;
    my $aspect-preview = gimp_aspect_preview_new_from_drawable_id($d);

    $aspect-preview ?? self.bless( :$aspect-preview ) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_aspect_preview_get_type, $n, $t );
  }

}


### /usr/include/gimp-2.0/libgimp/gimpaspectpreview.h

sub gimp_aspect_preview_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }

sub gimp_aspect_preview_new_from_drawable_id (gint32 $drawable_ID)
  returns GimpAspectPreview
  is native(gimp)
  is export
{ * }
