use v6;

unit package GIMP::PDB::Raw::Utils;

sub DoubleArrayToCArray(@a) is export {
  @a .= map({
    do if $_ ~~ Num {
      $_
    } else {
      die '@segs must contain gdouble compatible entries'
        unless .^can('Num').elems;
      .Num;
    }
  });
  my $ca = CArray[gdouble].new;
  my $c = @a.elems;

  $ca[$_] = @a[$_] for ^$c;
  $ca;
}
