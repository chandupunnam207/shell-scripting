#!/usr/bin/bash

## Inputs can be loaded using special variables
## Special variables such as #, *, @

## To access the script name
echo $0

## $1 is the first argument
echo $1

## $2 is the second argument
echo $2

## Pulls all the parsed values or arguments to the script
echo $*

echo $@

## Number of parsed values
echo $#

