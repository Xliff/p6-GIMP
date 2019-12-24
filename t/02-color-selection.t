use v6;

use GTK::Application;
use GIMP::RGB;
use GIMP::Widget::ColorSelection;

my $a = GTK::Application.new( title => 'org.genex.gimp.color-selector' );

$a.activate.tap({
  $a.wait-for-init;

  my $c = GIMP::Widget::ColorSelection.new;
  $c.color-changed.tap({ $c.get_color.hexa.say });
  $a.window.add($c);
  $a.window.show-all;
});

$a.run;
