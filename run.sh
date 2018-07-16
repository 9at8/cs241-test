#!/bin/bash

USER="YourUsernameHere"
SERVER="linux.student.cs.uwaterloo.ca"

INP=$(mktemp)
WLP4I=$(mktemp)
MIPS=$(mktemp)

echo "Enter WLP4 code (press C-d when done):"

cat /dev/stdin > $INP

echo
echo "Initiating hack..."

OPTIND=1

function join_by { local IFS="$1"; shift; echo "$*"; }

cmd="racket wlp4gen.rkt"
mips_cmd="mips.twoints"
assembly_file=$MIPS
merls=""

while getopts c:a:m: opt; do
    case "$opt" in
	c)  cmd=$OPTARG
	    ;;
	a)  assembly_file=$OPTARG
            ;;
	m)  mips_cmd=$OPTARG
            ;;
    esac
done

shift $((OPTIND-1))

[ "${1:-}" = "--" ] && shift

tmp_join=$(join_by " " $@)

[ tmp_join ] && merls=$tmp_join

echo
echo "Invading privacy: uploading input to server..."

scp $INP "${USER}@${SERVER}:~/.run.tmp.wlp4" > /dev/null

echo
echo "Producing intermediate files..."

ssh "${USER}@${SERVER}" "./run.wlp4i.sh" > $WLP4I

echo
echo "Attempting to run your shitty code..."

$cmd < $WLP4I > $assembly_file

echo
echo "More privacy invasion: sending output to server..."

scp $assembly_file "${USER}@${SERVER}:~/.run.tmp.asm" > /dev/null

echo
echo "Remotely running scripts..."

ssh "${USER}@${SERVER}" ./run.mips.sh $mips_cmd \"$merls\"

rm $INP $WLP4I $MIPS
