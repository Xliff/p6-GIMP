use v6;

use NativeCall;

use GTK::Compat::Types;

use GIMP::Raw::Enums;

use GLib::Roles::StaticClass;

class GIMP::PDB::Message {
  also does GLib::Roles::StaticClass;

  method get_handler {
    GimpMessageHandlerTypeEnum( gimp_message_get_handler() );
  }

  method gimp_message (Str() $message) {
    gimp_message($message);
  }

  method set_handler (Int() $handler) {
    my GimpMessageHandlerType $h = $handler;

    gimp_message_set_handler($h);
  }

}

### /usr/include/gimp-2.0/libgimp/gimpmessage_pdb.h

sub gimp_message_get_handler ()
  returns GimpMessageHandlerType
  is native(gimp)
  is export
{ * }

sub gimp_message (Str $message)
  returns uint32
  is native(gimp)
  is export
{ * }

sub gimp_message_set_handler (GimpMessageHandlerType $handler)
  returns uint32
  is native(gimp)
  is export
{ * }
