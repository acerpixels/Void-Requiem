#!/bin/bash

##################################################
# Check if commands needed are existed and
# installed
##################################################

w_flag=''
n_flag=''
y_flag=''
r_flag=''

while getopts 'nrwy' flag; do
	case "${flag}" in
		r)
			r_flag='true' ;;
		n)
			n_flag='true' ;;
		w)
			w_flag='true' ;;
		y)
			y_flag='true' ;;
		*)
			;;
	esac
done

if [ ! -z ${r_flag} ]; then
	CMAKE_BUILD_TYPE="-DCMAKE_BUILD_TYPE=Release"
else
	CMAKE_BUILD_TYPE="-DCMAKE_BUILD_TYPE=Debug"
fi

if [ ! -z ${n_flag} ]; then
	CMAKE_BUILD_SYSTEM="-G Ninja"
	BUILD_SYSTEM_COMMAND=ninja
else
	BUILD_SYSTEM_COMMAND=make
fi

if [ ! -z ${w_flag} ]; then
	CMAKE_COMMAND=x86_64-w64-mingw32-cmake
	BUILD_DIR="build-windows/"
else
	if [ ! -z ${y_flag} ]; then
		BEAR_COMMAND="bear --"
	fi
	CMAKE_COMMAND=cmake
	BUILD_DIR="build-linux/"	
fi

##################################################
# Check if commands needed are existed and
# installed
##################################################

if [ ! -x $(command -v "$CMAKE_COMMAND") ]; then
	echo "Error Occured: $CMAKE_COMMAND command could not be found" >&2
	exit 1
fi

if [ ! -x $(command -v "$BUILD_SYSTEM_COMMAND") ]; then
	echo "Error Occured: $BUILD_SYSTEM_COMMAND command could not be found" >&2
	exit 1
fi

##################################################
# Compilation Process Begins Here: 
##################################################

if [ ! -d "$BUILD_DIR" ]; then
	echo "Created $BUILD_DIR directory"
	mkdir "$BUILD_DIR"
fi

# Move inside into the build directory:
cd "$BUILD_DIR"

# Execute Commands
$CMAKE_COMMAND $CMAKE_BUILD_TYPE $CMAKE_BUILD_SYSTEM ..
$BEAR_COMMAND $BUILD_SYSTEM_COMMAND

if [ $? -ne 0 ]; then
	if [ -n "$BEAR_COMMAND" ]; then
		echo "Removing compile_commands.json due to compilation failure" >&2
		rm -rf "compile_commands.json"
	fi
	echo "Error Occured during the compilation process"
	cd ..
	exit 1
else
	if [ -n "$BEAR_COMMAND" ]; then
		echo "Updating compile_commands.json"
		mv "compile_commands.json" ..
	fi

	echo "Compilation process is SUCCESSFUL!"
	cd ..
fi
