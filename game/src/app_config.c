#include "Core/entry.h"
#include "splashscreen.h"

void configure_application(Game_Config *game_config)
{
	game_config->height = GAME_WINDOW_HEIGHT;
	game_config->width  = GAME_WINDOW_WIDTH;
	game_config->initial_scene = init_splashscreen;

	const char* game_window_title = GAME_WINDOW_TITLE;

	strncpy(game_config->app_title, game_window_title, 64);
}
