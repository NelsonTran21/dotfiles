#pragma once

// Anti-AFK Mode: Jiggles the mouse every now and then to bypass AFK
// logout timeouts and idle status triggers.

bool is_anti_afk_active;
uint16_t anti_afk_timer;
uint16_t anti_afk_delay;

void toggle_anti_afk(void);
bool process_record_anti_afk(uint16_t keycode, keyrecord_t *record);
void matrix_scan_anti_afk(void);
