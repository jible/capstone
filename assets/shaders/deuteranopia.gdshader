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

const mat4 deuteranopia = mat4(
	vec4(0.625,0.375,0.0,0.0),
	vec4(0.7,0.3,0.0,0.0),
	vec4(0.0,0.3,0.7,0.0),
	vec4(0.0,0.0,0.0,1.0)
);
uniform sampler2D SCREEN_TEXTURE :hint_screen_texture, filter_linear_mipmap;

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 source = texture(SCREEN_TEXTURE,SCREEN_UV);
	COLOR = source * deuteranopia;
}

