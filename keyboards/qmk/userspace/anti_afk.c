#include "NelsonTran21.h"

void toggle_anti_afk(void) {
  is_anti_afk_active = !is_anti_afk_active;
  anti_afk_timer = timer_read();
  anti_afk_delay = 0;
}

bool process_record_anti_afk(uint16_t keycode, keyrecord_t *record) {
  if (keycode == ANTIAFK && record->event.pressed) {
    toggle_anti_afk();
    return false;
  }

  return true;
}

void matrix_scan_anti_afk(void) {
  if (is_anti_afk_active && timer_elapsed(anti_afk_timer) > anti_afk_delay) {
    uint8_t code = random() % 4;

    // TODO When using the experimental kinetic branch, tapping the mouse
    // movement keycodes does not nudge the mouse. They need to be held
    // down for a short amount of time.
    switch (code) {
      case 0:
        tap_code(KC_MS_UP);
        break;

      case 1:
        tap_code(KC_MS_LEFT);
        break;

      case 2:
        tap_code(KC_MS_DOWN);
        break;

      case 3:
        tap_code(KC_MS_RIGHT);
        break;
    }

    anti_afk_timer = timer_read();
    anti_afk_delay = (random() % 9000) + 1000;
  }
}
