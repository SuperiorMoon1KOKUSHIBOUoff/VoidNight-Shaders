#version 120
varying vec2 texcoord;
varying vec2 lightcoord;
varying vec4 vColor;
varying vec3 vNormal;
varying vec3 vWorld;
varying vec3 vViewPos;

uniform sampler2D texture;
uniform sampler2D lightmap;
uniform vec3 shadowLightPosition;

void main() {
    vec4 albedo = texture2D(texture, texcoord) * vColor;
    vec3 light = texture2D(lightmap, lightcoord).rgb;
    vec3 normal = normalize(vNormal);
    vec3 lightDir = normalize(shadowLightPosition);
    float diffuse = max(dot(normal, lightDir), 0.0);

    vec3 base = albedo.rgb * light;
    vec3 shadowTint = vec3(0.18, 0.14, 0.18);
    base *= mix(vec3(1.0), shadowTint, 0.4 * (1.0 - diffuse));

    base += vec3(0.18, 0.15, 0.12) * max(0.0, diffuse) * 0.22;
    gl_FragColor = vec4(base, albedo.a);
}
