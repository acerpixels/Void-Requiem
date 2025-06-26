#include "structs.h"
#include "splashscreen.h"

extern GameData g_gameData;

static void init();
static void input(SDL_Event *event);
static void update();
static void draw(SDL_Renderer *renderer);
static void cleanup();

void init_splashscreen()
{
	if (g_gameData.scene.cleanup != NULL)
		g_gameData.scene.cleanup();
	
	g_gameData.scene.init    = init;
	g_gameData.scene.input   = input;
	g_gameData.scene.update  = update;
	g_gameData.scene.draw    = draw;
	g_gameData.scene.cleanup = cleanup;

	RGBA new_bgcolor = { 10, 10, 10, 255 }; // 0A0A0A in hex
	g_gameData.scene.backgroundCol = new_bgcolor;

	g_gameData.scene.init();
}

static void init()
{
	// TODO: init
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
}

