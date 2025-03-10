shader_type canvas_item;

const float RAMP_TIME = 1.;
const float DIMMING = 0.5;
const float LOCK_COLOR_HOLD_TIME = 0.15;
void fragment() {
	COLOR = vec4(COLOR.r * DIMMING,COLOR.g*DIMMING, abs(sin(TIME*RAMP_TIME)) +LOCK_COLOR_HOLD_TIME,COLOR.a);
}
