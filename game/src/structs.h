// TODO: structs.h

#pragma once

#include "headers.h"

typedef struct WindowData
{
	SDL_Window     *window;
	SDL_Renderer   *renderer;
}
WindowData;

typedef struct RGBA
{
	Uint8 r;
	Uint8 g;
	Uint8 b;
	Uint8 a;
}
RGBA;

typedef struct Scene
{
	RGBA backgroundCol;

	void (*init)();
	void (*input)(SDL_Event *event);
	void (*update)();
	void (*draw)(SDL_Renderer *renderer);
	void (*cleanup)();
}
Scene;

typedef struct GameData
{
	Scene scene;
}
GameData;
// TODO: Implement GameData Struct
