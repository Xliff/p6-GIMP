use v6;

use NativeCall;

use GIMP::Raw::Types;

use GIMP::PDB::Roles::Assumable;
use GLib::Roles::StaticClass;

class GIMP::PDB::Float {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method anchor (Int() $floating_sel_ID) {
    my gint32 $f = $floating_sel_ID;

    gimp_floating_sel_anchor($floating_sel_ID);
  }

  method attach (Int() $layer_ID, Int() $drawable_ID) {
    my gint32 ($l, $d) = ($layer_ID, $drawable_ID);

    gimp_floating_sel_attach($layer_ID, $drawable_ID);
  }

  method remove (Int() $floating_sel_ID) {
    my gint32 $f = $floating_sel_ID;

    gimp_floating_sel_remove($floating_sel_ID);
  }

  method to_layer (Int() $floating_sel_ID) {
    my gint32 $f = $floating_sel_ID;

    gimp_floating_sel_to_layer($floating_sel_ID);
  }

}


### /usr/include/gimp-2.0/libgimp/gimpfloatingsel_pdb.h

sub gimp_floating_sel_anchor (gint32 $floating_sel_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_floating_sel_attach (gint32 $layer_ID, gint32 $drawable_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_floating_sel_remove (gint32 $floating_sel_ID)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_floating_sel_to_layer (gint32 $floating_sel_ID)
  returns uint32
  is native(gimp)
  is export
{ * }
