global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

camera {
    location <0.0, 0.0, -4>
    direction z*1.3
//    right 4/3*x
    right x
    up y
    look_at <0.0, 0.0, 0.00>
}


 
//light_source { <4, 3, 2 > color White }
//light_source { <1, -4, 4> color White }
//light_source { <-3, 1, 5> color White } 
 
light_source { <-60.00, 20.00, -5.00> White}
light_source { <60.00, -20.00, -5.00> color Gray50 }
//light_source { <20.00, 10.00, -0.00> color Gray20 }
//light_source { <-20.00, -10.00, -5.00> color Gray60 }


/*
sphere { <-20, 0, -10>, 10 texture { pigment { Red }  } }
sphere { <20, 0, -10>, 10 texture { pigment { Green }  } }
sphere { <0, -20, -10>, 10 texture { pigment { Blue }  } }
*/
    
    
#include "wizzpov.h"

#declare Edge = 0.05;
#declare Corner = 0.05;

#declare Panel = union { 
    object {
       superellipsoid {
              <Edge, Corner> // Edge and corner roundness (smaller = sharper)
              rotate <0, 0, 0>
              scale 1 // Size
            }
       }
}

#declare button = 
union { 
    // big wing
    object {
       Panel
       scale <1,1,1> 
    }   
    
   texture {Future_Chrome}          
   no_shadow 
   
   // view angle
   // rotate -80*x
}
       
object {
   button
   translate <0, 0.0, 0>
}

object { 
    Future_Sky 
    rotate -5*x
    translate <0, 0, 5>
}       