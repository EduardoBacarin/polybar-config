#!/bin/bash

function slice_loop () { ## grab a slice of a string, and if you go past the end loop back around
    local str="$1"
    local start=$2
    local how_many=$3
    local len=${#str};

    local result="";

    for ((i=0; i < how_many; i++))
    do
        local index=$(((start+i) % len)) ## Grab the index of the needed char (wrapping around if need be)
        local char="${str:index:1}" ## Select the character at that index
        local result="$result$char" ## Append to result
    done

    echo -n $result
}

msg="Hello There! ";
begin=0
while :
do
    slice=$(slice_loop "$msg" $begin 14);
    echo -ne "\r";
    echo -n $slice;
    echo -ne "              \r";
    sleep 0.08;
    ((begin=begin+1));
done

