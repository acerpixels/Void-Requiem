#!/bin/bash

PROGRAM_NAME="VoidRequiem"

function build_program()
{
	./build.sh LINUX RELEASE

	if [[ $? -ne 0 ]]; then
		echo "Cannot run the program due to compilation error" >&2
		exit 1
	fi
}

function run_program_windows()
{
	x86_64-w64-mingw32-wine build-windows/bin/$PROGRAM_NAME.exe
}

function run_program_linux()
{
	build-linux/bin/$PROGRAM_NAME
}

# Check if both windows and linux build directories
# existed at the same time
if [[ -d "build-linux" && -d "build-windows" ]]; then
	echo -e "The command detects two existing build directories\nWhich program version you want to run?\n\t-linux\n\t-windows\n"
	read -p "Enter here:" version

	case "$version" in
		linux)
			run_program_linux
			exit 0
			;;
		windows)
			run_program_windows
			exit 0
			;;
		*)
			echo "Unidentified build version. Please try again!" >&2
			exit 1
			;;
	esac
fi

if [[ -d "build-windows" ]]; then
	run_program_windows
	exit 0
fi

# Default
if [[ -d "build-linux" ]]; then
	run_program_linux
else
	build_program
	run_program_linux
fi
