#pragma once

#include "headers.h"
#include "../definitions.h"
#include "../structs.h"
#include "window_data.h"
#include "application.h"

bool __init_windowData(__window_data* windowData, App_Config app_config);
void __draw(__window_data* windowData, GameData* gameData);
