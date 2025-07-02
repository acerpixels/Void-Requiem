#!/bin/bash

##################################################
# Check if commands needed are existed and
# installed
##################################################

# Script Parameters:
PLATFORM_TYPE=$1
BUILD_TYPE=$2
BUILD_SYSTEM=$3
GEN_ENABLED=$4 # for vim intellisense (OPTIONAL)

if [[ -z "$PLATFORM_TYPE" || -z "$BUILD_TYPE" || -z "$BUILD_SYSTEM" ]]; then
	PLATFORM_TYPE=LINUX
	BUILD_TYPE=DEBUG
	BUILD_SYSTEM=NINJA
fi

case "$BUILD_TYPE" in
	RELEASE)
		CMAKE_BUILD_TYPE="-DCMAKE_BUILD_TYPE=Release"
		;;
	DEBUG)
		CMAKE_BUILD_TYPE="-DCMAKE_BUILD_TYPE=Debug"
		;;
	*)
		echo "Error Occured: Unspecified build type" >&2
		exit 1
		;;
esac

case "$BUILD_SYSTEM" in
	NINJA)
		CMAKE_BUILD_SYSTEM="-G Ninja"
		BUILD_SYSTEM_COMMAND=ninja
		;;
	MAKEFILE)
		BUILD_SYSTEM_COMMAND=make
		;;
	*)
		echo "Error Occured: Unspecified build type" >&2
		exit 1
		;;
esac

case "$PLATFORM_TYPE" in
	WINDOWS)
		CMAKE_COMMAND=x86_64-w64-mingw32-cmake
		BUILD_DIR="build-windows/"
		;;
	LINUX)
		# Check if GEN_ENABLED is set to "y" 
		if [[ $GEN_ENABLED == "y" ]]; then
			# Check if bear command exists
			if [[ ! -x $(command -v "bear") ]]; then
				echo "Error Occured: bear command could not be found" >&2
				exit 1
			fi
			BEAR_COMMAND="bear --"
		fi
		CMAKE_COMMAND=cmake
		BUILD_DIR="build-linux/"
		;;
	*)
		echo "Error Occured: Unspecified build type" >&2
		exit 1
		;;
esac

##################################################
# Check if commands needed are existed and
# installed
##################################################

if [[ ! -x $(command -v "$CMAKE_COMMAND") ]]; then
	echo "Error Occured: $CMAKE_COMMAND command could not be found" >&2
	exit 1
fi

if [[ ! -x $(command -v "$BUILD_SYSTEM_COMMAND") ]]; then
	echo "Error Occured: $BUILD_SYSTEM_COMMAND command could not be found" >&2
	exit 1
fi

##################################################
# Compilation Process Begins Here: 
##################################################

if [[ ! -d "$BUILD_DIR" ]]; then
	echo "Created $BUILD_DIR directory"
	mkdir "$BUILD_DIR"
fi

# Move inside into the build directory:
cd "$BUILD_DIR"

# Execute Commands
$CMAKE_COMMAND $CMAKE_BUILD_TYPE $CMAKE_BUILD_SYSTEM ..
$BEAR_COMMAND $BUILD_SYSTEM_COMMAND

if [[ $? -ne 0 ]]; then
	if [[ -n "$BEAR_COMMAND" ]]; then
		echo "Removing compile_commands.json due to compilation failure" >&2
		rm -rf "compile_commands.json"
	fi
	echo "Error Occured during the compilation process"
	cd ..
	exit 1
else
	if [[ -n "$BEAR_COMMAND" ]]; then
		echo "Updating compile_commands.json"
		mv "compile_commands.json" ..
	fi

	echo "Compilation process is SUCCESSFUL!"
	cd ..
fi
