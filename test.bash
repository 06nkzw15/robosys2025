#!/bin/bash -xv

# テスト対象プログラム
CMD="./kadai1"
# エラー時にどの行が失敗したか表示する関数
ng() {
    echo "NG: line $1: expected '$2' but got '$3'"
    exit 1
}
# OK なら表示
ok() {
    echo "OK: $1"
}
### TEST 1: シンプルな英数字混合 ###
input="B3a1!!c"
expected="13abc"
output=$(echo "$input" | $CMD)
[ "$output" = "$expected" ] || ng $LINENO "$expected" "$output"
ok "simple input"


### TEST 2: 大文字小文字混在 ###
input="Hello123 ABC"
expected="123abcehllo"
output=$(echo "$input" | $CMD)
[ "$output" = "$expected" ] || ng $LINENO "$expected" "$output"
ok "case normalize"


### TEST 3: 記号のみ ###
input="!!!!???--"
expected=""
output=$(echo "$input" | $CMD)
[ "$output" = "$expected" ] || ng $LINENO "$expected" "$output"
ok "symbol only"


### TEST 4: 空行 ###
input=""
expected=""
output=$(echo "$input" | $CMD)
[ "$output" = "$expected" ] || ng $LINENO "$expected" "$output"
ok "empty line"


### TEST 5: 複数行入力 ###
input=$'A3b\nz9!?X'
expected=$'3ab\n9xz'
output=$(echo "$input" | $CMD)
[ "$output" = "$expected" ] || ng $LINENO "$expected" "$output"
ok "multi-line input"


echo "==== ALL TESTS PASSED ===="
exit 0

