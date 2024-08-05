shader_type canvas_item;

uniform sampler2D texture : hint_albedo;
uniform float time : hint_range(0.0, 10.0) = 0.0; // Per controllare la velocitC  dell'animazione dell'onda
uniform vec4 water_color : hint_color = vec4(0.0, 0.0, 0.3, 1.0); // Colore blu scuro dell'acqua

varying vec2 uv;

void fragment() {
    // Calcolo del movimento dell'onda basato su tempo e coordinate UV
    float wave = sin(uv.y * 10.0 + time * 2.0) * 0.05;
    vec2 uv_offset = uv + vec2(0.0, wave);

    // Ottieni il colore dalla texture e applica l'offset UV
    vec4 texture_color = texture(texture, uv_offset);

    // Mescola il colore dell'acqua con il colore della texture
    vec4 color = mix(water_color, texture_color, texture_color.a);
    
    // Imposta il colore del frammento
    COLOR = color;
}
