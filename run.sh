#!/bin/bash

USER="YourUsernameHere"
SERVER="$USER@linux.student.cs.uwaterloo.ca"

INP=$(mktemp)
WLP4I=$(mktemp)
MIPS=$(mktemp)

cat /dev/stdin > $INP

scp $INP "$SERVER:~/.run.tmp.wlp4" > /dev/null
ssh $SERVER "./run.wlp4i.sh" > $WLP4I

$1 < $WLP4I > $MIPS

[ "$4" == "-i" ] && cat $MIPS

scp $MIPS "$SERVER:~/.run.tmp.asm" > /dev/null
ssh $SERVER "./run.mips.sh \"$2\" \"$3\""

rm $INP $WLP4I $MIPS
