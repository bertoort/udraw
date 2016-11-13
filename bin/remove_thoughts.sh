#!/bin/sh

for file in ./cows/*
do
   sed -i '' '/\$thoughts/d' $file 
done
