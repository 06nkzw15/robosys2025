#!/bin/bash -xv

CMD="./kadai1"

ng() {
    echo "NG: line $1: expected '$2' but got '$3'"
    exit 1
}

ok() {
    echo "OK: $1"
}

input="B3a1!!c"
expected="13abc"
output=$(echo "$input" | $CMD)
[ "$output" = "$expected" ] || ng $LINENO "$expected" "$output"
ok "simple input"



input="Hello123 ABC"
expected="123abcehllo"
output=$(echo "$input" | $CMD)
[ "$output" = "$expected" ] || ng $LINENO "$expected" "$output"
ok "case normalize"



input="!!!!???--"
expected=""
output=$(echo "$input" | $CMD)
[ "$output" = "$expected" ] || ng $LINENO "$expected" "$output"
ok "symbol only"



input=""
expected=""
output=$(echo "$input" | $CMD)
[ "$output" = "$expected" ] || ng $LINENO "$expected" "$output"
ok "empty line"



input=$'A3b\nz9!?X'
expected=$'3ab\n9xz'
output=$(echo "$input" | $CMD)
[ "$output" = "$expected" ] || ng $LINENO "$expected" "$output"
ok "multi-line input"


echo "==== ALL TESTS PASSED ===="
exit 0

