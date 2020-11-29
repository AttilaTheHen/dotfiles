#!/usr/bin/env bash

for i in ~/.bash/prompt ~/.bash/paths ~/.bash/aliases ~/.bash/exports ~/.bash/functions; do
	if [[ $__bashrc_bench ]]; then
		TIMEFORMAT="$i: %R"
		time . "$i"
		unset TIMEFORMAT
	else . "$i"
	fi
done; unset i

# to run this, see the "bench" alias in .bash/aliases