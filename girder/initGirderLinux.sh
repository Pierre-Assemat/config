#!/bin/bash

# Author : Pierre Assemat
# Copyright (c) Pierre Assemat
# OS: Linux (Ubuntu 16.04)
# Script follows here:
clear

echo 'Initialisation of girder shell.'

cmd=( gnome-terminal )
tab=--tab
N=4

# shellcheck disable=SC2034
ex1="/bin/bash -c '. ~/girder_env/bin/activate; girder-server;bash'"
# shellcheck disable=SC2034
ex2="/bin/bash -c '. ~/girder_env/bin/activate; girder-install web --dev; girder-install web --watch;bash'"
# shellcheck disable=SC2034
ex3="/bin/bash -c '. ~/girder_env/bin/activate; cd girder;bash'"
# shellcheck disable=SC2034
ex4="/bin/bash -c '. ~/girder_env/bin/activate; cd girder_build;bash'"

if [ "$1" != "" ]; then
	plugin="$1"
 	((N++))
 	((N++))
	# shellcheck disable=SC2034
	ex5="/bin/bash -c '. ~/girder_env/bin/activate; girder-install web --dev; girder-install web --watch-plugin ${plugin};bash'"
        # shellcheck disable=SC2034
        ex6="/bin/bash -c '. ~/girder_env/bin/activate; cd girder/plugins/${plugin};bash'"

fi

for ((indx=1; indx<=N; indx++)); do
	execution="ex${indx}"
	cmd+=( " ${tab} -e \"\$${execution}\"" )
done

eval "${cmd[@]}"
