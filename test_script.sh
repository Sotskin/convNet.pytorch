#!/bin/bash

echo "DL Conv-Augment Testing script"
py=python3
script=main.py
b=32
epoch=1

echo ""
echo "Params: b=$b epoch=${epoch}"
echo ""

M=(2 4 8 16 32)
for i in ${M[@]}
do
  echo "Testing: M = $i"
  $py $script --dataset cifar10 --model resnet --model-config "{'depth': 44}"  --duplicates $i --cutout -b $b --epochs ${epoch} --save resnet44_cutout_m-$i
  echo "---------------------------------------------------------------------------------------"
  echo ""
done
echo "Test Over"
