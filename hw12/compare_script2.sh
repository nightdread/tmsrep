#!/bin/bash

#Compare numbers A & B & C.
echo "Enter number A:";
read a;

echo "Enter number B:";
read b;

echo "Enter number C;";
read c;

if (( a > b )) && (( a > c )); then
 echo "A is greater than B and C"
elif (( a < b )) && (( a < c )); then
 echo "A is less than B and C"
elif (( a == b )) && (( a == c )); then
 echo "A,B and C are equal"
elif (( a > b )) && (( a == c)); then
 echo "A is great than B, but equal wits C"
elif (( a == b )) && (( a < c )); then
 echo "A is equal wits B, but less than C"
#elif (( a > b )) && (( a < c )); then
# echo "A is greater than B, but less than C"
elif (( a < b )) && (( a == c )); then
 echo "A is less than B, but equal with C"
elif (( a == b )) && (( a > c )); then
 echo "A is equal with B, but greater than C"
elif (( a < b )) && (( a > c )); then
 echo "A is less than B, but  greater than C"
elif (( a > b )) && (( b < c )) && (( a < c )); then
 echo "C is greater than A and B"
fi
