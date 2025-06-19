project (
	VoidRequiem
	VERSION 0.0.1
	LANGUAGES C CXX
)

# Check source files
file (
	GLOB_RECURSE SOURCES
	src/*.c
	src/*.cpp
)

add_executable(${PROJECT_NAME})

target_sources(${PROJECT_NAME} PRIVATE ${SOURCES})

target_link_libraries(${PROJECT_NAME} PRIVATE vendor)

# Compile Definitions
target_compile_definitions (
	${PROJECT_NAME} PRIVATE
	$<$<CONFIG:Debug>:-DDEBUG>
	$<$<CONFIG:Release>:>
)

# Compile Options
target_compile_options (
	${PROJECT_NAME} PRIVATE
	$<$<CONFIG:Debug>:-Wall;-g>
	$<$<CONFIG:Release>:-O3;-s>
)

#add_resources(TARGET resources IN_DIR ${CMAKE_CURRENT_SOURCE_DIR}/res OUT_DIR res)
#add_dependencies(${PROJECT_NAME} Duplicate-resources)
