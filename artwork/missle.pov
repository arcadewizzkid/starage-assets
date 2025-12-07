global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

camera {
    location <0.0, 0.0, -3.4>
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

#include "wizzpov.h"

//object { 
//    Future_Sky 
//    translate <0, 0, 3>
//}

/*
sphere { <-20, 0, -10>, 10 texture { pigment { Red }  } }
sphere { <20, 0, -10>, 10 texture { pigment { Green }  } }
sphere { <0, -20, -10>, 10 texture { pigment { Blue }  } }
*/

#declare Texture =
texture {
   finish {
      ambient 0.6
      diffuse 1
      reflection 0.8
      phong 1
      phong_size 8
   }
   pigment { color red 0.65 green 0.65 blue 0.65 }
}

union {  
      mesh {
        triangle{ <0, 0, -1>, <0, 1.0, 0>, <1.3, -.6, 0> }
        triangle{ <0, 0, -1>, <0, 1.0, 0>, <-1.3, -.6, 0> }
        //triangle{ <0, 0, -1>, <1, -1, 0>, <-1, -1, 0> }
      }
      //sphere { <0, 0, -0.47>, 0.4  }
      texture {Texture}          
      //no_shadow 
      scale <1, 1, 1>
      rotate 360*clock*z
}

