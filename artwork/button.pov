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


#declare Wing = 
union { 
    object {
       Connect_Spheres(<-1, 0, 0>, .4, <1.3, 0, 0>, .05)  
       }
   sphere {<-1, 0, 0>, .4} 
   sphere{ <1.3, 0, 0>, .05}
}

#declare Wing_Scale = 2.5;

#declare button = 
union { 
    // big wing
    object {
       Wing
       scale <1,.5,Wing_Scale> 
    }   
    
    // cockpit
    object {
       Wing
       scale <1.2,3,2.5> 
       scale .5 
       rotate x*90
       translate <-.4, 0, 0>
    }
    
   texture {Future_Chrome}          
   no_shadow 
   
   // animation
   rotate -90*y
   rotate -360*clock*y 
          
   // view angle
   rotate -80*x
}
       
object {
   button
   translate <0, 0.0, 0>
}

object { 
    Future_Sky 
    translate <0, 0, 5>
}       