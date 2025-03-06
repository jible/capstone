shader_type canvas_item;

void vertex() {
	const float SPEED = 4.5;
	// Called for every vertex the material is visible on.
	VERTEX += vec2(sin(TIME*SPEED) * VERTEX.y, cos(TIME * SPEED) * VERTEX.x);
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
