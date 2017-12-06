#include "colors.inc"
background{White}
camera {
  angle 20
  location<0,2,-10>
  look_at<0,0,0>
}
light_source { <10, 20, -10> color White }
#declare right_arm = blob {
  threshold .65
  sphere{<.05,.49,-.05>, .26, -1}  //counteract middle knuckle bulge
  sphere{<.05,-.28,0>, .26, -1}    //counteract middle palm bulge
   
  cylinder{<.05,-.28,0>, <.05, .49,-.05>, .26, 1}     //lower middle
  cylinder{<.05,.49,-.05>, <.05, .95,-.2>, .26, 1}    //upper middle

  pigment{ Flesh }
  
}

#declare left_arm = 
blob {
  threshold .65
  sphere{<.05,.49,-.05>, .26, -1}  //counteract middle joint bulge
  sphere{<.05,-.28,0>, .26, -1}    //counteract middle palm bulge
   
   //image map
   
  cylinder{<.05,-.28,0>, <.05, .49,-.05>, .26, 1}     //lower arm
  cylinder{<.05,.49,-.05>, <.05, .95,-.2>, .26, 1}    //upper arm

  pigment{ Flesh }
  
  scale <-1,1,1> //mirroring
}
	
right_arm
//left_arm