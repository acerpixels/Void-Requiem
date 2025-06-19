# Set cmake version required
cmake_minimum_required (VERSION 3.26)

# Set project info
project (Void_Requiem)

# Set C Language Standard
set (CMAKE_C_STANDARD_REQUIRED ON)
set (CMAKE_C_EXTENSIONS ON)
set (CMAKE_C_STANDARD 99)

# Set CXX Language Standard
set (CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_CXX_EXTENSIONS ON)
set (CMAKE_CXX_STANDARD 11)

if (PROJECT_BINARY_DIR STREQUAL PROJECT_SOURCE_DIR)
	message(
		FATAL_ERROR 
		"In-source builds not allowed. Please create a new directory (called a \"build\" director) and run CMake from there."
	)
endif()

# Set output directory
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

include (cmake/AddResources.cmake)

# Subdirectories
#add_subdirectory(vendor)
add_subdirectory(game)
