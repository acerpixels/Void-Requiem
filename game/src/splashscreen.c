#include "structs.h"
#include "splashscreen.h"

extern GameData g_gameData;

static void init();
static void input();
static void update();
static void draw();
static void cleanup();

void init_splashscreen()
{
	g_gameData.scene.init    = init;
	g_gameData.scene.input   = input;
	g_gameData.scene.update  = update;
	g_gameData.scene.draw    = draw;
	g_gameData.scene.cleanup = cleanup;
}

static void init()
{
	// TODO: init
}

static void input()
{
	// TODO: input
}

static void update()
{
	// TODO: update
}

static void draw()
{
	// TODO: draw
}

static void cleanup()
{
	// TODO: cleanup
}

