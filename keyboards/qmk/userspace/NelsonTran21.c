#include "NelsonTran21.h"

__attribute__ ((weak))
bool process_record_user(uint16_t keycode, keyrecord_t *record) {
	return
		process_record_anti_afk(keycode, record) &&
		process_record_smart_caps(keycode, record);
}

__attribute__ ((weak))
void matrix_scan_user(void) {
	matrix_scan_anti_afk();
}
