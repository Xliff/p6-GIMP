use v6;

use Method::Also;

use GTK::Raw::Types;
use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GIMP::Widget::Raw::Dialog;

use GTK::Dialog;

our subset GimpDialogAncestry is export of Mu
  where GimpDialog | DialogAncestry;

class GIMP::Widget::Dialog is GTK::Dialog {
  has GimpDialog $!gd;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType(self.^name);
    $o;
  }

  submethod BUILD(:$gimp-dialog) {
    given $gimp-dialog {
      when GimpDialogAncestry   { self.setGimpDialog($gimp-dialog) }
      when GIMP::Widget::Dialog { }
      default                   { }
    }
  }

  method setDialog(GimpDialogAncestry $_) {
    my $to-parent;
    $!gd = do {
      when GimpDialog {
        $to-parent = cast(GtkDialog, $_);
        $_;
      }
      default {
        $to-parent = $_;
        cast(GimpDialog, $_);
      }
    }
    self.setDialog($to-parent);
  }

  method GIMP::Widget::Raw::GimpDialog
    is also<GimpDialog>
  { $!gd }

  multi method new (GimpDialogAncestry $gimp-dialog) {
    return unless $gimp-dialog;

    my $o = self.bless(:$gimp-dialog);
    $o.upref;
    $o;
  }
  multi method new (
    Str() $title,
    Str() $role,
    GtkWidget() $parent,
    Int() $flags,
    &help_func,
    Str $help_id,
    *%buttons,
    *@buttons
  ) {
    my GtkDialogFlags $f = $flags;
    my $gimp-dialog = gimp_dialog_new(
      $title,
      $role,
      $parent,
      $f,
      &help_func,
      $help_id,
      Str
    );
    @buttons.append: %buttons.pairs;

    my $d = $gimp-dialog ?? self.bless( :$gimp-dialog ) !! Nil;
    return Nil unless $d;

    $d.add-buttons(|@buttons) if @buttons;
    $d;
  }

  # Type: gpointer
  method help-func is rw is also<help_func> {
    my GTK::Compat::Value $gv .= new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('help-func', $gv)
        );
        $gv.pointer
      },
      STORE => -> $,  $val is copy {
        warn "{ self.^name }.help-func can only be set at creation time."
          if $DEBUG;
      }
    );
  }

  # Type: gchar
  method help-id is rw is also<help_id> {
    my GTK::Compat::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('help-id', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('help-id', $gv);
      }
    );
  }

  proto method add_buttons (|)
    is also<add-buttons>
  { * }

  multi method add_buttons(%buttons) {
    samewith(%buttons.pairs);
  }
  multi method add_buttons(*@buttons) {
    die '\@buttons is not an array of pair objects!'
      unless @buttons.all ~~ Pair;
    self.add_button( .key, .value ) for @buttons;
  }

  proto method add_button (|)
  { * }

  multi method add_button (Str() $button_text, Int() $response_id)
    is also<add-button>
  {
    my gint $r = $response_id;

    gimp_dialog_add_button($!gd, $button_text, $r);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_dialog_get_type, $n, $t );
  }

  # GIMP - Internal use only
  # method gimp_dialogs_show_help_button () {
  #   gimp_dialogs_show_help_button($!gd);
  # }

  method run {
    gimp_dialog_run($!gd);
  }

}
