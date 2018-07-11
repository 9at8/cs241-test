#!/bin/bash

USER="YourUsernameHere"
SERVER="linux.student.cs.uwaterloo.ca"

INP=$(mktemp)
WLP4I=$(mktemp)
MIPS=$(mktemp)

echo "Enter WLP4 code:"

cat /dev/stdin > $INP

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

scp $INP "${USER}@${SERVER}:~/.run.tmp.wlp4" > /dev/null
ssh "${USER}@${SERVER}" "./run.wlp4i.sh" > $WLP4I

$cmd < $WLP4I > $assembly_file

scp $assembly_file "${USER}@${SERVER}:~/.run.tmp.asm" > /dev/null
ssh "${USER}@${SERVER}" ./run.mips.sh $mips_cmd \"$merls\"

rm $INP $WLP4I $MIPS
