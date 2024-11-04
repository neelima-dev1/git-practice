#!/bin/bash

#index starts from 0, size is 3
FRUITS=( "APPLE" "KIWI" "ORANGE") #ARRAY

echo "First fruit is: ${FRUITS[0]}"

echo "Second fruit is: ${FRUITS[1]}"

echo "Third fruit is: ${FRUITS[2]}"

echo "Fruits are: ${FRUITS[@]}"