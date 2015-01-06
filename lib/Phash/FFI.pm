package Phash::FFI;
use strict;
use warnings;

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
