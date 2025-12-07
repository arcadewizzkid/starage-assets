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
    location <0.0, 0.0, -4.5>
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
    translate <0, 4, 4>
}

#declare R = 0.1;

#declare BorgCube1 = union {
        box {<-1,-1,-1> <1,1,1>}
        cylinder {<-.5, -1, -1> <-.5, 1, -1> R}
        cylinder {<.5, -1, -1> <.5, 1, -1> R}
        cylinder {<1, -1, -.5> <1, 1, -.5> R}
        cylinder {<1, -1, .5> <1, 1, .5> R}
        cylinder {<-.5, -1, 1> <-.5, 1, 1> R}
        cylinder {<.5, -1, 1> <.5, 1, 1> R}
        cylinder {<-1, -1, -.5> <-1, 1, -.5> R}
        cylinder {<-1, -1, .5> <-1, 1, .5> R}
}

#declare BorgCube2 = union {
        object { BorgCube1 }
        object { BorgCube1 rotate z*90}
        object { BorgCube1 rotate z*90 rotate y*90}
}

#declare BorgCube3 = union {
        object { BorgCube2 }        
}

#declare BorgCubeFinal = union {
        box {<-1,-1,-1> <1,1,1>}
        BorgCube3
}


union { 
   BorgCubeFinal
       
   texture {Future_Chrome}          
   no_shadow 
   
   // animation
   rotate -90*y
   rotate -90*clock*y 
          
   // view angle
   rotate -45*x
}