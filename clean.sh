#!/bin/bash

PARAMETER_INPUT=$1

if [[ ! -d "build-linux" && ! -d "build-windows" ]]; then
	echo "You haven't compiled the program yet. Nothing to do..."
	exit 0
fi

echo -e " ---- Proceeding to clean build directories ---- \n"

if [[ -d "build-linux" ]]; then
	rm -rf "build-linux"
	echo "LOG: build-linux directory has been removed"
fi

if [[ -d "build-windows" ]]; then
	rm -rf "build-windows"
	echo "LOG: build-linux directory has been removed"
fi

echo -e " ---- CLEANING SUCCESSFUL ---- \n"
