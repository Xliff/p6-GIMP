use v6;

use NativeCall;

use GTK::Raw::Utils;

use GIMP::Raw::Types;
use GIMP::PDB::Raw::Buffer;

use GLib::Roles::StaticClass;

class GIMP::PDB::Buffer {
  also does GLib::Roles::StaticClass;

  # So you can treat a static class like an object.
  method assume (
    GIMP::PDB::Buffer:D:
    Str() $buffer_name
  ) {
    .assuming($buffer_name) for self.^methods(:local).grep({
      my \n := .signature.params[1].name;
      n.defined && n eq '$buffer_name'
    })
  }

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
