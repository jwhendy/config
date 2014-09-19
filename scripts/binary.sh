#! /bin/bash

# Output for conky based on using
# Moon Phases font which can be found
# here: http://www.fontspace.com/curtis-clark/moon-phases

### strings for 0's and 1's
# hex code for hollow circle
# zero="\\xE2\\x97\\x8B"
zero="@"

# hex code for filled circle
# one="\\xE2\\x97\\x8F"
one="0"


# command format:
# binary.sh binary-slots hr/min
# example: binary.sh 5 hr
# example: binary.sh 6 min

### variables
exp=$(($1-1))
time=0

if [[ "$2" = hr ]]; then
  time=`date +%H`
elif [[ $2 = min ]]; then
  time=`date +%M`
else
  exit
fi    

output=""

# convert -> binary
while [[ $exp -ge 0 ]]
do
  if [[ $((10#$time)) -ge 2**$exp ]]; then
    time=$(( 10#$time - 2**$exp ))
    output="${output}${one}"
  else
    output="${output}${zero}"
  fi
  exp=$(( 10#$exp - 1 ))
done

echo -e "${output}"
