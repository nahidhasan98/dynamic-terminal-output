#!/bin/bash

# text printing start #
initialText="This is good..."
lenInitText=${#initialText}

replaceText="good..."
lenReplaceText=${#replaceText}

finalText="awesome..."
lenFinalText=${#finalText}

# printing initial text with 100 milliseconds interval per character
for ((i=0;i<$lenInitText;i++)); do
    printf "${initialText:i:1}"
    sleep 0.1
done

# removing(backspace) last word
for ((i=0;i<$lenReplaceText;i++)); do
    printf "\b \b"
    # backspace is '\b'
    # here extra ' \b' is nothing actually, but given to see the backspace changes instantly
    sleep 0.09
done

# printing final text
for ((i=0;i<$lenFinalText;i++)); do
    printf "${finalText:i:1}"
    sleep 0.1
done
printf "\n.\n"
# text printing end #

# name printing start #
initialText="Thanks from Has"
lenInitText=${#initialText}

insertText="Nahid"
lenInsertText=${#insertText}

finalText="an..."
lenFinalText=${#finalText}

# printing initial text
for ((i=0;i<$lenInitText;i++)); do
    printf "${initialText:i:1}"
    sleep 0.1
done

sleep 1
for ((i=0;i<3;i++)); do
    echo -en "\033[1D"
    sleep 0.6
done
# above for loop is exactly equal to this - 'echo -en "\033[3D"'
# but using for loop for better displaying

# printing insertable text
for ((i=0;i<$lenInsertText;i++)); do
    printf "${insertText:i:1} Has"
    echo -en "\033[4D"
    sleep 0.09
done

sleep 1
for ((i=0;i<4;i++)); do
    echo -en "\033[1C"
    sleep 0.6
done
# above for loop is exactly equal to this - 'echo -en "\033[4C"'
# but using for loop for better displaying

# printing final text
for ((i=0;i<$lenFinalText;i++)); do
    printf "${finalText:i:1}"
    sleep 0.09
done
printf "\n"
# name printing start #