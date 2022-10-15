package Acme::Color::Rust {

  use warnings;
  use 5.020;
  use experimental qw( signatures );
  use FFI::Platypus 2.00;

# ABSTRACT: Color example class using Rust + FFI
# VERSION

=head1 SYNOPSIS

 use Acme::Color::Rust;

 my $color = Acme::Color::Rust->new("red", 0xff, 0x00, 0x00);
 say "the color is ", $color->name;
 say "with red ", $color->red, " green ", $color->green, " and blue ", $color->blue;

=head1 DESCRIPTION

This class is a very simple RGB color class.  It is implemented using Rust.  It is 
mostly intended as a test for extending perl using Rust concept.

=cut

  my $ffi = FFI::Platypus->new( api => 2, lang => 'Rust' );
  $ffi->bundle;
  $ffi->mangler(sub ($name) { "color_$name" });
  $ffi->type('object(Acme::Color::Rust,u32)' => 'color');

=head1 CONSTRUCTOR

=head2 new

 my $color = Acme::Color::Rust->new($name, $red, $green, $blue);

This create a new instance of L<Acme::Color::Rust>.  The name, red, green and blue 
values are passed in and the new instance is returned.  The color values should be 8
bit unsigned values (that is 0-255).

=cut

  $ffi->attach( new => ['string','u8','u8','u8'] => 'u32' => sub ($xsub, $class, $name, $r, $g, $bl) {
    my $index = $xsub->($name, $r, $g, $bl);
    bless \$index, $class;
  });

=head1 METHODS

=head2 name

 my $name = $color->name;

The name of the color.

=head2 red

 my $red = $color->red;

The red component of the color.  This should be an 8-bit unsigned value (that is 0-255).

=head2 green

 my $green = $color->green;

The green component of the color.  This should be an 8-bit unsigned value (that is 0-255).

=head2 blue

 my $blue = $color->blue;

The blue component of the color.  This should be an 8-bit unsigned value (that is 0-255).

=cut

  $ffi->attach( name  => ['color'] => 'string' );
  $ffi->attach( red   => ['color'] => 'u8'     );
  $ffi->attach( green => ['color'] => 'u8'     );
  $ffi->attach( blue  => ['color'] => 'u8'     );

  $ffi->attach( DESTROY => ['color'] );
}

1;
