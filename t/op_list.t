#!perl

# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is( 'punie', <<'EOC', <<'OUT', 'op.list' );
@foo = (1, 2, 3, 4);
print $foo[0], "\n";
print $foo[3], "\n";
EOC
1
4
OUT

TODO: {
    local $TODO = 'unimplemented feature';

    language_output_is( 'punie', <<'EOC', <<'OUT', 'op.list' );
#!./perl

# $Header: op.list,v 1.0 87/12/18 13:13:50 root Exp $

print "1..11\n";

@foo = (1, 2, 3, 4);
if ($foo[0] == 1 && $foo[3] == 4) {print "ok 1\n";} else {print "not ok 1\n";}

$_ = join(foo,':');
if ($_ eq '1:2:3:4') {print "ok 2\n";} else {print "not ok 2\n";}

($a,$b,$c,$d) = (1,2,3,4);
if ("$a;$b;$c;$d" eq '1;2;3;4') {print "ok 3\n";} else {print "not ok 3\n";}

($c,$b,$a) = split(/ /,"111 222 333");
if ("$a;$b;$c" eq '333;222;111') {print "ok 4\n";} else {print "not ok 4\n";}

($a,$b,$c) = ($c,$b,$a);
if ("$a;$b;$c" eq '111;222;333') {print "ok 5\n";} else {print "not ok 5\n";}

($a, $b) = ($b, $a);
if ("$a;$b;$c" eq '222;111;333') {print "ok 6\n";} else {print "not ok 6\n";}

($a, $b[1], $c{2}, $d) = (1, 2, 3, 4);
if ($a eq 1) {print "ok 7\n";} else {print "not ok 7\n";}
if ($b[1] eq 2) {print "ok 8\n";} else {print "not ok 8\n";}
if ($c{2} eq 3) {print "ok 9\n";} else {print "not ok 9\n";}
if ($d eq 4) {print "ok 10\n";} else {print "not ok 10\n";}

@foo = (1,2,3,4,5,6,7,8);
($a, $b, $c, $d) = @foo;
print "#11	$a;$b;$c;$d eq 1;2;3;4\n";
if ("$a;$b;$c;$d" eq '1;2;3;4') {print "ok 11\n";} else {print "not ok 11\n";}

EOC
1..11
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
OUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
