set(SDL_TESTS OFF)
set(SDL_EXAMPLES OFF)

# Subdirectories:
add_subdirectory(SDL EXCLUDE_FROM_ALL)
add_subdirectory(SDL_image EXCLUDE_FROM_ALL)

# Target:
add_library(vendor INTERFACE)
target_link_libraries(vendor INTERFACE SDL3_image::SDL3_image SDL3::SDL3) 
