#pragma once

#include "headers.h"
#include "definitions.h"
#include "structs.h"

typedef struct __window_data
{
	SDL_Renderer*   renderer;
	SDL_Window*     window;
} __window_data;

bool __init_windowData(__window_data* windowData);
void __draw(__window_data* windowData, GameData* gameData);
