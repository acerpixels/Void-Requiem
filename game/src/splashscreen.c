#include "structs.h"
#include "splashscreen.h"

extern Scene g_currentScene;

static void init();
static void input(SDL_Event *event);
static void update();
static void draw(SDL_Renderer *renderer);
static void cleanup();

void init_splashscreen()
{
	if (g_currentScene.cleanup != NULL)
		g_currentScene.cleanup();
	
	g_currentScene.init    = init;
	g_currentScene.input   = input;
	g_currentScene.update  = update;
	g_currentScene.draw    = draw;
	g_currentScene.cleanup = cleanup;

	SDL_Color new_bgcolor = { 10, 10, 10, 255 }; // 0A0A0A in hex
	g_currentScene.backgroundCol = new_bgcolor;

	g_currentScene.init();
}

static void init()
{
	SDL_Log("[LOG]: splashscreen initialized!\n");
}

static void input(SDL_Event *event)
{
	// TODO: input
}

static void update()
{
	// TODO: update
}

static void draw(SDL_Renderer *renderer)
{
	// TODO: draw
}

static void cleanup()
{
	SDL_Log("[LOG]: splashscreen cleaned!\n");
}

