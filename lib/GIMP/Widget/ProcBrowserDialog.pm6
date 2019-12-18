use v6;

use Method::Also;
use NativeCall;

use GIMP::Raw::Types;
use GIMP::Raw::Widgets;

use GIMP::Widget::Dialog;

our subset GimpProcBrowserDialogAncestry is export of Mu
  where GimpProcBrowserDialog | GimpDialogAncestry;

class GIMP::Widget::ProcBrowserDialog is GIMP::Widget::Dialog {
  use GTK::Roles::Signals::Generic;

  has GimpProcBrowserDialog $!gpbd;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType(self.^name);
    $o;
  }

  submethod BUILD(:$gimp-procdialog) {
    given $gimp-procdialog {
      when GimpProcBrowserDialogAncestry {
        self.setGimpProcDialog($gimp-procdialog)
      }

      when GIMP::Widget::ProcBrowserDialog { }
      default                              { }
    }
  }

  method setProcDialog(GimpProcBrowserDialogAncestry $_) {
    my $to-parent;
    $!gpbd = do {
      when GimpProcBrowserDialog {
        $to-parent = cast(GimpDialog, $_);
        $_;
      }
      default {
        $to-parent = $_;
        cast(GimpProcBrowserDialog, $_);
      }
    }
    self.setGimpDialog($to-parent);
  }

  method GIMP::Widget::Raw::GimpProcBrowserDialog
    is also<GimpProcBrowserDialog>
  { $!gpbd }

  multi method new (GimpProcBrowserDialogAncestry $gimp-procdialog) {
    return unless $gimp-procdialog;

    my $o = self.bless(:$gimp-procdialog);
    $o.upref;
    $o;
  }
  multi method new (
    Str() $title,
    Str() $role,
    &help_func,
    Str() $help_id,
    *%buttons,
    *@buttons
  ) {
    my $gimp-procdialog =
      gimp_proc_browser_dialog_new($title, $role, &help_func, $help_id);

    @buttons.append: %buttons.pairs;

    my $d = $gimp-procdialog ?? self.bless( :$gimp-procdialog ) !! Nil;
    return Nil unless $d;

    $d.add-buttons( |@buttons ) if @buttons;
    $d;
  }

  # Is originally:
  # GimpProcBrowserDialog, gpointer --> void
  method row-activated is also<row_activated> {
    self.connect($!gpbd, 'row-activated');
  }

  # Is originally:
  # GimpProcBrowserDialog, gpointer --> void
  method selection-changed is also<selection_changed> {
    self.connect($!gpbd, 'selection-changed');
  }

  method get_selected is also<get-selected> {
    gimp_proc_browser_dialog_get_selected($!gpbd);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &gimp_proc_browser_dialog_get_type,
      $n,
      $t
    );
  }

}


### /usr/include/gimp-2.0/libgimp/gimpprocbrowserdialog.h

sub gimp_proc_browser_dialog_get_selected (GimpProcBrowserDialog $dialog)
  returns Str
  is native(gimp)
  is export
{ * }

sub gimp_proc_browser_dialog_get_type ()
  returns GType
  is native(gimp)
  is export
{ * }

sub gimp_proc_browser_dialog_new (
  Str $title,
  Str $role,
  &help_func (Str, gpointer),
  Str $help_id,
  Str
)
  returns GimpProcBrowserDialog
  is native(gimp)
  is export
{ * }
