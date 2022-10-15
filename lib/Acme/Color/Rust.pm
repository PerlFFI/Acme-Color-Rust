package Acme::Color::Rust {

  use warnings;
  use 5.020;
  use experimental qw( signatures );
  use FFI::Platypus 2.00;

# ABSTRACT: Color example class using Rust + FFI
# VERSION

  my $ffi = FFI::Platypus->new( api => 2, lang => 'Rust' );
  $ffi->bundle;
  $ffi->mangler(sub ($name) { "color_$name" });
  $ffi->type('object(Acme::Color::Rust,u32)' => 'color');

  $ffi->attach( new => ['string','u8','u8','u8'] => 'u32' => sub ($xsub, $class, $name, $r, $g, $b) {
    my $index = $xsub->($name, $r, $g, $b);
    bless \$index, $class;
  });

  $ffi->attach( name  => ['color'] => 'string' );
  $ffi->attach( red   => ['color'] => 'u8'     );
  $ffi->attach( green => ['color'] => 'u8'     );
  $ffi->attach( blue  => ['color'] => 'u8'     );

  $ffi->attach( DESTROY => ['color'] );
}

1;
