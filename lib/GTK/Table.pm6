use v6.c;

use Method::Also;

use GTK::Compat::Types;
use GIMP::Compat::Deprecated;
use GTK::Raw::Types;

use GTK::Raw::Table;

use GLib::Value;
use GTK::Container;

our subset TableAncestry is export of Mu
  where GtkTable | ContainerAncestry;

class GTK::Table is GTK::Container {
  has GtkTable $!t;

  my @uint-properties = <
    bottom-attach
    left-attach
    right-attach
    top-attach
    x-options
    y-options
    x-padding
    y-padding
  >;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType(self.^name);
    $o;
  }

  submethod BUILD(:$table) {
    given $table {
      when TableAncestry { self.setGrid($table) }
      when GTK::Table    { }
      default            { }
    }
  }

  method setTable (TableAncestry $_) {
    my $to-parent;
    $!t = do {
      when GtkTable  {
        $to-parent = cast(GtkContainer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GtkContainer, $_);
      }
    }
    self.setContainer($to-parent);
  }

  method GIMP::Raw::Deprecated::GtkTable
    is also<GtkTable>
  { $!t }

  proto method new(|)
  { * }

  multi method new (TableAncestry $table) {
    return Nil unless $table;

    my $o = self.bless(:$table);
    $o.upref;
    $o;
  }
  multi method new (Int() $rows, Int() $columns, Int() $homogeneous) {
    my guint ($r, $c) = ($rows, $columns);
    my gboolean $h = (so $homogeneous).Int;
    my $table = gtk_table_new($r, $c, $h);

    $table ?? self.bless( :$table ) !! Nil;
  }

  # Type: guint
  method column-spacing is rw  is also<column_spacing> {
    my GLib::Value $gv .= new( G_TYPE_UINT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('column-spacing', $gv)
        );
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('column-spacing', $gv);
      }
    );
  }

  # Type: gboolean
  method homogeneous is rw  {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('homogeneous', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('homogeneous', $gv);
      }
    );
  }

  # Type: guint
  method n-columns is rw  is also<n_columns> {
    my GLib::Value $gv .= new( G_TYPE_UINT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('n-columns', $gv)
        );
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('n-columns', $gv);
      }
    );
  }

  # Type: guint
  method n-rows is rw  is also<n_rows> {
    my GLib::Value $gv .= new( G_TYPE_UINT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('n-rows', $gv)
        );
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('n-rows', $gv);
      }
    );
  }

  # Type: guint
  method row-spacing is rw  is also<row_spacing> {
    my GLib::Value $gv .= new( G_TYPE_UINT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('row-spacing', $gv)
        );
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('row-spacing', $gv);
      }
    );
  }

  method attach (
    GtkWidget() $child,
    Int() $left_attach,
    Int() $right_attach,
    Int() $top_attach,
    Int() $bottom_attach,
    Int() $xoptions,
    Int() $yoptions,
    Int() $xpadding,
    Int() $ypadding
  ) {
    my guint ($la, $ra, $ta, $ba, $xp, $yp) = (
      $left_attach,
      $right_attach,
      $top_attach,
      $bottom_attach,
      $xpadding,
      $ypadding
    );
    my guint ($xo, $yo) = ($xoptions, $yoptions);

    gtk_table_attach($!t, $child, $la, $ra, $ta, $ba, $xo, $yo, $xp, $yp);
  }

  method attach_defaults (
    GtkWidget() $widget,
    Int() $left_attach,
    Int() $right_attach,
    Int() $top_attach,
    Int() $bottom_attach
  )
    is also<attach-defaults>
  {
    my guint ($la, $ra, $ta, $ba) = (
      $left_attach,
      $right_attach,
      $top_attach,
      $bottom_attach
    );
    gtk_table_attach_defaults($!t, $widget, $la, $ra, $ta, $ba);
  }

  method get_col_spacing (Int() $column) is also<get-col-spacing> {
    my guint $c = $column;

    gtk_table_get_col_spacing($!t, $c);
  }

  method get_default_col_spacing is also<get-default-col-spacing> {
    gtk_table_get_default_col_spacing($!t);
  }

  method get_default_row_spacing is also<get-default-row-spacing> {
    gtk_table_get_default_row_spacing($!t);
  }

  method get_homogeneous is also<get-homogeneous> {
    so gtk_table_get_homogeneous($!t);
  }

  method get_row_spacing (Int() $row) is also<get-row-spacing> {
    my guint $r = $row;

    gtk_table_get_row_spacing($!t, $r);
  }

  proto method get_size (|)
      is also<get-size>
  { * }

  multi method get_size {
    samewith($, $);
  }
  multi method get_size ($rows is rw, $columns is rw) {
    my guint ($r, $c) = 0 xx 2;

    gtk_table_get_size($!t, $r, $c);
    ($rows, $columns) = ($r, $c);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gtk_table_get_type, $n, $t );
  }

  method resize (Int() $rows, Int() $columns) {
    my guint ($r, $c) = ($rows, $columns);

    gtk_table_resize($!t, $rows, $columns);
  }

  method set_col_spacing (Int() $column, Int() $spacing)
    is also<set-col-spacing>
  {
    my guint ($c, $s) = ($column, $spacing);

    gtk_table_set_col_spacing($!t, $c, $s);
  }

  method set_col_spacings (Int() $spacing) is also<set-col-spacings> {
    my guint $s = $spacing;

    gtk_table_set_col_spacings($!t, $s);
  }

  method set_homogeneous (Int() $homogeneous) is also<set-homogeneous> {
    my gboolean $h = (so $homogeneous).Int;

    gtk_table_set_homogeneous($!t, $h);
  }

  method set_row_spacing (Int() $row, Int() $spacing)
    is also<set-row-spacing>
  {
    my guint ($r, $s) = ($row, $spacing);

    gtk_table_set_row_spacing($!t, $r, $s);
  }

  method set_row_spacings (Int() $spacing) is also<set-row-spacings> {
    my guint $s = $spacing;

    gtk_table_set_row_spacings($!t, $s);
  }

  method child-set(GtkWidget() $c, *@propval) is also<child_set> {
    my @notfound;
    @notfound = gather for @propval -> $p, $v {
      given $p {
        when @uint-properties.any { self.child-set-uint($c, $p, $v) }
        default                   { take $p; take $v;               }
      }
    }
    nextwith($c, @notfound) if +@notfound;
  }

}
