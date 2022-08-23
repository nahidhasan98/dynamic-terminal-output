#!/bin/bash

height=8
width=10
row=0
col=0

while [ $row -lt $height ] && [ $col -lt $width ]; do
    # up side
    for ((i=$col;i<$width;i++)); do
        printf "*"
        sleep 0.05
    done
    ((row+=1))

    # right side
    for ((i=$row;i<$height;i++)); do
        echo -en "\033[1B\033[1D"
        printf "*"
        sleep 0.05
    done
    ((col+=1))

    # down side
    for ((i=$col;i<$width;i++)); do
        echo -en "\033[2D"
        printf "*"
        sleep 0.05
    done
    ((row+=1))

    # left side
    for ((i=$row;i<$height;i++)); do
        echo -en "\033[1A\033[1D"
        printf "*"
        sleep 0.05
    done
    ((col+=1))
done

# moving cursor to the original/normal position
echo -en "\033[$(($height/2))B\033[$(($width/2))C"
printf "\n"