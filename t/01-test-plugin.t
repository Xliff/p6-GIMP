#!/usr/bin/env perl6
use v6;

# Ported from the tutorial at:
# https://developer.gimp.org/writing-a-plug-in/1/index.html

use GIMP::Raw::Types;

use GLib::Log;
use GIMP::Main;
use GIMP::PDB::Plugin;

use GTK::Compat::Roles::TypedBuffer;

sub query {
  my @args = (
    GimpParamDef.new(GIMP_PDB_INT32,    'run-mode', 'Run Mode'),
    GimpParamDef.new(GIMP_PDB_IMAGE,       'image', 'Input image'),
    GimpParamDef.new(GIMP_PDB_DRAWABLE, 'drawable', 'Input drawable')
  );

  GIMP::Main.install_procedure(
    "plug-in-hello",
    "Hello, world!",
    "Displays \"Hello, world!\" in a dialog",
    "David Neary, and Clifton Wood",
    "Copyright David Neary and Clifton Wood",
    "2004,2019",
    "_Hello world...",
    "RGB*, GRAY*",
    GIMP_PLUGIN,
    @args
  );

  Plugin.menu_register('plug-in-hello', '/Filters/Misc');
}

sub run (
  Str $name,
  gint $n,
  gpointer $param-buf,
  gint $n-vals is rw,
  gpointer $return_vals
) {
  my $v = GTK::Compat::Roles::TypedBuffer[GimpParam].new( size => 1 );
  my $param = GTK::Compat::TypedBuffer[GimpParam].new($param-buf);
  my $value = GimpParam.new;

  # Setting mandatory output values
  $n-vals = 1;
  $value.type = GIMP_PDB_STATUS;
  $value.data.d_status = GIMP_PDB_SUCCESS.Int;
  $v.bind(0, $value);
  $return_vals = $v.p;

  GLib::Log.message("Hello, world!\n")
    if $param[0].data.d_int32 != GIMP_RUN_NONINTERACTIVE;
}

sub MAIN (|) {
  gimp_MAIN(@*ARGS);
}
