#pragma once
#include <SDL3/SDL_render.h>

typedef struct __app_config
{
	int width;
	int height;
	void (*initial_scene)();
	char app_title[64];
}
App_Config;

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

void configure_application(App_Config *app_config);
