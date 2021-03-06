# $1 = function_number
# $2 = disk_size
# $3 = block_range_start
# $4 = block_range_end
# $5 = block_type
source ./mksofs/test_function.sh
test_function 605 330 0 0 -s
test_function 605 330 328 329 -r

test_function 605 1000 990 996 -x
test_function 605 2000 988 992 -x
test_function 605 1000 996 999 -r
test_function 605 2000 992 999 -r
test_function 605 10000 9999 9999 -r

test_function 605 4 0 3 -x -z
test_function 605 20 0 19 -x -z
test_function 605 1000 0 999 -x -z


if [ "$1" != "complete" ]; then return; fi

for ((i = 4; i < 500; i++)); do
  if [ "$i" == "73" ]; then i=$((i + 1)); fi
  printf "\e[34m$i -> "
  test_function 605 $i 0 $(($i - 1)) -x
done