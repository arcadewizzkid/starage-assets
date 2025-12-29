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
    location <0.0, 0.5, -4.5>
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
    translate <0, 1, 4>
}

#declare W = 1.0;
#declare R = 0.32;
#declare S = 0.01;

#declare MiniCube = union {
        box {<-R,-R,-R> <R,R,R>}
        rotate z*45
}

#declare CubeSide = union {
        object {  MiniCube translate <-W, -W, 0> }
        object {  MiniCube translate <0, -W, 0> }
        object {  MiniCube translate <W, -W, 0> }

        object {  MiniCube translate <-W, 0, 0> }
        object {  MiniCube translate <0, 0, 0> }
        object {  MiniCube translate <W, 0, 0> }

        object {  MiniCube translate <-W, W, 0> }
        object {  MiniCube translate <0, W, 0> }
        object {  MiniCube translate <W, W, 0> }
}

#declare BorgCube2 = union {
        object { CubeSide translate <0, 0, -W> }
        object { CubeSide translate <0, 0, 0> }
        object { CubeSide translate <0, 0, W> }
}

#declare BorgCube3 = union {
        object { BorgCube2 scale 0.70 }        
}

#declare BorgCubeFinal = union {
        BorgCube3
}


union { 
   BorgCubeFinal
       
   texture {Future_Chrome}          
   no_shadow 
   
   // animation
   rotate -90*y
   rotate -180*clock*y 
          
   // view angle
   rotate -45*x
}