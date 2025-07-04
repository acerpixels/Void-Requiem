#pragma once

typedef struct __app_config
{
	int width;
	int height;
	void (*initial_scene)();
	const char* app_title;
}
App_Config;

void configure_application(App_Config *app_config);
