#!/bin/bash

# Author : Pierre Assemat
# Copyright (c) Pierre Assemat
# OS: mac OSX
# Script follows here:
clear

echo 'Initialisation of girder shell.'

newTab="ttab -a Terminal -q"
N=6

# shellcheck disable=SC2034
ex1=" -t 'Girder Server' '. ~/virtualEnv/bin/activate; girder-server'"
# shellcheck disable=SC2034
ex2=" -t 'Girder Web' '. ~/virtualEnv/bin/activate; girder-install web --dev; girder-install web --watch'"
# shellcheck disable=SC2034
ex3=" -t 'Girder git repo' '. ~/virtualEnv/bin/activate; cd; cd girder'"
# shellcheck disable=SC2034
ex4=" -t 'Girder Build' '. ~/virtualEnv/bin/activate; cd; cd girder_build'"

ex5=" -t 'MongoDB' 'mongod'"

ex6=" -t 'jupyter notebook' '. ~/virtualEnv/bin/activate; jupyter notebook'"

# Add plugin setup
if [ "$1" != "" ]; then
	plugin="$1"
 	((N++))
 	((N++))
	# shellcheck disable=SC2034
	ex6="/bin/bash -c '. ~/girder_env/bin/activate; girder-install web --dev; girder-install web --watch-plugin ${plugin};bash'"
        # shellcheck disable=SC2034
        ex7="/bin/bash -c '. ~/girder_env/bin/activate; cd girder/plugins/${plugin};bash'"

fi

for ((indx=1; indx<=N; indx++)); do
	cmd=( $newTab  )
	execution="ex${indx}"
	eval cmd+='$'$execution
	eval $cmd
done
