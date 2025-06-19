#!/bin/bash

PARAMETER_INPUT=$1

if [[ ! -d "build-linux" && ! -d "build-windows" ]]; then
	echo "You haven't compiled the program yet. Nothing to do..."
	exit 0
fi

case "$PARAMETER_INPUT" in
	REMOVE_DIR)
		echo -e " ---- Proceeding to remove build directories ---- \n"

		if [[ -d "build-linux" ]]; then
			rm -rf "build-linux"
			echo "LOG: build-linux directory has been removed"
		fi

		if [[ -d "build-windows" ]]; then
			rm -rf "build-windows"
			echo "LOG: build-linux directory has been removed"
		fi

		echo -e " ---- REMOVAL SUCCESSFUL ---- \n"
		exit 0
		;;
esac

echo -e " ---- Proceeding to clean build directories ---- \n"

if [[ -d "build-linux" ]]; then
	if [[ ! -x $(command -v make) ]]; then
		echo -e "Error Occured: Could not find make command...\nPlease ensure that you've installed base-devel package properly" >&2
		exit 1
	fi
	cd build-linux/
	make clean
	cd ..
	echo "LOG: build-linux/ directory has been cleaned!"
fi


if [[ -d "build-windows" ]]; then
	if [[ ! -x $(command -v x86_64-w64-mingw32-make) ]]; then
		echo -e "Error Occured: Could not find x86_64-w64-mingw32-make command...\nPlease ensure that you've installed mingw-w64-make package properly" >&2
		exit 1
	fi
	cd build-windows/
	x86_64-w64-mingw32-make clean
	cd ..
	echo "LOG: build-linux/ directory has been cleaned!"
fi

echo -e " ---- CLEANING SUCCESSFUL ---- \n"
