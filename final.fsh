#version 120
uniform sampler2D colortex0;
uniform float viewWidth;
uniform float viewHeight;
uniform float frameTimeCounter;

varying vec2 texcoord;

float rand(vec2 co) {
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

vec3 toneMap(vec3 c) {
    c = max(c, vec3(0.0));
    c = c / (1.0 + c);
    return clamp(c, 0.0, 1.0);
}

void main() {
    vec3 color = texture2D(colortex0, texcoord).rgb;

    float luminance = dot(color, vec3(0.299, 0.587, 0.114));
    vec3 grayscale = vec3(luminance);
    color = mix(grayscale, color, 1.05);

    color *= 1.03;
    color = toneMap(color);

    vec2 centered = texcoord - 0.5;
    float vignette = 1.0 - dot(centered, centered) * 0.8;
    color *= max(vignette, 0.2);

    float grain = (rand(texcoord * vec2(viewWidth, viewHeight) + frameTimeCounter) - 0.5) * 0.04;
    color += grain;

    gl_FragColor = vec4(clamp(color, 0.0, 1.0), 1.0);
}
