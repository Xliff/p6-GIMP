use v6;

use GIMP::Raw::Types;
use GIMP::Raw::Parasite;

use GLib::Object::ParamSpec;

use GLib::Roles::StaticClass;

class GIMP::Parasite {
  has GimpParasite $!p;

  submethod BUILD (:$parasite) {
    $!p = $parasite;
  }

  submethod DESTROY {
    self.free;
  }

  method GIMP::Raw::Structs::GimpParasite
  { $!p }

  multi method new (GimpParasite $parasite, :$ref = True) {
    my $o = self.bless( :$parasite );
    return $o.ref if $ref;
    $o;
  }
  multi method new (Str() $name, Int() $flags, Int() $size, gpointer $data) {
    my guint32 ($f, $s) = ($flags, $size);
    my $p = gimp_parasite_new($name, $flags, $size, $data);

    $p ?? self.bless( parasite => $p ) !! Nil;
  }

  method compare (GimpParasite() $b) {
    so gimp_parasite_compare($!p, $b);
  }

  method copy {
    my $p = gimp_parasite_copy($!p);

    $p ?? Gimp::Parasite.new($p, :!ref) !! Nil;
  }

  method data {
    gimp_parasite_data($!p);
  }

  method data_size {
    gimp_parasite_data_size($!p);
  }

  method flags {
    gimp_parasite_flags($!p);
  }

  method free {
    gimp_parasite_free($!p);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_parasite_get_type, $n, $t );
  }

  method has_flag (gulong $flag) {
    so gimp_parasite_has_flag($!p, $flag);
  }

  method is_persistent {
    so gimp_parasite_is_persistent($!p);
  }

  method is_type (Str() $name) {
    so gimp_parasite_is_type($!p, $name);
  }

  method is_undoable {
    so gimp_parasite_is_undoable($!p);
  }

  method name {
    gimp_parasite_name($!p);
  }
}

class GIMP::Parasite::Param {
  also does GLib::Roles::StaticClass;

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gimp_param_parasite_get_type, $n, $t );
  }

  method spec_parasite (
    Str() $name,
    Str() $nick,
    Str() $blurb,
    Int() $flags,
    :$raw = False
  ) {
    my GParamFlags $f = $flags;

    # GParamSpec
    my $ps = gimp_param_spec_parasite($name, $nick, $blurb, $f);

    $ps ??
      ( $raw ?? $ps !! GLib::Object::ParamSpec.new($ps) )
      !!
      Nil;
  }
}
