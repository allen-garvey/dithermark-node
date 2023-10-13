precision mediump float;

varying vec2 v_texcoord;
uniform sampler2D u_texture;
uniform float u_saturation;

// from: https://stackoverflow.com/questions/15095909/from-rgb-to-hsv-in-opengl-glsl
// and http://lolengine.net/blog/2013/07/27/rgb-to-hsv-in-glsl
vec3 rgb2hsv(vec3 c){
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = c.g < c.b ? vec4(c.bg, K.wz) : vec4(c.gb, K.xy);
    vec4 q = c.r < p.x ? vec4(p.xyw, c.r) : vec4(c.r, p.yzx);

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c){
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main(){
    vec4 pixel = texture2D(u_texture, v_texcoord);

    vec3 hsvPixel = rgb2hsv(pixel.rgb);
    vec3 adjustedPixel = hsv2rgb(vec3(hsvPixel.r, hsvPixel.g * u_saturation, hsvPixel.b));

    gl_FragColor = vec4(adjustedPixel, pixel.a);
}