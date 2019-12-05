use v6;

use NativeCall;

use GTK::Raw::Utils;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

use GIMP::PDB::Raw::Procedural;

use GLib::Roles::StaticClass;

class GIMP::PDB::Procedural {
  also does GLib::Roles::StaticClass;

  method procedural_db_dump (Str() $filename) {
    gimp_procedural_db_dump($filename);
  }

  method procedural_db_get_data_size (Str() $identifier) {
    gimp_procedural_db_get_data_size($identifier);
  }

  proto method procedural_db_proc_arg (|)
  { * }

  multi method procedural_db_proc_arg (
    Str() $procedure_name,
    Int() $arg_num,
    :$all = True,
    :$raw = False
  ) {
    samewith($procedure_name, $arg_num, $, $, $, :$all, :$raw);
  }
  multi method procedural_db_proc_arg (
    Str() $procedure_name,
    Int() $arg_num,
    $arg_type is rw,
    $arg_name is rw,
    $arg_desc is rw,
    :$all = False,
    :$raw = False
  ) {
    my gint $n = $arg_num;
    my GimpPDBArgType $t = 0;
    my ($an, $ad) = CArray[Str].new xx 0;
    ($an, $ad)».[0] = Str;

    my $rv = so gimp_procedural_db_proc_arg(
      $procedure_name,
      $n,
      $t,
      $an,
      $ad
    );
    ($arg_type, $arg_name, $arg_desc) = ($t, $an, $ad);
    unless $raw {
      $arg_name = CStringArrayToArray($arg_name);
      $arg_desc = CStringArrayToArray($arg_desc);
    }
    $all.not ?? $rv !! ($rv, $arg_type, $arg_name, $arg_desc);
  }

  method procedural_db_proc_exists (Str() $procedure_name) {
    gimp_procedural_db_proc_exists($procedure_name);
  }

  proto method procedural_db_proc_val (|)
  { * }

  multi method procedural_db_proc_val (
    Str() $procedure_name,
    Int() $val_num,
    :$all              = True,
    :$raw              = False
  ) {
    samewith($procedure_name, $val_num, $, $, $, :$all, :$raw);
  }
  multi method procedural_db_proc_val (
    Str() $procedure_name,
    Int() $val_num,
    $val_type          is rw,
    $val_name          is rw,
    $val_desc          is rw,
    :$all              = False,
    :$raw              = False
  ) {
    my $n                 = $val_num;
    my ($vn, $vd)         = CArray[Str].new xx 2;
    my GimpPDBArgType $vt = 0;

    ($vn, $vd)».[0] = Str xx 2;
    my $rv = gimp_procedural_db_proc_val(
      $procedure_name,
      $n,
      $vt,
      $vn,
      $vd
    );
    unless $raw {
      $vn = CStringArrayToArray($vn);
      $vd = CStringArrayToArray($vn);
    }
    ($val_type, $val_name, $val_desc) = ($vt, $vn, $vd);
    $all.not ?? $rv !! ($rv, $val_type, $val_name, $val_desc);
  }

  proto method procedural_db_query (|)
  { * }

  multi method procedural_db_query (
    Str() $name,
    Str() $blurb,
    Str() $help,
    Str() $author,
    Str() $copyright,
    Str() $date,
    Str() $proc_type,
    :$all = True
  ) {
    samewith(
      $name,
      $blurb,
      $help,
      $author,
      $copyright,
      $date,
      $proc_type,
      $,
      $,
      :$all
    );
  }
  multi method procedural_db_query (
    Str() $name,
    Str() $blurb,
    Str() $help,
    Str() $author,
    Str() $copyright,
    Str() $date,
    Str() $proc_type,
    $num_matches is rw,
    CArray[CArray[Str]] $procedure_names,
    :$raw = False,
    :$all = False
  ) {
    my gint $n = 0;
    my $pna = CArray[CArray[Str]].new;
    $pna[0] = CArray[Str];

    my $rv = so gimp_procedural_db_query(
      $name,
      $blurb,
      $help,
      $author,
      $copyright,
      $date,
      $proc_type,
      $n,
      $pna,
    );
    my @names = ();

    @names = CStringArrayToArray($pna[0]) if $pna[0] && $raw.not;
    $all.not ??
      $rv
      !!
      (
        $rv,
        $n,
        $raw ?? $pna[0] !! @names
      )
  }

  method procedural_db_temp_name {
    gimp_procedural_db_temp_name();
  }

}
