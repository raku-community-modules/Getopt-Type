[![Actions Status](https://github.com/raku-community-modules/Getopt-Type/actions/workflows/linux.yml/badge.svg)](https://github.com/raku-community-modules/Getopt-Type/actions) [![Actions Status](https://github.com/raku-community-modules/Getopt-Type/actions/workflows/macos.yml/badge.svg)](https://github.com/raku-community-modules/Getopt-Type/actions) [![Actions Status](https://github.com/raku-community-modules/Getopt-Type/actions/workflows/windows.yml/badge.svg)](https://github.com/raku-community-modules/Getopt-Type/actions)

NAME
====

Getopt::Type - MAIN? Getopt semantics? Why not both?

SYNOPSIS
========

```raku
use Getopt::Type;

sub MAIN(*%opts where getopt(<f|force v|verbose>)) {
    say "Forcing!"   if %opts<force>;
    say "Verbosing!" if %opts<verbose>;
    say %opts.raku;
}
```

DESCRIPTION
===========

MAIN? Getopt semantics? Why not both?

AUTHOR
======

Tadeusz Sośnierz

COPYRIGHT AND LICENSE
=====================

Copyright 2016 - 2017 Tadeusz Sośnierz

Copyright 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

