#pragma once

// Mod-Tap keys act as modifiers (like CTRL, ALT, and SHIFT) when held
// and as a regular keycode when tapped, which makes it possible to give
// keys a dual-role. In my keyboard configurations, they are used on the
// home row to enable ergonomic access to modifiers. In order to use
// them, some configuration settings need to be enabled:

// Pressing and releasing a key within the TAPPING_TERM (milliseconds)
// is considered to be a tap. Anything longer is considered to be a hold.
#define TAPPING_TERM 200

// One of the default behaviors of Mod-Tap keys is to force the Mod-Tap
// key to act as a modifier if any other key is pressed while the
// Mod-Tap key is held down even if it was done within the TAPPING_TERM.
// This is called a Mod-Tap Interrupt, and while it is useful for quick
// activations of shortcut combos, it makes using home row modifiers an
// unpleasant experience since key presses and releases will naturally
// overlap when typing quickly. IGNORE_MOD_TAP_INTERRUPT changes this
// behavior in a way such that all key presses that interrupt a Mod-Tap
// are ignored.
#define IGNORE_MOD_TAP_INTERRUPT

// Waiting for the TAPPING_TERM to elapse in order activate a modifier
// is painful for fast typists, so PERMISSIVE_HOLD enables a second way
// to activate modifiers. With this option, nested keypresses completed
// within the TAPPING_TERM will activate the modifiers. For example:
//
//   [1] PRESS   <SFT_T(S)>
//   [2] PRESS   <KC_A>
//   [3] RELEASE <KC_A>
//   [4] RELEASE <SFT_T(S)>
//
// If these actions were all completed within the TAPPING_TERM, the
// resulting key presses would be Shift + A.
#define PERMISSIVE_HOLD

// When the user holds a Mod-Tap key after tapping it, the default
// behavior is to auto-repeat the tapped key. However, more often than
// not, the desired behavior that we want is to activate modifier key
// instead of auto-repeating the tapped key.
#define TAPPING_FORCE_HOLD

#define MK_VARIANT MK_TYPE_KINETIC
#define MK_KINETIC_MOUSE_ACCN 6
#define MK_KINETIC_MOUSE_DRAG 24
#define MK_KINETIC_MOUSE_FRIC 16
#define MK_KINETIC_MOUSE_MAXS 255
#define MK_KINETIC_WHEEL_ACCN 20
#define MK_KINETIC_WHEEL_DRAG 32
#define MK_KINETIC_WHEEL_FRIC 32
#define MK_KINETIC_WHEEL_MAXS 1
