#pragma once

#include QMK_KEYBOARD_H

#include "layers.h"
#include "keycodes.h"

#include "anti_afk.h"
#include "smart_caps.h"

bool process_record_user(uint16_t keycode, keyrecord_t *record);
void matrix_scan_user(void);
