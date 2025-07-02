#!/bin/bash

##################################################
# Check if commands needed are existed and
# installed
##################################################

# Script Parameters:
PLATFORM_TYPE=$1
BUILD_TYPE=$2
GEN_ENABLED=$3 # for vim intellisense (OPTIONAL)

if [[ -z "$PLATFORM_TYPE" || -z "$BUILD_TYPE" ]]; then
	PLATFORM_TYPE=LINUX
	BUILD_TYPE=DEBUG
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
		MAKE_COMMAND=ninja
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

if [[ ! -x $(command -v "$MAKE_COMMAND") ]]; then
	echo "Error Occured: $MAKE_COMMAND command could not be found" >&2
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
$CMAKE_COMMAND $CMAKE_BUILD_TYPE -G Ninja ..
$BEAR_COMMAND $MAKE_COMMAND

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
