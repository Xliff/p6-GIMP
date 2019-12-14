use v6;

use NativeCall;

use GTK::Raw::Utils;

use GIMP::Raw::Types;
use GIMP::PDB::Raw::Buffer;

use GLib::Roles::StaticClass;
use GIMP::PDB::Roles::Assumable;

class GIMP::PDB::Buffer {
  also does GLib::Roles::StaticClass;
  also does GIMP::PDB::Roles::Assumable;

  method delete (Str() $buffer_name) {
    gimp_buffer_delete($buffer_name);
  }

  method get_bytes (Str() $buffer_name) {
    gimp_buffer_get_bytes($buffer_name);
  }

  method get_height (Str() $buffer_name) {
    gimp_buffer_get_height($buffer_name);
  }

  method get_image_type (Str() $buffer_name) {
    gimp_buffer_get_image_type($buffer_name);
  }

  method get_width (Str() $buffer_name) {
    gimp_buffer_get_width($buffer_name);
  }

  proto method get_list (|)
  { * }

  multi method get_list (Str() $filter) {
    samewith($filter, $);
  }
  multi method get_list (
    Str() $filter,
    $num_buffers is rw
  ) {
    my gint $n = 0;
    my $l = gimp_buffers_get_list($filter, $n);

    $num_buffers = $n;
    $l ?? CStringArrayToArray($l, $n) !! Nil;
  }

  method rename (Str() $buffer_name, Str() $new_name) {
    gimp_buffer_rename($buffer_name, $new_name);
  }
}
