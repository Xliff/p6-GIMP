use v6;

use Method::Also;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GIMP::Widget::Raw::Browser;

use GTK::Pane;

our subset GimpBrowserAncestry is export
  where GimpBrowser | PaneAncestry;

class GIMP::Widget::Browser is GTK::Pane {
  has GimpBrowser $!gb;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType(self.^name);
    $o;
  }

  submethod BUILD(:$gimp-browser) {
    given $gimp-browser {
      when GimpBrowserAncestry   { self.setGimpBrowser($gimp-browser) }
      when GIMP::Widget::Browser { }
      default                    { }
    }
  }

  method setGimpBrowser (GimpBrowserAncestry $_) {
    my $to-parent;
    $!gb = do {
      when GtkPaned {
        $to-parent = cast(GtkPaned, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GimpBrowser, $_);
      }
    }
    self.setPane($to-parent);
  }

  method GTK::Raw::Types::GimpBrowser
    is also<GimpBrowser>
  { $!gb }

  multi method new (GimpBrowserAncestry $gimp-browser) {
    return unless $gimp-browser;

    my $o = self.bless( :$gimp-browser );
    $o.upref;
    $o;
  }
  multi method new {
    my $gimp-browser = gimp_browser_new();

    $gimp-browser ?? self.bless( :$gimp-browser ) !! Nil;
  }

  # Is originally:
  # GimpBrowser, gchar, gint, gpointer --> void
  method search {
    self.connect-search($!gb);
  }

  proto method add_search_types (|)
      is also<add-search-types>
  { * }

  multi method add_search_types (*%types) {
    samewith( |%types.pairs );
  }
  multi method add_search_types (*@types) {
    @types.map({
      unless $_ ~~ Pair && .key ~~ Str && .value ~~ Int {
        die qq:to/DIE/ unless @types.all ~~ Pair;
          \@types elements must be a Pair with label as key and type id { ''
          }as the value
          DIE
      }
    });

    self.add_search_type(.key, .value) for @types;
  }

  method add_search_type (Str() $type_label, Int() $type_id )
    is also<add-search-type>
  {
    my gint $t = $type_id;

    gimp_browser_add_search_types($!gb, $type_label, $t, Str);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_browser_get_type, $n, $t );
  }

  method set_widget (GtkWidget() $widget) is also<set-widget> {
    gimp_browser_set_widget($!gb, $widget);
  }

  method show_message (Str() $message) is also<show-message> {
    gimp_browser_show_message($!gb, $message);
  }

}
