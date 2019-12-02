use v6;

use NativeCall;

use GTK::Compat::Types;

use GLib::Roles::StaticClass;

class GIMP::PDB::Dynamics {

  proto method get_list (|)
  { * }

  multi method get_list (Str() $filter) {
    samewith($filter, $);
  }
  multi method get_list (Str() $filter, $num_dynamics is rw) {
    my gint $nd = 0;
    my $la = gimp_dynamics_get_list($filter, $nd);

    $num_dynamics = $nd;
    CStringArrayToArray($la, $nd);
  }

  method refresh {
    gimp_dynamics_refresh();
  }

}

### /usr/include/gimp-2.0/libgimp/gimpdynamics_pdb.h

sub gimp_dynamics_get_list (Str $filter, gint $num_dynamics is rw)
  returns CArray[Str]
  is native(gimp)
  is export
{ * }

sub gimp_dynamics_refresh ()
  returns uint32
  is native(gimp)
  is export
{ * }
