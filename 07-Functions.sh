#!/usr/bin/bash

Testing() {

  echo This is my function to automate my job
  a=100
  b=200
  c=300
  echo value of d=${d}
  echo value of e=${e}
  echo value of f=${f}
  echo First argument of this program=$*
}

d=400
e=500
f=600
Testing This is a good example
echo value of a=$a
echo value of b=$b
echo value of c=$c
echo First argument of the main program=$@


