use v6;

use GIMP::Raw::Types;

unit package GIMP::Raw::ValueArray;

### /usr/include/gimp-2.0/libgimpbase/gimpvaluearray.h

sub gimp_value_array_append (GimpValueArray $value_array, GValue $value)
  returns GimpValueArray
  is native(gimpbase)
  is export
{ * }

sub gimp_value_array_get_type ()
  returns GType
  is native(gimpbase)
  is export
{ * }

sub gimp_param_spec_value_array (
  Str $name,
  Str $nick,
  Str $blurb,
  GParamSpec $element_spec,
  GParamFlags $flags
)
  returns GParamSpec
  is native(gimpbase)
  is export
{ * }

sub gimp_param_value_array_get_type ()
  returns GType
  is native(gimpbase)
  is export
{ * }

sub gimp_value_array_index (GimpValueArray $value_array, gint $index)
  returns GValue
  is native(gimpbase)
  is export
{ * }

sub gimp_value_array_insert (
  GimpValueArray $value_array,
  gint $index,
  GValue $value
)
  returns GimpValueArray
  is native(gimpbase)
  is export
{ * }

sub gimp_value_array_length (GimpValueArray $value_array)
  returns gint
  is native(gimpbase)
  is export
{ * }

sub gimp_value_array_new (gint $n_prealloced)
  returns GimpValueArray
  is native(gimpbase)
  is export
{ * }

sub gimp_value_array_prepend (GimpValueArray $value_array, GValue $value)
  returns GimpValueArray
  is native(gimpbase)
  is export
{ * }

sub gimp_value_array_ref (GimpValueArray $value_array)
  returns GimpValueArray
  is native(gimpbase)
  is export
{ * }

sub gimp_value_array_remove (GimpValueArray $value_array, gint $index)
  returns GimpValueArray
  is native(gimpbase)
  is export
{ * }

sub gimp_value_array_truncate (GimpValueArray $value_array, gint $n_values)
  is native(gimpbase)
  is export
{ * }

sub gimp_value_array_unref (GimpValueArray $value_array)
  is native(gimpbase)
  is export
{ * }
