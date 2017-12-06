#include "colors.inc"
  camera {
    location <0, 1, -10>
    look_at 0
    angle 35
  }
  light_source { <500,500,-1000> White }
  plane {
  	//y,0
  	//pigment{
  		//image_map {png "matrix-theme.png"}}
    y,0
    //pigment { checker Green White }
    pigment { Black}
  }
  
// The text: ------------------------
text { ttf "timrom.ttf", "Matrix Ray-Loaded", 0.2 , 0
       //texture{ pigment{ color rgb<1,0.65,0>}
       texture{ pigment{image_map {png "matrix-theme.png" map_type 0}}
                //normal { bumps 0.5 scale 0.005}
                //finish { diffuse 0.8 specular 1}
              } // end of texture
       scale<1,1.8,1>*0.75
       translate<-1.30 ,0.50, -0.0 >
       rotate<0,-360*(clock+0.00),0>
     } // end of text object --------
