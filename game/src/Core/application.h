#pragma once
#include <SDL3/SDL_render.h>

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
