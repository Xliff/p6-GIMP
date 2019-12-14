use v6;

use NativeCall;

use GIMP::Raw::Types;

unit package GIMP::PDB::Raw::Buffer;

### /usr/include/gimp-2.0/libgimp/gimpbuffer_pdb.h

sub gimp_buffer_delete (Str $buffer_name)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_buffer_get_bytes (Str $buffer_name)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_buffer_get_height (Str $buffer_name)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_buffer_get_image_type (Str $buffer_name)
  returns GimpImageBaseType
  is native(gimp)
  is export
{ * }

sub gimp_buffer_get_width (Str $buffer_name)
  returns gint
  is native(gimp)
  is export
{ * }

sub gimp_buffers_get_list (Str $filter, gint $num_buffers is rw)
  returns CArray[Str]
  is native(gimp)
  is export
{ * }

sub gimp_buffer_rename (Str $buffer_name, Str $new_name)
  returns Str
  is native(gimp)
  is export
{ * }
