#!/bin/bash

# cursor movement identifier
# source: [https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x361.html]
#############################################
#- Position the Cursor:                     #
#  \033[<L>;<C>H                            #
#     Or                                    #
#  \033[<L>;<C>f                            #
#  puts the cursor at line L and column C.  #
#- Move the cursor up N lines:              #
#  \033[<N>A                                #
#- Move the cursor down N lines:            #
#  \033[<N>B                                #
#- Move the cursor forward N columns:       #
#  \033[<N>C                                #
#- Move the cursor backward N columns:      #
#  \033[<N>D                                #
#                                           #
#- Clear the screen, move to (0,0):         #
#  \033[2J                                  #
#- Erase to end of line:                    #
#  \033[K                                   #
#                                           #
#- Save cursor position:                    #
#  \033[s                                   #
#- Restore cursor position:                 #
#  \033[u                                   #
#############################################

# defining loading text
loadingText="loading. please wait:"

# getting loading text length for cursor move
ltLen=$((${#loadingText}+1))

# printing loading text
echo $loadingText

# moving cursor to the end of the loading text
echo -en "\033[1A\033[${ltLen}C"

# hide cursor blinking
tput civis

counter=0
while true; do
  for char in '-' '\' '|' '/'; do
    printf "%s" "$char"
    # moving one position backward
    echo -en "\033[1D"

    # sleeping for 100 milliseconds
    sleep 0.1
  done

  # running for 8 times
  ((counter+=1))
  # echo $counter
  if [ $counter -eq 8 ]
    then
      break;
  fi
done

# moving cursor to the original/normal position
echo -en "\033[1B\033[${ltLen}D"

# restore cursor blinking
tput cnorm

echo "thank you"
