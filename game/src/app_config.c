#include "Core/entry.h"

void configure_application(App_Config *app_config)
{
	app_config->height = GAME_WINDOW_HEIGHT;
	app_config->width  = GAME_WINDOW_WIDTH;

	const char* game_window_title = GAME_WINDOW_TITLE;

	strncpy(app_config->app_title, game_window_title, 64);
}
