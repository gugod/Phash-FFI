#!perl

use strict;
use Test::More;

use FFI::Platypus 0.20;

my $ffi = FFI::Platypus->new;
$ffi->find_lib(lib => "pHash");

my @symbols_to_find = (
    "ph_dct_imagehash",
    "ph_hamming_distance",
    "ph_readaudio",
    "ph_audiohash",
);

plan tests => 0+@symbols_to_find;
for (@symbols_to_find) {
    ok $ffi->find_symbol($_), "found $_";
}
