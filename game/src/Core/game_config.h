#pragma once

typedef struct __game_config
{
	int width;
	int height;
	void (*initial_scene)();
	char app_title[64];
}
Game_Config;

void configure_game(Game_Config *game_config);

