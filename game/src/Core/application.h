#pragma once

typedef struct __app_config
{
	int width;
	int height;
	void (*initial_scene)();
	char app_title[64];
}
App_Config;

void configure_application(App_Config *app_config);
