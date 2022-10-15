# Acme::Color::Rust ![static](https://github.com/PerlFFI/Acme-Color-Rust/workflows/static/badge.svg) ![linux](https://github.com/PerlFFI/Acme-Color-Rust/workflows/linux/badge.svg)

Color example class using Rust + FFI

# SYNOPSIS

```perl
use Acme::Color::Rust;

my $color = Acme::Color::Rust->new("red", 0xff, 0x00, 0x00);
say "the color is ", $color->name;
say "with red ", $color->red, " green ", $color->green, " and blue ", $color->blue;
```

# DESCRIPTION

This class is a very simple RGB color class.  It is implemented using Rust.  It is 
mostly intended as a test for extending perl using Rust concept.

# CONSTRUCTOR

## new

```perl
my $color = Acme::Color::Rust->new($name, $red, $green, $blue);
```

This create a new instance of [Acme::Color::Rust](https://metacpan.org/pod/Acme::Color::Rust).  The name, red, green and blue 
values are passed in and the new instance is returned.  The color values should be 8
bit unsigned values (that is 0-255).

# METHODS

## name

```perl
my $name = $color->name;
```

The name of the color.

## red

```perl
my $red = $color->red;
```

The red component of the color.  This should be an 8-bit unsigned value (that is 0-255).

## green

```perl
my $green = $color->green;
```

The green component of the color.  This should be an 8-bit unsigned value (that is 0-255).

## blue

```perl
my $blue = $color->blue;
```

The blue component of the color.  This should be an 8-bit unsigned value (that is 0-255).

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2022 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
