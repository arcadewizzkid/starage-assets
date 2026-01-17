// Space station
// 10/1994 Christian Perle <christian.perle@tu-clausthal.de>
// POV version: 2.0 or higher
// Copying policy: LGPL (see file COPYING)

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

light_source { <-60.00, 20.00, -5.00> White}
light_source { <60.00, -20.00, -5.00> color Gray50 }

#include "wizzpov.h"

object { 
    Future_Sky 
    scale <1,1,4> 
    rotate x*-20
    translate <0, 2, 6>
}

#declare R = 0.30;

#declare OuterShell = union {
  difference {
    object {
        torus  { 3, R }    
        rotate -20*x
    }
    // box {<3, 3, 0>, <-3, -3, 3>}
  }
//  cylinder { <0, 0, -3>, <0, 0, 3>, .5 }
//  cylinder { <-3, 0, 0>, <3, 0, 0>, .5 }
//  pigment { Gray65 }
//  finish { phong .4 reflection .1 }
    scale <1,1,1>
}

#declare GlassSphere = object {
   sphere { <0, 0, 0>, 3 * 0.6 }
    material {M_Glass3}
    no_shadow 
}

#declare lum = 0.9 - .3 * sin(radians(360 * clock));
#declare ilum = 1 - .7 * sin(radians(180 + 360 * clock));
#declare light_globe = 3 * 0.2;

#declare GlowEye = object {
  sphere {
    <0, 0, 0>, light_globe
    pigment { Black*lum }
    finish { ambient 1 diffuse 0 }
  }
}

//#declare Barrel = object {
//    cylinder {<-0,0,-R> <0, 3, -R> R}
//}

#declare B = 0.20 * lum;

#declare Final = union {
    object { OuterShell scale <1,1,1> }
    object { OuterShell scale <1-B*1,1-B*1,1-B*1> }
    object { OuterShell scale <1-B*2,1-B*2,1-B*2> }
    object { OuterShell scale <1-B*3,1-B*3,1-B*3> }
    object { OuterShell scale <1-B*4,1-B*4,1-B*4> }
//  Barrel
  object { GlassSphere }
  object { GlowEye }
}

#declare ScaledFinal = object { 
    Final 
    scale 0.48 
}

union { 
   ScaledFinal
       
   texture {Future_Chrome}          
   no_shadow 
   
   // animation
   // rotate -90*y
   // rotate -360*clock*z 
          
   // view angle
   // rotate -45*x
}
