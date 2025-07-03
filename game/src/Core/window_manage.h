#pragma once

#include "headers.h"
#include "../definitions.h"
#include "../structs.h"
#include "window_data.h"

bool __init_windowData(__window_data* windowData);
void __draw(__window_data* windowData, GameData* gameData);
