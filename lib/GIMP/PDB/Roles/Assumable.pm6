use v6;

role GIMP::PDB::Roles::Assumable {
  # So you can treat a static class like an object.
  method assume (
    ::?CLASS:D:
    Str() $buffer_name
  ) {
    my $v = '$' ~ do given self.^shortname {
      when 'Brush'          |
           'Gradient'       |
           'Pattern'        |
           'Range'          |
           'Segment'          { 'name' }

      when 'Brushes'          { 'brush_callback' }
      when 'Buffer'           { 'buffer_name' }
      when 'Display'          { 'display_ID' }

      when 'Drawable'       |
           'Paint'            { 'drawable_ID' }

      when 'File'             { 'run_mode' }
      when 'FontSelect'       { 'font_callback' }
      when 'GradientSelect'   { 'gradient_callback' }

      when 'Image'          |
           'Item'           |
           'Convert'        |
           'Grid'           |
           'Select'         |
           'Undo'             { 'image_ID' }

      when 'PaletteSelect'    { 'palette_callback' }
      when 'PatternSelect'    { 'pattern_callback' }
      when 'Register'         { 'procedure_name' }
      when 'Selection'        { 'image_ID' }
    }
    .assuming($buffer_name) for self.^methods(:local).grep({
      my \n := .signature.params[1].name;
      n.defined && n eq $v
    })
  }
}
