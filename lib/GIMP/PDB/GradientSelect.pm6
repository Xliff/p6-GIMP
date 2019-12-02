use v6;

use NativeCall;

use GTK::Compat::Types;

use GLib::Roles::StaticClass;

class GIMP::PDB::GradientSelect {
  also does GLib::Roles::StaticClass;

  method close_popup (Str() $gradient_callback) {
    gimp_gradients_close_popup($gradient_callback);
  }

  method popup (
    Str() $gradient_callback,
    Str() $popup_title,
    Str() $initial_gradient,
    Int() $sample_size
  ) {
    my gint $s = $sample_size;

    gimp_gradients_popup(
      $gradient_callback,
      $popup_title,
      $initial_gradient,
      $s
    );
  }

  method set_popup (Str() $gradient_callback, Str() $gradient_name) {
    gimp_gradients_set_popup($gradient_callback, $gradient_name);
  }

}

### /usr/include/gimp-2.0/libgimp/gimpgradientselect_pdb.h

sub gimp_gradients_close_popup (Str $gradient_callback)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradients_popup (
  Str $gradient_callback,
  Str $popup_title,
  Str $initial_gradient,
  gint $sample_size
)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_gradients_set_popup (Str $gradient_callback, Str $gradient_name)
  returns uint32
  is native(gimp)
  is export
{ * }
