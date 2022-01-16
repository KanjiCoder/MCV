#version 450

//: -------------------------------------------------------- ://
//: How to compile:                                          ://
//: $ ./glslangValidator.exe MCV.vert.glsl                   ://
//:         -S vert                                          ://
//:         --target-env vulkan1.2                           ://
//:         -o mcv.vert.spv                                  ://
//:                                                          ://
//: Formatted for readability. Command should all be on      ://
//: one line when given to console.                          ://
//: -------------------------------------------------------- ://
//:                                                          ://
//: Got Help From Vulkan Discord:                            ://
//:                                                          ://
//: Rodrigo#1643 :                                           ://
//:                                                          ://
//: gl_VertexIndex is gl_VertexID                            ://
//: gl_BaseVertex in other words,gl_VertexID                 ://
//: does not include the base vertex,which was               ://
//: confusing for some people,specially because              ://
//: D3D always included the base vertex                      ://
//:                                                          ://
//:                                                          ://
//:                                                          ://
//: Implodee#0345 :                                          ://
//:                                                          ://
//: In Vulkan dialect glsl there's no gl_VertexID            ://
//: and gl_InstanceID they are replaced by                   ://
//: gl_VertexIndex and gl_InstanceIndex as seen here         ://
//: SC[ IMPLODE_GL_VERTEX_INDEX_SEEN_HERE_PDF ]              ://
//: SC[ IMPLODE_GL_VERTEX_INDEX_SEEN_HERE_TXT ]              ://
//: https://raw.githubusercontent.com/KhronosGroup/GLSL      ://
//:       /master/extensions/khr/GL_KHR_vulkan_glsl.txt      ://
//:                                                          ://
//:                                                          ://
//: Me :                                                     ://
//:                                                          ://
//: $ ./glslangValidator MCV.vert.glsl -S vert               ://
//: MCV.vert.glsl                                            ://
//: ERROR: 0:45: 'gl_InstanceIndex' : undeclared identifier  ://
//: ERROR: 0:45: '[]' : scalar integer expression required   ://
//: ERROR: 0:45: '' : compilation terminated                 ://
//: ERROR: 3 compilation errors.  No code generated.         ://
//:                                                          ://
//:                                                          ://
//: Implodee#0345 :                                          ://
//:                                                          ://
//: call it with --target-env vulkan1.2                      ://
//: (or your used vulkan version rather)                     ://
//: see if that works                                        ://
//:                                                          ://
//:                                                          ://
//: #define V_I ( gl_VertexID    + gl_BaseVertex )    //:WRONG 
//: #define V_I ( gl_VertexIndex + gl_InstanceIndex ) //:1.2
//: -------------------------------------------------------- ://

#define V_I gl_VertexIndex
 
layout( location = 0 ) out vec3 fragColor ;

vec2 positions[3] = vec2[](
    vec2( 0.0 , -0.5 )
,   vec2( 0.5 ,  0.5 )
,   vec2(-0.5 ,  0.5 )
);

vec3 colors[3] = vec3[](
    vec3( 1.0 , 0.0 , 0.0 )
,   vec3( 0.0 , 1.0 , 0.0 )
,   vec3( 0.0 , 0.0 , 1.0 )
);

void main(){
    gl_Position = vec4( 
        positions[ V_I ]   //: XY ://
    ,   0.0                //: Z  ://
    ,   1.0                //: W  ://
    );;
    fragColor = colors[ V_I ];
}

#undef  V_I