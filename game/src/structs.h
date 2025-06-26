// TODO: structs.h

#pragma once

#include "headers.h"

typedef struct WindowData
{
	SDL_Window     *window;
	SDL_Renderer   *renderer;
}
WindowData;

typedef struct Scene
{
	void (*init)();
	void (*input)();
	void (*update)();
	void (*draw)();
	void (*cleanup)();
}
Scene;
// TODO: Implement GameData Struct
