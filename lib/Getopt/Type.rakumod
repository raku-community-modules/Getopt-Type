class Getopt::Type::Constraint {
    has %.accepted;
    has $.results;

    method new(@args) {
        my (%accepted, $results);
        for @args {
            if .index('|') {
                my ($short, $long) = .split('|');
                %accepted{$short} = %accepted{$long} = True;
                $results{$short} := $results{$long} = Any;
            } else {
                %accepted{$_} = True
            }
        }
        self.bless(:%accepted, :$results)
    }

    method ACCEPTS($opts) {
        for $opts.kv -> $k, $v {
            if %!accepted{$k} {
                $!results{$k} = $v;
            } else {
                my @letters = $k.comb;
                for @letters -> $l {
                    unless %!accepted{$l} {
                        return False;
                    }
                }
                # apparently they're all good, set them all
                for @letters -> $l {
                    $!results{$l} = $v;
                }
            }
            $opts{$k}:delete;
        }
        for $!results.kv -> $k, $v {
            $opts{$k} = $v
        }
        True
    }
}

sub getopt(@args) is export {
    Getopt::Type::Constraint.new: @args;
}

=begin pod

=head1 NAME

Getopt::Type - MAIN? Getopt semantics? Why not both?

=head1 SYNOPSIS

=begin code :lang<raku>

use Getopt::Type;

sub MAIN(*%opts where getopt(<f|force v|verbose>)) {
    say "Forcing!"   if %opts<force>;
    say "Verbosing!" if %opts<verbose>;
    say %opts.raku;
}

=end code

=head1 DESCRIPTION

MAIN? Getopt semantics? Why not both?
    
=head1 AUTHOR

Tadeusz Sośnierz

=head1 COPYRIGHT AND LICENSE

Copyright 2016 - 2017 Tadeusz Sośnierz

Copyright 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
