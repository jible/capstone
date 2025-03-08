shader_type canvas_item;

// Accreditation
// For how to use matrices to simulate a color channel shader.
// https://forum.godotengine.org/t/color-blindness-simulator-shader/49890

// For the exact values to multiply by I used the article mentioned in class
// https://www.alanzucconi.com/2015/12/16/color-blindness/

// For how to reference the texture of the sprite, I asked ChatGPT what the syntax was in this conversation, and realized my bug was from misspelling,
	// even though I asked it to double check my code and it gave me a bad answer.
// https://chatgpt.com/share/67b64948-f420-800b-ab42-30456f4a946b
// Additional information about tactics to apply this to the whole screen were derived later in the conversation, new link:

// Additional conversation determining what it means to make a high contrast filter, and a potential strategy that I used the math as a starting point for
// https://chatgpt.com/share/67bf8748-4fd0-800b-ba75-3d3d62678d57
const mat4 grayscale = mat4(
	vec4(0.5,0.5,0.5,0.0),
	vec4(0.5,0.5,0.5,0.0),
	vec4(0.5,0.5,0.5,0.0),
	vec4(0.0,0.0,0.0,1.0)
);
void vertex() {
	// Called for every vertex the material is visible on.
}
const float contrast = 1.15;
uniform sampler2D SCREEN_TEXTURE :hint_screen_texture, filter_linear_mipmap;
void fragment() {
	// Pull image texture
	vec4 source = texture(SCREEN_TEXTURE,SCREEN_UV);
	// Make grayscale
	source *= grayscale;
	// Create a contrast version by making points shy away from the center
	vec3 high_contrast = (source.rgb - 0.5) * contrast + 0.5;
	// Clamp the values
	source = clamp(vec4(high_contrast, source.a), 0.0, 1.0);
	COLOR = source;
}
