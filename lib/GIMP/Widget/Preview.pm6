use v6;

use Method::Also;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GIMP::Widget::Raw::Preview;

use GTK::Box;
use GTK::Widget;

our subset GimpPreviewAncestry is export of Mu
  where GimpPreview | BoxAncestry;

# Abstract

class GIMP::Widget::Preview is GTK::Box {
  has GimpPreview $!gp;

  submethod BUILD (:$preview) {
    when GimpPreviewAncestry   { self.setPreview($preview) }
    when GIMP::Widget::Preview { }
    default                    { }
  }

  proto method new (|)
  { * }

  multi method new (GimpPreview $preview) {
    return Nil unless $preview;

    self.bless( :$preview );
  }

  method setPreview (GimpPreviewAncestry $_) {
    my $to-parent;
    $!gp = do {
      when GimpPreview {
        $to-parent = cast(GtkBox, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpPreview, $_);
      }
    }
    self.setBox($to-parent);
  }

  method GIMP::Raw::Widgets::GimpPreview
    is also<GimpPreview>
  { $!gp }

  method update is rw {
    Proxy.new:
      FETCH => -> $           { self.get_update },
      STORE => -> $, Int() \u { self.set_update(u) };
  }

  method draw {
    gimp_preview_draw($!gp);
  }

  method draw_buffer (Str() $buffer, Int() $rowstride) is also<draw-buffer> {
    my gint $r = $rowstride;

    gimp_preview_draw_buffer($!gp, $buffer, $r);
  }

  method get_area ( :$raw = False ) is also<get-area> {
    my $a = gimp_preview_get_area($!gp);

    $a ??
      ( $raw ?? $a !! GTK::Widget.new($a) )
      !!
      Nil;
  }

  method get_controls ( :$raw = False ) is also<get-controls> {
    my $c = gimp_preview_get_controls($!gp);

    $c ??
      ( $raw ?? $c !! GTK::Widget.new($c) )
      !!
      Nil;
  }

  proto method get_position (|)
      is also<get-position>
  { * }

  multi method get_position {
    samewith($, $);
  }
  multi method get_position ($x is rw, $y is rw) {
    my gint ($xx, $yy) = 0 xx 2;

    gimp_preview_get_position($!gp, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  proto method get_size (|)
      is also<get-size>
  { * }

  multi method get_size {
    samewith($, $);
  }
  multi method get_size ($width is rw, $height is rw) {
    my gint ($w, $h) = 0 xx 2;

    gimp_preview_get_size($!gp, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_preview_get_type, $n, $t );
  }

  method get_update is also<get-update> {
    so gimp_preview_get_update($!gp);
  }

  method invalidate {
    gimp_preview_invalidate($!gp);
  }

  method set_bounds (Int() $xmin, Int() $ymin, Int() $xmax, Int() $ymax)
    is also<set-bounds>
  {
    my gint ($xm, $ym, $xM, $yM) = ($xmin, $ymin, $xmax, $ymax);

    gimp_preview_set_bounds($!gp, $xm, $ym, $xM, $yM);
  }

  method set_default_cursor (GdkCursor() $cursor) is also<set-default-cursor> {
    gimp_preview_set_default_cursor($!gp, $cursor);
  }

  method set_update (Int() $update) is also<set-update> {
    my gboolean $u = (so $update).Int;

    gimp_preview_set_update($!gp, $u);
  }

  multi method transform (Int() $src_x, Int() $src_y) {
    samewith($src_x, $src_y, $, $);
  }
  multi method transform (
    Int() $src_x,
    Int() $src_y,
    $dest_x is rw,
    $dest_y is rw
  ) {
    my gint ($sx, $sy, $dx, $dy) = ($src_x, $src_y, 0, 0);

    gimp_preview_transform($!gp, $sx, $sy, $dx, $dy);
    ($dest_x, $dest_y) = ($dx, $dy);
  }

  multi method untransform (Int() $src_x, Int() $src_y) {
    samewith($src_x, $src_y, $, $);
  }
  multi method untransform (
    Int() $src_x,
    Int() $src_y,
    $dest_x is rw,
    $dest_y is rw
  ) {
    my gint ($sx, $sy, $dx, $dy) = ($src_x, $src_y, 0, 0);

    gimp_preview_untransform($!gp, $sx, $sy, $dx, $dy);
    ($dest_x, $dest_y) = ($dx, $dy);
  }

}
