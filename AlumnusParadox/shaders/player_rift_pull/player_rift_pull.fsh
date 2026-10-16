// Color Overlay Fragment Shader
varying vec2 v_vTexcoord;
uniform vec4 u_colour;

uniform float u_mix;
void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = vec4(u_colour.rgb, texColor.a*u_mix);
	
}