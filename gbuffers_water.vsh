#version 120
varying vec2 texcoord;
varying vec2 lightcoord;
varying vec4 vColor;
varying vec3 vNormal;
varying vec3 vWorld;
varying vec3 vViewPos;

uniform mat4 gbufferModelViewInverse;
uniform mat4 shadowModelView;
uniform mat4 shadowProjection;

void main() {
    vec4 viewPos = gl_ModelViewMatrix * gl_Vertex;
    vec4 worldPos = gbufferModelViewInverse * viewPos;
    vec4 shadowClip = shadowProjection * shadowModelView * worldPos;

    gl_Position = gl_ProjectionMatrix * viewPos;
    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).st;
    lightcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).st;
    vColor = gl_Color;
    vNormal = normalize(gl_NormalMatrix * gl_Normal);
    vWorld = worldPos.xyz;
    vViewPos = viewPos.xyz;

    vec3 shadowNdc = shadowClip.xyz / max(abs(shadowClip.w), 0.0001);
    shadowNdc = shadowNdc * 0.5 + 0.5;
}
