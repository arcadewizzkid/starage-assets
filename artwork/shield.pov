// Persistence Of Vision raytracer version 3.5 sample file.
// File by Alexander Enzmann
//
// -w320 -h240
// -w800 -h600 +a0.3

global_settings { assumed_gamma 2.2 }


#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "glass.inc"

camera {
    location <0.0, .5, -4.>
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

//light_source { <0, 0, 0> Red}

        

#include "wizzpov.h"

/*
object { 
    Future_Sky 
    translate <0, 2, 4>
}
*/

#declare R = 1;

#declare PowerSphere = object {
        sphere {<0, 0, 0> 1.4}
        //material {Col_Glass_Bluish}    
        //texture {T_Green_Glass}
        
        
        texture {
        pigment { color rgbf <0.1, 0.7, 0.8, 0.5> }
        finish {
            ambient 0.4
            diffuse 0.4
            reflection 0.1
            specular 0.8
            roughness 0.04
            phong 1
            phong_size 400
           }
        }
        no_shadow 
}

union { 
   object {PowerSphere}
       
   // animation
   //rotate -90*y
   Axis_Rotate_Trans(<0, 1, 0>, -90*clock)
          
   // view angle
   rotate -45*x
}


