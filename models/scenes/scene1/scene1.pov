#include "colors.inc"

#declare initial_camera_pos=4;
    
  camera {
    location <0, 1, -10>
    
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
    
    angle 35
  }

  light_source { <500,500,-1000> White }
  plane {
    y,0
    pigment { checker Black White}
  }