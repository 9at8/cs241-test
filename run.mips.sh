#!/bin/bash

source ~cs241/setup

cs241.linkasm < ~/.run.tmp.asm > ~/.run.tmp.merl
cs241.linker .run.tmp.merl "$1" > ~/.run.tmp.mips

$2 ~/.run.tmp.mips
