#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265358979323846

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float random(in vec2 _st){
    return fract(sin(dot(_st.xy,
                vec2(12.9898,78.233)))*
            43758.5453123);
        }
        
vec2 truchetPattern(in vec2 _st,in float _index){
    _index=fract(((_index-.5)*2.));
    if(_index>.75){
        _st=vec2(1.)-_st;
    }else if(_index>.5){
        _st=vec2(1.-_st.x,_st.y);
    }else if(_index>.25){
        _st=1.-vec2(1.-_st.x,_st.y);
    }
    return _st;
}

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    st*=10.;
    st=(st-vec2(5.))*(abs(sin(u_time*.1))*4.);
    // st.x += u_time*3.0;
    
    vec2 ipos=floor(st);// integer
    vec2 fpos=fract(st);// fraction
    
    vec2 tile=truchetPattern(fpos,random(ipos));
    
    float color=0.;
    
    // Maze
    color=smoothstep(tile.x-.03,tile.x,tile.y)-
    smoothstep(tile.x,tile.x+.03,tile.y);
    
    // Circles
    // color = (step(length(tile),0.6) -
    //          step(length(tile),0.4) ) +
    //         (step(length(tile-vec2(1.)),0.6) -
    //          step(length(tile-vec2(1.)),0.4) );
    
    // Truchet (2 triangles)
    // color = step(tile.x,tile.y);
    
    gl_FragColor=vec4(vec3(color),1.);
}
