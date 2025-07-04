#define SDL_MAIN_USE_CALLBACKS 1  /* use the callbacks instead of main() */
#include <SDL3/SDL_main.h>

#include "game_config.h"
#include "window_manage.h"

/* GLOBAL VARIABLE */
GameData g_gameData;

/* LOCAL VARIABLE */
static __window_data s_windowData;

/* This function runs once at startup. */
SDL_AppResult SDL_AppInit(void **appstate, int argc, char *argv[])
{
	Game_Config game_config;
	configure_game(&game_config);	

	if (!__init_windowData(&s_windowData, game_config))
		return SDL_APP_FAILURE;
	
	SDL_assert(g_gameData.scene.init != NULL);
	
	return SDL_APP_CONTINUE;  /* carry on with the program! */
}

/* This function runs when a new event (mouse input, keypresses, etc) occurs. */
SDL_AppResult SDL_AppEvent(void *appstate, SDL_Event *event)
{
	if (event->type == SDL_EVENT_QUIT)
		return SDL_APP_SUCCESS;  /* end the program, reporting success to the OS. */

	g_gameData.scene.input(event);

	return SDL_APP_CONTINUE;  /* carry on with the program! */
}

/* This function runs once per frame, and is the heart of the program. */
SDL_AppResult SDL_AppIterate(void *appstate)
{
	g_gameData.scene.update();
	__draw(&s_windowData, &g_gameData);
	return SDL_APP_CONTINUE;  /* carry on with the program! */
}

/* This function runs once at shutdown. */
void SDL_AppQuit(void *appstate, SDL_AppResult result)
{
	g_gameData.scene.cleanup();
	/* SDL will clean up the window/renderer for us. */
}

