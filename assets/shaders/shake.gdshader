shader_type canvas_item;
const float SPEED = 100.;
const float OFFSET = 15.;
void vertex() {
	float SHAKE = sin(TIME*SPEED) * OFFSET;
	VERTEX.y += SHAKE;
}

void fragment() {
	// Called for every pixel the material is visible on.
}
