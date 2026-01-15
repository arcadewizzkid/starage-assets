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
    translate <0, 4, 6>
}

#declare box_width = 0.20;

#declare OuterShell = union {
  difference {
    sphere { <0, 0, 0>, 3 }
    sphere { <0, 0, 0>, 3 - box_width }
    box {<1 * box_width, 3, 3>, <-1 * box_width, -3, -3>}
    box {<3, 3, 1 * box_width>, <-3, -3, -1 * box_width>}
  }
//  cylinder { <0, 0, -3>, <0, 0, 3>, .5 }
//  cylinder { <-3, 0, 0>, <3, 0, 0>, .5 }
//  pigment { Gray65 }
//  finish { phong .4 reflection .1 }
}

#declare GlassSphere = object {
    sphere { <0, 0, 0>, 3 - box_width }
    material {M_Glass3}
    no_shadow 
}

#declare lum = 1 - .7 * sin(radians(360 * clock * 4));
#declare ilum = 1 - .7 * sin(radians(180 + 360 * clock * 4));
#declare light_globe = 0.25;

#declare GlowEye = object {
  sphere {
    <0, 0, 0>, light_globe
//    pigment { Green*ilum }
    pigment { Green*1 }
    finish { ambient 1 diffuse 0 }
  }
}

#declare Final = union {
  object { OuterShell }
  object { GlassSphere }
  object { GlowEye }
}

#declare ScaledFinal = object { 
    Final 
    scale 0.4 
}

union { 
   ScaledFinal
       
   texture {Future_Chrome}          
   no_shadow 
   
   // animation
   rotate -90*y
   rotate -360*clock*y 
          
   // view angle
   rotate -45*x
}
