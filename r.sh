#!/bin/bash

#Author: Priyanka Lee
#Program Name: Pythagoras

rm *.o
rm *.out

echo "Files are being compiled..."

nasm -f elf64 -o pythagoras.o pythagoras.asm

g++ -g -c -m64 -std=c++17 -fno-pie -no-pie -o driver.o driver.cpp

g++ -g -m64 -std=c++17 -fno-pie -no-pie -o application.out pythagoras.o driver.o

./application.out

echo "Script file terminated."
