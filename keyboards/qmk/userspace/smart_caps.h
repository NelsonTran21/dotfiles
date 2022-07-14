#pragma once

// Smart Caps Lock: A "smart" Caps Lock will only capitalize the next
// identifier or symbol and toggle itself automatically when it is done.

bool is_smart_caps_active;
void enable_smart_caps(void);
void disable_smart_caps(void);
bool process_record_smart_caps(uint16_t keycode, keyrecord_t *record);
