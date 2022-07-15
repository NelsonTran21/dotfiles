#include QMK_KEYBOARD_H

#include "NelsonTran21.h"

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [COLEMAK_LAYER] = LAYOUT_ortho_2x2u( \
    KC_ESC,  KC_1,    KC_2,    KC_3,   KC_4,    KC_5,    _______, _______, KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_BSPC,
    KC_TAB,  KC_Q,    MOUSE_W, KC_F,   KC_P,    KC_B,    _______, _______, KC_J,    KC_L,    KC_U,    KC_Y,    KC_SCLN, KC_DEL,
    EXTEND,  HOME_A,  HOME_R,  HOME_S, HOME_T,  HOME_G,  _______, _______, KC_M,    HOME_N,  HOME_E,  HOME_I,  HOME_O,  KC_QUOT,
    NUMPAD,  KC_Z,    KC_X,    KC_C,   KC_D,    KC_V,    _______, _______, KC_K,    KC_H,    KC_COMM, KC_DOT,  KC_MINS, KC_ENT,
    KC_LCTL, KC_LGUI, KC_LALT, MIRROR, LAMBDA,  KC_SPC,                    SYMBOL,  LAMBDA,  KC_NO,   KC_SLCK, KC_RGUI, KC_RCTL
  ),

  [QWERTY_LAYER] = LAYOUT_ortho_2x2u(
    KC_ESC,  KC_1,    KC_2,    KC_3,   KC_4,    KC_5,    _______, _______, KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_BSPC,
    KC_TAB,  KC_Q,    KC_W,    KC_E,   KC_R,    KC_T,    _______, _______, KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_DEL,
    EXTEND,  KC_A,    KC_S,    KC_D,   KC_F,    KC_G,    _______, _______, KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
    KC_LSFT, KC_Z,    KC_X,    KC_C,   KC_V,    KC_B,    _______, _______, KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_MINS, KC_ENT,
    KC_LCTL, KC_LGUI, KC_LALT, MIRROR, LAMBDA,  KC_SPC,                    SYMBOL,  LAMBDA,  KC_NO,   KC_RALT, KC_RGUI, KC_RCTL
  ),

  [SYMBOL_LAYER] = LAYOUT_ortho_2x2u(
    _______, COLEMAK, QWERTY,  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, KC_GRV,  KC_TILD, KC_LCBR, KC_RCBR, KC_SLSH, _______, _______, KC_PIPE, KC_AMPR, KC_ASTR, KC_EQL,  KC_COLN, KC_TAB,
    _______, KC_LABK, KC_RABK, KC_LPRN, KC_RPRN, KC_ESC,  _______, _______, KC_PLUS, KC_DLR,  KC_PERC, KC_CIRC, KC_ENT,  KC_DQT,
    _______, KC_AT,   SM_CAPS, KC_LBRC, KC_RBRC, KC_BSLS, _______, _______, KC_MINS, KC_HASH, KC_QUES, KC_EXLM, KC_UNDS, _______,
    RGB_MOD, _______, _______, _______, _______, _______,                   _______, _______, _______, _______, _______, ANTIAFK
  ),

  [NUMPAD_LAYER] = LAYOUT_ortho_2x2u(
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_7,    KC_8,    KC_9,    _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, KC_0,    KC_4,    KC_5,    KC_6,    _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_1,    KC_2,    KC_3,    _______, _______,
    _______, _______, _______, _______, _______, _______,                   _______, _______, _______, _______, _______, _______
  ),

  [EXTEND_LAYER] = LAYOUT_ortho_2x2u(
    RESET,   _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_PSCR,
    _______, _______, _______, KC_BSPC, _______, _______, _______, _______, _______, KC_DEL,  KC_BSPC, _______, _______, KC_INS,
    _______, _______, _______, _______, _______, _______, _______, _______, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, _______, _______,
    _______, _______, _______, SFT_TAB, KC_TAB,  _______, _______, _______, KC_HOME, KC_PGDN, KC_PGUP, KC_END,  _______, _______,
    _______, _______, _______, _______, _______, _______,                   _______, _______, _______, _______, _______, _______
  ),

  [MIRROR_LAYER] = LAYOUT_ortho_2x2u(
    _______, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   _______, _______, KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  _______,
    _______, KC_SCLN, KC_Y,    KC_U,    KC_L,    KC_J,    _______, _______, _______, KC_F7,   KC_F8,   KC_F9,   KC_F12,  _______,
    _______, HOME_O,  HOME_I,  HOME_E,  HOME_N,  KC_M,    _______, _______, _______, KC_F4,   KC_F5,   KC_F6,   KC_F11,  _______,
    _______, KC_MINS, KC_DOT,  KC_COMM, KC_H,    KC_K,    _______, _______, _______, KC_F1,   KC_F2,   KC_F3,   KC_F10,  _______,
    _______, _______, _______, _______, _______, _______,                   _______, _______, _______, _______, _______, _______
  ),

  [FUNCTION_LAYER] = LAYOUT_ortho_2x2u(
    _______, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   _______, _______, KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  _______,
    _______, _______, KC_7,    KC_8,    KC_9,    _______, _______, _______, _______, KC_F7,   KC_F8,   KC_F9,   KC_F12,  _______,
    _______, _______, KC_4,    KC_5,    KC_6,    KC_0,    _______, _______, _______, KC_F4,   KC_F5,   KC_F6,   KC_F11,  _______,
    _______, _______, KC_1,    KC_2,    KC_3,    _______, _______, _______, _______, KC_F1,   KC_F2,   KC_F3,   KC_F10,  _______,
    _______, _______, _______, _______, _______, _______,                   _______, _______, _______, _______, _______, _______
  ),

  [MOUSE_LAYER] = LAYOUT_ortho_2x2u(
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, KC_BTN2, KC_BTN1, _______, _______, _______, KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, KC_WH_L, KC_WH_D, KC_WH_U, KC_WH_R, _______, _______,
    _______, _______, _______, _______, _______, _______,                   _______, _______, _______, _______, _______, _______
  )

};
