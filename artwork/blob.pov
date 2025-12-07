// Persistence Of Vision raytracer version 3.5 sample file.
// File by Alexander Enzmann
//
// -w320 -h240
// -w800 -h600 +a0.3

global_settings { assumed_gamma 2.2 }


#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

camera {
    location <0.0, 0.0, -3.8>
    direction z*1.3
//    right 4/3*x
    right x
    up y
    look_at <0.0, -0.0, 0.00>
}


 
//light_source { <4, 3, 2 > color White }
//light_source { <1, -4, 4> color White }
//light_source { <-3, 1, 5> color White } 
 
light_source { <-60.00, 20.00, -5.00> White}
light_source { <60.00, -20.00, -5.00> color Gray50 }
//light_source { <20.00, 10.00, -0.00> color Gray20 }
//light_source { <-20.00, -10.00, -5.00> color Gray60 }


        

#include "wizzpov.h"

blob {
   threshold 0.6
   sphere {<0.45, 0.1, -0.2>, 1.3 1.0 
        Axis_Rotate_Trans(<.5, 1, 0>, 360*clock)
        }
   sphere {<-0.575, 0.6952, 0> 0.75 1.3 
        Axis_Rotate_Trans(<-1, 0, -1>, -360*clock)
        }
   sphere {<-0.475, -0.6652, 0> 1.1 1.0 
        Axis_Rotate_Trans(<-1, 1, 2>, 360*clock)
        }
      
   /*
   pigment { color red 1 green 0 blue 0 }
   finish {
      ambient 0.3
      diffuse 0.8
      phong 1  
      Glass3
   } 
   */
        
   texture {Future_Chrome}
             
   no_shadow
   rotate 30*y
   scale <1,1,1>
}

/*
box { 
    <-1, -1, -1>, <1, 1, 1>
    texture { Sunset }  
    scale 100
}
*/

                   
/*
plane {
    -z,6 
    no_shadow
    texture { Future_Sunset }
}
*/
                  
object { 
    Future_Sky 
    translate <0, 0, 5>
}
           