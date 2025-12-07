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
    location <0.0, 0.0, -4>
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

object { 
    Future_Sky 
    translate <0, 3.1, 5>
}

#declare Wing = 
union { 
    object {
       Connect_Spheres(<-1, 0, 0>, .4, <1.3, 0, 0>, .05)  
       }
   sphere {<-1, 0, 0>, .4} 
   sphere{ <1.3, 0, 0>, .05}
}

#declare Wing_Scale = 2.5;

union { 
    // big wing
    object {
       Wing
       scale <1,.5,Wing_Scale> 
    }   
    
    // left wing
    object {
       Wing
       scale <1.2,.7,Wing_Scale> 
       scale .5 
       rotate x*90   
       translate <-.1, 0, .8>
    }       
    
    // right wing
    object {
       Wing
       scale <1.2,.7,Wing_Scale> 
       scale .5 
       rotate x*90
       translate <-.1, 0, -.8>
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
   rotate -60*x
}    