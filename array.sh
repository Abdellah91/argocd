#! /bin/bash

#arg='[abc]=kjlkjkl:545 [def]=yutuiu:23 [ghi]=jljlkj:12 '
# sh -c "./array.sh '$arg'"

s=$1
if [ -z "$s" ]
then
  echo continue
  exit 0
fi
eval declare -A arr=("$s")

for i in "${!arr[@]}"
do
  echo "key  : $i"
  echo "value: ${arr[$i]}"
done

