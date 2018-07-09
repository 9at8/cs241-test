#!/bin/bash

source ~cs241/setup

cat foo.wlp4 | wlp4scan | wlp4parse
