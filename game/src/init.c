#include "init.h"

SDL_FORCE_INLINE BOOL init_program(ProgramData* programData)
{
	if (!SDL_Init(SDL_INIT_VIDEO))
	{
		SDL_Log("Couldn't initialize SDL: %s", SDL_GetError());
		return FALSE;
	}

	if (!SDL_CreateWindowAndRenderer(
				GAME_WINDOW_TITLE,
				GAME_WINDOW_WIDTH,
				GAME_WINDOW_HEIGHT,
				SDL_WINDOW_MAXIMIZED,
				&programData->window,
				&programData->renderer
				)
		)
	{
		SDL_Log("Couldn't create window & renderer: %s", SDL_GetError());
		return FALSE;
	}
	return TRUE;
}
