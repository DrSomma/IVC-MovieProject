// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
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
#include "neo.pov"      

#declare Schiff_Geschwindigkeit = 5 ;
#declare Wasser_Geschwindigkeit = 4 ;
#declare Nebel_Geschwindigkeit = 0.2 ;

//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <5.0 , 4.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>} 
// 4. Kamera 2 für die Sicht der Fahrt
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <4.0 , 1.5 ,5.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 8.0>} 
// 1. Kamera 1 für die Sicht der Fahrt
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <20.0 , 5.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
// 2, Kamera 1 für die Sicht von oben
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <3 , 50.0-clock*25 ,-15+clock*5>
                            right     x*image_width/image_height
                            look_at   <3 , 1.0 , -10.0+clock*20>} 
// 5. Kamera 2 für die Sicht am Bug  
#declare Camera_4 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 5.0 ,5>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 10.0>}
// 3. Kamera 1 für die Sicht am Bug  
#declare Camera_5 = camera {/*ultra_wide_angle*/ angle 70        // top view
                            location  <1 , 2.0 , 11>
                            right     x*image_width/image_height
                            look_at   <0.0 , 2.0 , 8.0>} 
// Kamera von oben
#declare Camera_10 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <4.0 , 40, -3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>} 
camera{Camera_5}                           
// Camera 2
// Camera 3
// sun ---------------------------------------------------------------------
light_source{<1500,2500,-2500> color Grey}
// sky ---------------------------------------------------------------------
light_source{ <-1000, 800, 3000> 
              color White
              looks_like{ sphere{ <0,0,0>, 200 
                                  texture{ pigment{ color White*0.9 }
                                           normal { bumps 1.5
                                                    scale 20    }
                                           finish { ambient 0.8   
                                                    diffuse 0.2
                                                    phong 1     }
                                                  
                                         } // end of texture
                                } // end of sphere
                        } //end of looks_like
            } //end of light_source
// sky --------------------------------------------------------------------
  // the dark blue
plane{ <0,1,0>,1 hollow  
       texture{ pigment { color rgb <0.20, 0.20, 1.0> }
                finish  { ambient 0.25 diffuse 0 } 
              }      
       scale 10000}
  // the clouds 
plane{ <0,1,0>,1 hollow  
       texture{pigment{ bozo turbulence 0.76
                        color_map { [0.5  rgbf<1.0,1.0,1.0,1.0> ]
                                    [0.6  rgb <1.0,1.0,1.0>     ]
                                    [0.65 rgb <1.5,1.5,1.5>     ]
                                    [1.0  rgb <0.5,0.5,0.5>     ] }
                       }
               finish { ambient 0.25 diffuse 0} 
              }      
       scale 500}

// fog ---------------------------------------------------------------------

fog{ fog_type   2
     distance   50
     color      White
     fog_offset 0.1
     fog_alt    2.0
     turbulence 0.8+0.6*clock*Nebel_Geschwindigkeit
   }
// ground ------------------------------------------------------------------

// sea ---------------------------------------------------------------------

plane{ <0,1,0>, 0 
       texture{ Polished_Chrome
                normal { crackle 0.15 scale <0.35,0.25,0.25> turbulence 0.5 } 
                finish { reflection 0.60}
              }
              translate <0,0,-Wasser_Geschwindigkeit*clock>
     }
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
   
   
                                                                                 
// Titanik   
object {  union {                                                                   

#declare Schiffsform = union { 
// Vorne
prism{ 0.00, 2.00, 4
   <-1.00, 0.00>,
   < 1.00, 0.00>,
   < 0.00, 4.00>,
   <-1.00, 0.00>
}
// Mitte  
box { <0,0,0>,<2,2,6>
      translate <-1,0,-6>
     }


// Hinten
prism{ 0.00, 2.00, 4
   <-1.00, 0.00>,
   < 1.00, 0.00>,
   < 0.00, 4.00>,
   <-1.00, 0.00>   
     rotate <0,180,0>
     translate <0,0,-6>  
}  
scale <2,1,2>
}  // Ende Schiffsform 

object { Schiffsform   texture{
    pigment{color Black} 
    finish {ambient 0.15
            diffuse 0.85}
     } }
object { Schiffsform scale <1.001,0.2,1.001>   texture{
    pigment{color Red}
    finish {ambient 0.15
            diffuse 0.85}
     }  translate <0,0,0>}
       
// Reling  
difference {
object { Schiffsform }
object { Schiffsform scale <0.95,1.1,0.95> translate <0, -0.05, 0>}  
texture {pigment { color White } } scale <1,0.1,1> translate <0,2,0>   
}      
 
// Mast 
#declare Mast = union {
cylinder { <0, 0, 0>, <0, 6, 0>, 0.5   
    texture {
        pigment{color White}
    }
}
cylinder { <0,6,0>, <0,7,0>, 0.5 
    texture {
        pigment{color Black}
    } 
    } 
}

object { Mast translate <0,0,-4>}    
object { Mast translate <0,0,-6>}
object { Mast translate <0,0,-8>}                      
object { Mast translate <0,0,-10>}
    

#declare Stockwerk = union {
box { <0,0,0>, <4,0.25,10>   }  
box { <0,0,0>, <4,0.25,10> translate <0,0.25,0> scale <0.995,1,0.995>} 
translate <-2,2,-11>  texture { pigment { color White } }
} 


// Untere Stockwerk
object {Stockwerk}   

// Mittlere Stockwerk
object {Stockwerk translate <0,0.5,-.5> scale <0,0,0.95>}

// Obere Stockwerk
object {Stockwerk translate <0,1,-1> scale <0,0,0.9>}


}                 
    translate <0,-.01,2> 
    rotate <0,0,0>

}   // Ende Titanik





// Eisberge

#declare HF_Res_X = 1024; // number of points in x
#declare HF_Res_Z = 1024; // number of points in z
#declare SF =
 function {
   pigment {
   spherical
     color_map {
       [0.0, color 0.0 ]
       [0.5, color 0.8 ]
       [1.0, color 1.0 ]
     } // end color_map
    scale <0.5,1,0.5>
    translate<0.5,0,0.5>
   } // end pigment
 } // end function

#declare HF_Function   =
 function(x, y, z)
  {1+f_snoise3d(x*10,y*10,z*10)*0.3 * SF(x,y,z).gray}

#declare HF_Amplitude    = 0.5;
#declare D = 0.00001; // just a little bit!

height_field{
   function  HF_Res_X, HF_Res_Z
   { HF_Function(x,0,y) * HF_Amplitude }
   //smooth
    translate<-0.55,D-0.55 ,-.495>  
    scale <100,100,100> 
    rotate <0,45,0>
    translate<0,0,10>
    translate <0, 0, -20-Schiff_Geschwindigkeit*clock>
    texture { pigment { color White } }
   } // end HF
  

      
      
      
      
      
      
      
      
#ifndef (Left_Foot_Rotate)              #declare Left_Foot_Rotate = <0,0,0>;                                     #end 
#ifndef (Left_Calf_Rotate)              #declare Left_Calf_Rotate = <30,0,0>;                   #end
#ifndef (Left_Quad_Rotate)              #declare Left_Quad_Rotate = <0,0,0>;                   #end
#ifndef (Left_Fore_Arm_Rotate)          #declare Left_Fore_Arm_Rotate = <-10,0,0>;         		 #end
#ifndef (Left_Hand_Rotate)              #declare Left_Hand_Rotate = <0,0,0>; 				                     #end
#ifndef (Left_Upper_Arm_Rotate)         #declare Left_Upper_Arm_Rotate = <5,0,90>; 				 #end
#ifndef (Right_Foot_Rotate)             #declare Right_Foot_Rotate = <28,0,0>;         			 #end
#ifndef (Right_Calf_Rotate)             #declare Right_Calf_Rotate = <50,0,0>;         	     #end
#ifndef (Right_Quad_Rotate)             #declare Right_Quad_Rotate = <0,0,0>;         			 #end
#ifndef (Right_Hand_Rotate)             #declare Right_Hand_Rotate = <0,0,0>; 				                     #end
#ifndef (Right_Fore_Arm_Rotate)         #declare Right_Fore_Arm_Rotate = <15,0,0>;    			 #end
#ifndef (Right_Upper_Arm_Rotate)        #declare Right_Upper_Arm_Rotate = <-15,0,-90>; 			 #end
#ifndef (Cloak_Rotate)                  #declare Cloak_Rotate = <0,0,0>;            		                     #end
#ifndef (Cloak_Translate)               #declare Cloak_Translate = <0,0,0>;            		                     #end
#ifndef (Upper_Body_Rotate)             #declare Upper_Body_Rotate = <0,-5,0>;            		 #end
#ifndef (Head_Rotate)                   #declare Head_Rotate = <0,-5,0>;                    #end
#ifndef (Man_Rotate)                    #declare Man_Rotate = <0,0,0>;                        	                 #end
#ifndef (Man_Scale)                     #declare Man_Scale = <1,1,1>;                                            #end
#ifndef (Man_Translate)                 #declare Man_Translate = <0,0,-5>;              		             #end			       

#if (clock > 0.1 & clock < 0.2)
#declare Upper_Body_Rotate = <-45*sin(clock-0.1)*5,-5,0>;
#else
#declare Upper_Body_Rotate = <0,-5,0> ; 
#end
      
      
// Neo

union { 

      union { // Beine
            union { // linkes Bein
                  union { // linker Unterschenkel
                        object { foot rotate Left_Foot_Rotate translate <0,-3.5,0>}
                        object { calf }
                        rotate Left_Calf_Rotate translate <0,-4.5,0>
                  }
                  object { quad }  // Oberschenkel anfügen
                  rotate Left_Quad_Rotate translate <0.7,0.5,0>
            }
            union { // rechtes Bein
                  union { // rechter Unterrschenkel
                        object { foot rotate Right_Foot_Rotate translate <0,-3.5,0>}
                        object { calf }
                        rotate Right_Calf_Rotate translate <0,-4.5,0>
                  }
                  object { quad } // Oberschenkel anfügen
                  rotate Right_Quad_Rotate translate <-0.7,0.5,0>
            }
      }
      union { object {cloak} rotate Cloak_Rotate translate <0,1,0> translate Cloak_Translate} // Mantel anfügen
      union { // Oberkörper
            object { torso }
            union { // linker Arm
                  union { // linker Unterarm
                        union { // linke Hand
                              object { hand }
                              rotate Left_Hand_Rotate translate <0,-3.1,0>
                        }  
                        object { fore_arm } // Unterarm anfügen
                        rotate Left_Fore_Arm_Rotate translate <0,-2.5,0>
                  }
                  object { upper_arm }
                  rotate Left_Upper_Arm_Rotate translate <2.3,6.5,0>
            }
            union { // rechter Arm
                  union { // rechter Unterarm
                        union { // rechte Hand
                              object { hand }
                              rotate <0,180,0> rotate Right_Hand_Rotate translate <0,-3.1,0> // gespiegelt durch 180°-Drehung
                        } 
                            object { fore_arm } // Oberarm anfügen
                            rotate Right_Fore_Arm_Rotate translate <0,-2.5,0>
                  }
                  object { upper_arm } // Oberarm anfügen
                  rotate Right_Upper_Arm_Rotate translate <-2.3,6.5,0>
            }
            union {
             
                 object { head  }
                 rotate Head_Rotate translate <0,7.7,0>
            }
      rotate Upper_Body_Rotate // Oberarm drehen
      }
      rotate Man_Rotate // Mensch drehen
      scale Man_Scale // Mensch skallieren
      translate Man_Translate // Mensch bewegen
      rotate <0,270,0> scale <0.9,0.9,0.9> 
      rotate <0, -90, 0> 
      translate <0, 40, 145> scale <0.06,0.06,0.06>// Startposition für Tests
      finish {ambient .0 diffuse .0} 
}