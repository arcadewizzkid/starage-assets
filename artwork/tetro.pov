// Space station
// 10/1994 Christian Perle <christian.perle@tu-clausthal.de>
// POV version: 2.0 or higher
// Copying policy: LGPL (see file COPYING)

global_settings { assumed_gamma 2.2 }


#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "shapes2.inc"

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
    translate <0, 4, 4>
}

#declare cut_width = 0.10;
#declare box_height = 10;

#declare OuterShell = union {
  difference {
    object {
        Octahedron
        rotate -45*y
        scale <2, 3, 2> 
    }
    object {
        Octahedron
        rotate -45*y
        scale <2 * 0.95, 3 * 0.95, 2 * 0.95> 
    }
    box {<1 * cut_width, box_height, box_height>, <-1 * cut_width, -box_height, -box_height>}
    box {<box_height, box_height, 1 * cut_width>, <-box_height, -box_height, -1 * cut_width>}
  }
}

#declare InnerGlass = object {
    object {
        Octahedron
        rotate -45*y
        scale <2 * 0.95, 3 * 0.95, 2 * 0.95> 
    }
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
    pigment { Red*1 }
    finish { ambient 1 diffuse 0 }
  }
}

#declare Final = union {
  object { OuterShell }
  //object { InnerGlass }
  object { GlowEye }
}

#declare ScaledFinal = object { 
    Final 
    scale 0.3 
}

union { 
   ScaledFinal
       
   texture {Future_Chrome}          
   no_shadow 
   
   // animation
   rotate -90*y
   rotate -360*clock*y 
          
   // view angle
   rotate -10*x
}
