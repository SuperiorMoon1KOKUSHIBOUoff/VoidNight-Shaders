#version 120
uniform sampler2D colortex0;
uniform sampler2D depthtex0;
uniform vec3 sunPosition;
uniform float viewWidth;
uniform float viewHeight;
uniform float frameTimeCounter;
uniform int worldTime;

varying vec2 texcoord;

float hash12(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

void main() {
    vec3 scene = texture2D(colortex0, texcoord).rgb;
    float depth = texture2D(depthtex0, texcoord).r;
    vec3 fogColor = vec3(0.06, 0.08, 0.12);

    float skyMask = step(0.999, depth);
    float fogAmount = smoothstep(0.15, 1.0, length(texcoord - 0.5));
    fogAmount *= 0.65;
    scene = mix(scene, fogColor, fogAmount * skyMask * 0.6);

    float rain = 0.0;
    if (worldTime > 13000 && worldTime < 23000) {
        rain = 0.4;
    }

    vec2 lightPos = sunPosition.xy * 0.5 + 0.5;
    vec2 delta = (lightPos - texcoord);
    float glow = max(0.0, 1.0 - length(delta) * 2.5) * 0.18 * (1.0 - rain * 0.3);
    scene += vec3(0.10, 0.12, 0.18) * glow;

    gl_FragColor = vec4(scene, 1.0);
}
