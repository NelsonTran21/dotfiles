#include "NelsonTran21.h"

void enable_smart_caps(void) {
  is_smart_caps_active = true;
  if (!(host_keyboard_led_state().caps_lock)) {
    tap_code(KC_CAPS);
  }
}

void disable_smart_caps(void) {
  is_smart_caps_active = false;
  if (host_keyboard_led_state().caps_lock) {
    tap_code(KC_CAPS);
  }
}

uint16_t get_basic_keycode(uint16_t dual_role_key) {
  return dual_role_key & 0xFF;
}

void process_smart_caps(uint16_t keycode, const keyrecord_t *record) {
  if (is_smart_caps_active) {
    switch (keycode) {
      // Process dual-role modifier keys.
      case QK_MOD_TAP ... QK_MOD_TAP_MAX:
      case QK_LAYER_TAP ... QK_LAYER_TAP_MAX:
      case QK_MOMENTARY ... QK_MOMENTARY_MAX:
        // Ignore them when used as modifiers.
        if (record->tap.count == 0) { return; }

        // But when tapped, convert them to basic keycodes.
        keycode = get_basic_keycode(keycode);
        break;
    }

    switch (keycode) {
      case KC_MINS:
      case KC_UNDS:
      case KC_BSPC:
      case KC_A ... KC_Z:
        break;

      case SM_CAPS:
        // Pressing SM_CAPS while Smart Caps is enabled will toggle
        // it off. See below in process_record_smart_caps.
        break;

      default:
        if (record->event.pressed) {
          disable_smart_caps();
        }
        break;
    }
  }
}

bool process_record_smart_caps(uint16_t keycode, keyrecord_t *record) {
  process_smart_caps(keycode, record);

  if (keycode == SM_CAPS && record->event.pressed) {
    if (is_smart_caps_active) {
      disable_smart_caps();
      return false;
    } else {
      enable_smart_caps();
      return false;
    }
  }

  return true;
}
