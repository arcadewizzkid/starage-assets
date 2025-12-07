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


/*
sphere { <-20, 0, -10>, 10 texture { pigment { Red }  } }
sphere { <20, 0, -10>, 10 texture { pigment { Green }  } }
sphere { <0, -20, -10>, 10 texture { pigment { Blue }  } }
*/
    
    
#include "wizzpov.h"


#declare ShipTexture =
texture {
   finish {
      ambient 0.6
      diffuse 1
      reflection 0.8
      phong 1
      phong_size 8
   }
   pigment { color red 0.2 green 0.45 blue 0.65 }
}

#declare Texture1 =
texture {
   finish {
      ambient 1
      diffuse 1
      reflection 0.0
      phong 1
      phong_size 8
   }
   pigment { color red .25 green 0.25 blue 1 }
}

#declare Texture2 =
texture {
   finish {
      ambient 1
      diffuse 1
      reflection 0.0
      phong 1
      phong_size 8
   }
   pigment { color red .3 green 0.30 blue 1 }
}

#declare Narcelle = object { sphere { <0, 0, 0>, 0.1  } scale <1.5, 3, 1.0>}
#declare Narcelle2 = object { sphere { <0, 0, 0>, 0.1  } scale <2, 6, 2.0>}
#declare wing = 
  prism {
    cubic_spline
    -0.0, // sweep the following shape from here ...
    -0.2, // ... up through here
    6, // the number of points making up the shape ...
    < 1, -2>, // point#1 (control point... not on curve)
    < 1,  2>, // point#2  ... THIS POINT ...
    <-2,  0>, // point#3
    < 1, -2>, // point#4
    < 1,  2>, // point#5 ... MUST MATCH THIS POINT
    <-2,  0>  // point#6 (control point... not on curve)    
    rotate <90, 0, -90>  
    scale <0.45, 0.85, 0.4>    
    translate <0, 0.4, -.3>
//    rotate <45, 0, 0>  
  }

#declare leftwing = 
difference 
{      
    object { wing }
    box {<2, -2, -2>, <0, 2, 2>}
}

#declare rightwing = 
difference 
{      
    object { wing }
    box {<-2, -2, -2>, <0, 2, 2>}
}

#declare fullwing = 
union 
{      
    object { leftwing rotate <0, 30, 0> rotate <45, 0, 0>}
    object { rightwing rotate <0, -30, 0> rotate <45, 0, 0>}
}
                  
union {
      union 
      {
        difference 
        {      
            object { fullwing }
            sphere { <0, 0, -0.47>, 0.5  }
        }
      
        sphere { <0, 0, -0.47>, 0.4  }
        texture { Future_Chrome }       
      }
      object { Narcelle translate <.3, -.5, -0.2> texture { Texture1 }}
      object { Narcelle translate <-.3, -0.5, -0.2> texture { Texture1 }}
      object { Narcelle2 translate <0, -0.5, -0.2> texture { Texture2 }}
      rotate 360*clock*z
}

light_source {<0, -5, -.5> color red .2 green 0.30 blue 1 rotate 360*clock*z}      

object { 
    Future_Sky 
    translate <0, -1.3, 6>
}
        
        