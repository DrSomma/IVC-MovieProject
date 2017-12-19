                                           // PoVRay 3.7 Scene File " ... .pov"
// author:  Marvin
// date:    17.12.2017
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
//Raum von drinnen
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 110      // front view
                            location  <15.0 , 10.0 ,20.0>
                            //right     x*image_width/image_height
                            look_at   <15.0 , 10.0 , 40.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}   
// Fenster von unten
#declare Camera_4 = camera {/*ultra_wide_angle*/ angle 110      // front view
                            location  <15.0 , 10.0 ,20.0>
                            //right     x*image_width/image_height
                            look_at   <15.0 , 60.0 , 40.0>}
// Fesnter von auﬂen                            
#declare Camera_Modelling = camera {angle 90
                                    location <15, 60, 20>
                                    look_at   <15.0 , 20.0 , 20.0>}
camera{Camera_0}
// sun ---------------------------------------------------------------------
//light_source{<1500,2500,-2500> color White}

// sky -------------------------------------------------------------- 
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.50 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.70 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                        scale<1,1,1.5>*2.5  translate< 0,0,0>
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000}
       
// ground
//plane { <0,1,0>, 4 texture { pigment { color Green} }}

// fog on the ground -------------------------------------------------    
fog { fog_type   2
      distance   50
      color      White  
      fog_offset 0.1
      fog_alt    1.5
      turbulence 1.8
    }         
      
// DECLARATIONS & MACROS

// Make a Box with (Position, Width, Height, Depth)

#macro createBox (Position, Width, Height, Depth, Texture)
box { <0,0,0>, <Width, Height, Depth>
    texture { pigment { color rgb<0.83, 0.83, 0.83> }
    finish { phong 1.0}
    }   
    translate Position
}
#end 
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
 
// Raum       
difference {
box { <0,0,0>, <30, 25, 40> }     
box { <0,0,0>, <29, 24, 39> translate <0.5,0.5,0.5>}
box { <0, 0, 0>, <5, 5, 5> translate <12.5, 23.5, 17.5>} 
//texture { pigment { color rgb<0.83, 0.83, 0.83> }  
texture { uv_mapping pigment { image_map { png "beton_texture.png"
                    map_type 0
                    interpolate 4 once} 
                    scale <30, 25, 40>} 
 }                                      

} 

// Area_Light im Raum      
light_source{ <0,0,0>
              color rgb<0.2,0.2,0.2>
              area_light
              <0.5, 0.5, 0.5> <29.5, 24.5, 39.5>
              1,10 // numbers in directions
              adaptive 1  // 0,1,2,3...
              jitter // random softening
              translate<10, 10, 0>
             }  

// Licht vom Fenster
light_source{ <0,0,0> color rgb <0.4,0.4,0.4>   
              spotlight
              point_at<0,-1,0>
              radius 1  // hotspot
              tightness 1
              falloff 30
              translate< 15, 25, 20>
            }
      
      
// Hier kommt dann der Fernseher rein
box { <0,0,0>, <4, 2.25,0.5> translate <13, 1, 37.75>}
// Licht vom Fernseher
light_source{ <0,0,0> color rgb <1,1,1>   
              spotlight
              point_at<0,-1,-1>
              radius 1  // hotspot
              tightness 1
              falloff 50
              translate< 15, 2.125, 37.5>
            }    
            


                           

// Licht im Raum

//light_source{<15, 24, 20> color White}








