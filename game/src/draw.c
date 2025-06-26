#include "draw.h"

/* GLOBAL VARIABLE */
extern GameData g_gameData;

void draw(WindowData* windowData)
{
	SDL_SetRenderDrawColor(windowData->renderer, 0, 0, 0, 255);
	SDL_RenderClear(windowData->renderer);
	SDL_RenderPresent(windowData->renderer);
}
