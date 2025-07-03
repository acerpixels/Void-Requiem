#pragma once

#include "headers.h"
#include "definitions.h"
#include "structs.h"

typedef struct WindowData
{
	SDL_Window     *window;
	SDL_Renderer   *renderer;
}
WindowData;

bool init_windowData(WindowData* windowData);
