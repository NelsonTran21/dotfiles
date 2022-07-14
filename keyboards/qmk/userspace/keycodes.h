#pragma once

#include "layers.h"

// Home Row Modifiers
#define HOME_A LGUI_T(KC_A)
#define HOME_R LALT_T(KC_R)
#define HOME_S LSFT_T(KC_S)
#define HOME_T LCTL_T(KC_T)
#define HOME_G LT(NUMPAD_LAYER, KC_G)
#define HOME_N RCTL_T(KC_N)
#define HOME_E RSFT_T(KC_E)
#define HOME_I LALT_T(KC_I)
#define HOME_O RGUI_T(KC_O)

// Shift Tab
#define SFT_TAB LSFT(KC_TAB)

enum custom_keycodes {
  ANTIAFK = SAFE_RANGE,
  SM_CAPS
};
