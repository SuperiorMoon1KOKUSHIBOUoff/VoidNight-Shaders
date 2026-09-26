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

    vec3 color = albedo.rgb * light;
    color *= 0.9 + diffuse * 0.7;
    color = mix(color, vec3(0.05, 0.05, 0.08), 0.15);
    gl_FragColor = vec4(color, albedo.a);
}
