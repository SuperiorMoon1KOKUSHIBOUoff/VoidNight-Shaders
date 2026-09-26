#version 120
uniform sampler2D texture;
uniform sampler2D lightmap;
uniform vec3 shadowLightPosition;

varying vec2 texcoord;
varying vec2 lightcoord;
varying vec4 vColor;
varying vec3 vNormal;
varying vec3 vWorld;
varying vec3 vViewPos;

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

void main() {
    vec4 albedo = texture2D(texture, texcoord) * vColor;
    vec3 light = texture2D(lightmap, lightcoord).rgb;
    vec3 normal = normalize(vNormal);
    vec3 lightDir = normalize(shadowLightPosition);
    vec3 viewDir = normalize(-vViewPos);

    float fresnel = pow(1.0 - max(dot(normal, viewDir), 0.0), 2.2);
    float diffuse = max(dot(normal, lightDir), 0.0);

    float wave = sin(vWorld.x * 0.32 + vWorld.z * 0.28 + 0.75 * gl_FragCoord.x * 0.01) * 0.08;
    wave += sin(vWorld.z * 0.23 - vWorld.x * 0.18 + 0.85 * gl_FragCoord.y * 0.01) * 0.06;

    vec3 waterTint = mix(vec3(0.06, 0.17, 0.24), vec3(0.06, 0.27, 0.32), fresnel);
    vec3 result = waterTint * (light * 0.8 + diffuse * 0.7);
    result += vec3(0.26, 0.48, 0.60) * fresnel * 0.55;

    float alpha = 0.7 + fresnel * 0.25;
    gl_FragColor = vec4(clamp(result, 0.0, 1.0), alpha);
}
