// webgl requires that the first line of the fragment shader specify the precision
// precision is dependent on device, but higher precision variables have more zeros
// sometimes you'll see bugs if you use lowp so stick to mediump or highp
#ifdef GL_ES
precision mediump float;
#endif

// the fragment shader has one main function too
// this is kinda of like the draw() function in p5
// main outputs a variable called gl_FragColor which will contain all the colors of our shader
// the word void means that the function doesn't return a value
// this function is always called main()

  // lets just send the color red out
  // colors in shaders go from 0.0 to 1.0
  // glsl is very finicky about the decimal points 
  // gl_FragColor is a vec4 and is expecting red, green, blue, alpha
  // the line below will make a solid red color for every pixel, with full alpha
  //vec4 redColor = vec4(1.0, 0.0, 0.0, 1.0);
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);

    vec2 pos = vec2(0.5)-st;

    float r2 = length(pos*10.0)*0.3;
    float r = length(pos)*2.0;
    float a = atan(pos.y,pos.x)+u_time*1.0;

    float f = cos(a*3.);
     f = abs(cos(a*3.));
     f = abs(cos(a*2.5))*.5+.3;
     f = abs(cos(a*sin(u_time*0.013))-sin(a*12.))*.38+.1;
     f /= smoothstep(-.1,1., cos(a*10.))*abs(0.5*sin(u_time*0.1))+0.85;

    color.rgb = vec3( 1.-smoothstep(f,f+0.02,r) );
    color.b *= 0.8;
    color.g *= smoothstep(0.5,r2*.0,r2*0.5);

    gl_FragColor = vec4(color, 1.0);
}
  // assign redColor to be output to the screen


  // how would you make a solid green screen?
  // yellow?
  // gray?
