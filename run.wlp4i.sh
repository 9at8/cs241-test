#!/bin/bash

source ~cs241/setup

cat ~/.run.tmp.wlp4 | wlp4scan | wlp4parse
