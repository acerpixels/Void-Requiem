// TODO: structs.h

#pragma once

#include "Core/headers.h"

typedef struct Scene
{
	SDL_Color backgroundCol;

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
