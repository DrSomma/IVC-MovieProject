#include "colors.inc"

#declare initial_camera_pos=4;
#declare initial_camera_angle=90;
    
  camera {
    location <0, 1, -10>
    rotate < 0 , 0 , 0 >
    
    //#local initial_camera_rot_y=90;
    //#while (initial_camera_rot_y  > 0)
    //	rotate < initial_camera_rot_y , 0 , 0 >
    //#local initial_camera_rot_y = (initial_camera_rot_y - 10);
    //#end
    
    #if (initial_camera_pos = 0)
    	look_at initial_camera_pos
    #else
    	look_at initial_camera_pos - clock
    #end
    
    //#if (initial_camera_angle = 0)
    //rotate < initial_camera_angle - (clock * 10) , 0 , 0 >
    //#else
    //rotate < initial_camera_angle - (clock * 10) , 0 , 0 >
    //#end
    
    angle 35
  }

  light_source { <500,500,-1000> White }
  plane {
    y,0
    pigment { checker Black White}
  }