use v6;

use NativeCall;

use GIMP::Raw::Types;

use GLib::Roles::StaticClass;

class GIMP::CpuAccel {
  also does GLib::Roles::StaticClass;

  method gimp_cpu_accel_get_support () {
    GimpCpuAccelFlagsEnum( gimp_cpu_accel_get_support() );
  }

  method gimp_cpu_accel_set_use (Int() $use) {
    my gboolean $u = (so $use).Int;

    gimp_cpu_accel_set_use($u);
  }

}

sub gimp_cpu_accel_get_support ()
  returns GimpCpuAccelFlags
  is native(gimpbase)
  is export
{ * }

sub gimp_cpu_accel_set_use (gboolean $use)
  is native(gimpbase)
  is export
{ * }
