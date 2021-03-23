#!/bin/bash

#Compare numbers A & B.
echo "Enter number A:";
read a;

echo "Enter number B:";
read b;

if (( a > b )); then
 echo "A is greater than B"
elif (( a < b )); then
 echo "A is less than B"
elif (( a == b )); then
 echo "A and B are equal"
fi
