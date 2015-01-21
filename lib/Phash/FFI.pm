package Phash::FFI;
# ABSTRACT: FFI-based pHash interface.
use strict;
use warnings;
our $VERSION = "0.01";

use FFI::Raw;
use FFI::CheckLib;

use constant _libphash => find_lib(lib => "pHash");

use constant {
    _ph_dct_imagehash => FFI::Raw->new(
        _libphash,
        'ph_dct_imagehash',
        FFI::Raw::int,
        FFI::Raw::str,
        FFI::Raw::ptr,
    )
};

sub dct_imagehash {
    my ($file_path) = @_;
    my $hash = FFI::Raw::memptr(8);
    my $rv = _ph_dct_imagehash->call($file_path, $hash);
    return unpack("Q", $hash->tostr(8));
}

1;

=head1 NAME

Phash::FFI

=head1 DESCRIPTION

Phash::FFI is the library adaptor for L<pHash|http://phash.org/>, which allows you to generate a hash value from media
field (image, video, audio). It is designed so that if 2 media files have identical hash value if they are perceptually
the same.

=head1 FUNCTIONS

=over 4

=item dct_imagehash($file_path)

This subroutine takes a path name and returns a 64-bit phash. For example:

    my $file = $ARGV[0];
    my $hash = Phash::FFI::dct_imagehash($file);
    printf "%064b\t%s\n", $hash, $file;

=back

=head1 LICENSE

Phash::FFI is released under MIT License.

L<pHash|http://phash.org/> is released under GPLv3 license.

