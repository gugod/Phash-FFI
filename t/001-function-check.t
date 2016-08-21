use strict;
use Test::More tests => 1;
use Phash::FFI;

can_ok(
    "Phash::FFI" => (
        "dct_imagehash",
        "_ph_dct_imagehash",
        "ph_hamming_distance"
    )
);
