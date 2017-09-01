#!/bin/sh

assert_equal () {
	diff "$1" "$2" || printf "F: \"%s\" != \"%s\"\n" $1 $2
}

cat ./test/1.ref | ./trim > ./test/out.txt

assert_equal "./test/1.ref" "./test/out.txt"

cat ./test/1.default.txt | ./trim > ./test/out.txt

assert_equal "./test/1.ref" "./test/out.txt"

cat ./test/1.custom.txt | ./trim -- > ./test/out.txt

assert_equal "./test/1.ref" "./test/out.txt"

cat ./test/2.default.txt | ./trim > ./test/out.txt

assert_equal "./test/2.ref" "./test/out.txt"

cat ./test/3.default.txt | ./trim > ./test/out.txt

assert_equal "./test/3.ref" "./test/out.txt"
