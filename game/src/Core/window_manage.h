#pragma once

#include "headers.h"
#include "../definitions.h"
#include "../structs.h"
#include "window_data.h"
#include "application.h"
#include "game_config.h"

bool __init_windowData(__window_data* windowData, Game_Config game_config);
void __draw(__window_data* windowData, GameData* gameData);
