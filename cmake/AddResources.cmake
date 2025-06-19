
function(ADD_RESOURCES)
	cmake_parse_arguments (PARSE_ARGV 0 ARGS "" "TARGET;IN_DIR;OUT_DIR" "")
	file (GLOB_RECURSE INPUT_FILES "${ARGS_IN_DIR}/*.*")
	set (OUT_DIR "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${ARGS_OUT_DIR}")

	foreach (IN_FILE ${INPUT_FILES})
		file (RELATIVE_PATH FILENAME "${ARGS_IN_DIR}" "${IN_FILE}")
		set (OUT_FILE "${OUT_DIR}/${FILENAME}")

		add_custom_command(
			OUTPUT ${OUT_FILE}
			COMMAND ${CMAKE_COMMAND} -E copy_if_different ${IN_FILE} ${OUT_FILE}
			DEPENDS ${IN_FILE}
			COMMENT "Duplicating: ${IN_FILE}"
		)

		list (APPEND OUT_FILES ${OUT_FILE})
	endforeach()

	set (TARGET_NAME "Duplicate-${ARGS_TARGET}")
	add_custom_target (${TARGET_NAME} DEPENDS ${OUT_FILES})
	set_target_properties(${TARGET_NAME} PROPERTIES FOLDER "CustomCommand/CopyResources")

endfunction()
