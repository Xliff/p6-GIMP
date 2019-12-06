use v6;

use NativeCall;

use GIMP::Raw::Types;

use GLib::Roles::StaticClass;

class GIMP::PixPipeParams {
  also does GLib::Roles::StaticClass;

  method build (GimpPixPipeParams $params) {
    gimp_pixpipe_params_build($params);
  }

  method free (GimpPixPipeParams $params) {
    gimp_pixpipe_params_free($params);
  }

  method init (GimpPixPipeParams $params) {
    gimp_pixpipe_params_init($params);
  }

  method parse (Str() $parameters, GimpPixPipeParams $params) {
    gimp_pixpipe_params_parse($parameters, $params);
  }

}


### /usr/include/gimp-2.0/libgimpbase/gimpparasiteio.h

sub gimp_pixpipe_params_build (GimpPixPipeParams $params)
  returns Str
  is native(gimpbase)
  is export
{ * }

sub gimp_pixpipe_params_free (GimpPixPipeParams $params)
  is native(gimpbase)
  is export
{ * }

sub gimp_pixpipe_params_init (GimpPixPipeParams $params)
  is native(gimpbase)
  is export
{ * }

sub gimp_pixpipe_params_parse (Str $parameters, GimpPixPipeParams $params)
  is native(gimpbase)
  is export
{ * }
