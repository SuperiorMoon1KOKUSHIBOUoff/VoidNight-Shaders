#define VERSION "1.0"

// ============================================================
// VoidNight - Horror Atmosphere Shader for Minecraft 1.8.9
// ============================================================

// ATMOSPHERE & FOG
#define VOLUMETRIC_FOG 1                    // Volumetric fog [0 1]
#define FOG_DENSITY 0.35                    // Fog density [0.1 0.2 0.35 0.5 0.7 1.0]
#define FOG_COLOR_R 0.05                    // Fog color R [0.0 0.05 0.1 0.2]
#define FOG_COLOR_G 0.08                    // Fog color G [0.0 0.08 0.15 0.25]
#define FOG_COLOR_B 0.12                    // Fog color B [0.0 0.12 0.20 0.35]

// LIGHTING
#define ENABLE_SHADOWS 1                    // Enable shadows [0 1]
#define SHADOW_DENSITY 0.7                  // Shadow density [0.3 0.5 0.7 0.9]
#define SHADOW_SOFTNESS 1.5                 // Shadow softness [0.5 1.0 1.5 2.0 3.0]
#define SUN_BRIGHTNESS 1.0                  // Sun brightness [0.5 0.75 1.0 1.25 1.5]

// WATER
#define WATER_WAVES 1                       // Water waves [0 1]
#define WAVE_HEIGHT 0.08                    // Wave height [0.02 0.05 0.08 0.12 0.15]
#define WAVE_SPEED 0.6                      // Wave speed [0.2 0.4 0.6 0.8 1.0]
#define WATER_REFRACTION 1                  // Water refraction [0 1]
#define WATER_REFLECTION_QUALITY 128        // Reflection quality [64 96 128 192 256]
#define WATER_TRANSPARENCY 0.65             // Water transparency [0.3 0.5 0.65 0.8 1.0]

// RAIN REFLECTIONS
#define RAIN_REFLECTIONS 1                  // Ground reflections in rain [0 1]
#define RAIN_REFLECTION_STRENGTH 0.8        // Reflection strength [0.3 0.5 0.8 1.0]

// GLASS
#define GLASS_REFRACTION 1                  // Glass refraction [0 1]
#define GLASS_TRANSMISSION 1                // Light transmission through glass [0 1]
#define GLASS_REFLECTION_STRENGTH 1.2       // Glass reflection strength [0.5 0.8 1.0 1.2 1.5]

// POST PROCESSING
#define BLOOM 1                             // Bloom effect [0 1]
#define BLOOM_STRENGTH 0.18                 // Bloom strength [0.05 0.10 0.18 0.25 0.35]
#define SATURATION 0.85                     // Saturation [0.5 0.7 0.85 1.0 1.2]
#define CONTRAST 1.05                       // Contrast [0.9 0.95 1.05 1.1 1.2]
#define BRIGHTNESS 0.0                      // Brightness [-0.2 -0.1 0.0 0.1 0.2]

// MOTION BLUR
#define MOTION_BLUR 0                       // Motion blur [0 1]
#define MOTION_BLUR_STRENGTH 0.04           // Motion blur strength [0.02 0.04 0.08 0.12]

// GRAIN
#define GRAIN 1                             // Film grain [0 1]
#define GRAIN_STRENGTH 0.04                 // Grain strength [0.01 0.02 0.04 0.08]

// COLOR GRADING
#define RED_TINT_STRENGTH 0.0               // Red tint (nether) [0.0 0.2 0.4 0.6]
#define NIGHT_DARKNESS 0.4                  // Night darkness [0.2 0.3 0.4 0.5 0.6]

// SHADOWS
const float sunPathRotation = -45.0;        // Sun angle [-90.0 -45.0 0.0 45.0 90.0]
const float shadowDistance = 128.0;         // Shadow distance [64.0 96.0 128.0 160.0 256.0]
const int shadowMapResolution = 1024;       // Shadow resolution [512 1024 2048 4096]

// COMPATIBILITY
#define GLSL_VERSION 120                    // GLSL 1.20 for 1.8.9
