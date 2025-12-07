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
    location <0.0, .5, -4.5>
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

#declare R = 0.2;

#declare lum = 1;// - .6 * sin(radians(180 * clock));

#declare PowerTest = object {
        sphere {<0, 0, 0> .2}
   texture {
      pigment { Red*lum }
      finish {
         ambient 1
         diffuse 0.3     
         reflection .01
         specular 1.0
         roughness 0.01
      }
   }
        no_shadow 
}

#declare PowerSphere = object {
        sphere {<0, 0, 0> 1.2}
        material {M_Glass3}
        no_shadow 
}

#declare PowerRing1 = object {
        torus {1.4, R}
        rotate 90*x
        // animation
        rotate 180*clock*y  
        //Axis_Rotate_Trans(<1, 1, 0>, 180*clock)
}

#declare PowerRing2 = object {
        torus {1.4, R}
        rotate 90*x
        // animation
        rotate -180*clock*x 
          
}

#declare PowerRings = union { 
   object { PowerRing1 }
   object { PowerRing2 }
       
   texture {Future_Chrome}          
   no_shadow 
   
   // view angle
   //rotate -45*x
}

union { 
   object { PowerTest}
   object { PowerSphere}
   object { PowerRings }  
   
   // view angle
   //rotate -45*x
}