#include "draw.h"

/* GLOBAL VARIABLE */
extern GameData g_gameData;

void draw(WindowData* windowData)
{
	RGBA bgColor = g_gameData.scene.backgroundCol;
	SDL_SetRenderDrawColor(windowData->renderer, bgColor.r, bgColor.g, bgColor.b, bgColor.a);


	SDL_RenderClear(windowData->renderer);
	SDL_RenderPresent(windowData->renderer);
}
