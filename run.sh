#!/bin/bash

USER="a3thakra"
SERVER="$USER@linux.student.cs.uwaterloo.ca"

echo $SERVER

INP=$(mktemp)
WLP4I=$(mktemp)
MIPS=$(mktemp)

cat /dev/stdin > $INP

scp $INP "$SERVER:~/.run.tmp.wlp4"
ssh $SERVER "./run.wlp4i.sh" > $WLP4I

$1 < $WLP4I > $MIPS

scp $MIPS "$SERVER:~/.run.tmp.asm"
ssh $SERVER "./run.mips.sh \"$2\" \"$3\""

rm $INP $WLP4I $MIPS