#include "init.h"

bool __init_windowData(__window_data* windowData)
{
	if (!SDL_Init(SDL_INIT_VIDEO))
	{
		SDL_Log("Couldn't initialize SDL: %s", SDL_GetError());
		return false;
	}

	if (!SDL_CreateWindowAndRenderer(
				GAME_WINDOW_TITLE,
				GAME_WINDOW_WIDTH,
				GAME_WINDOW_HEIGHT,
				SDL_WINDOW_MAXIMIZED,
				&windowData->window,
				&windowData->renderer
				)
		)
	{
		SDL_Log("Couldn't create window & renderer: %s", SDL_GetError());
		return false;
	}
	return true;
}

void __draw(__window_data* windowData, GameData* gameData)
{
	SDL_Color bgColor = gameData->scene.backgroundCol;
	SDL_SetRenderDrawColor(windowData->renderer, bgColor.r, bgColor.g, bgColor.b, bgColor.a);
	SDL_RenderClear(windowData->renderer);

	gameData->scene.draw(windowData->renderer);

	SDL_RenderPresent(windowData->renderer);
}
