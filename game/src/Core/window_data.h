#pragma once
#include <SDL3/SDL_video.h>
#include <SDL3/SDL_render.h>

typedef struct __window_data
{
	SDL_Renderer*   renderer;
	SDL_Window*     window;
} __window_data;

