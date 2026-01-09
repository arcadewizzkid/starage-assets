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
    translate <0, 4, 4>
}

#declare Rotor = union {
  difference {
    torus { 3, .7 }
    torus { 3.7, .2 pigment { red .65 green .65 blue .75 } }
  }
  cylinder { <0, 0, -3>, <0, 0, 3>, .5 }
  cylinder { <-3, 0, 0>, <3, 0, 0>, .5 }
//  pigment { Gray65 }
//  finish { phong .4 reflection .1 }
}

#declare lum = 1 - .7 * sin(radians(360 * clock * 4));
#declare ilum = 1 - .7 * sin(radians(180 + 360 * clock * 4));
#declare light_globe = 0.25;

#declare Station = union {
  object { Rotor }
  sphere {
    <0, .7, 3>, light_globe
    pigment { Green*ilum }
    finish { ambient 1 diffuse 0 }
  }
  sphere {
    <0, .7, -3>, light_globe
    pigment { Red*ilum }
    finish { ambient 1 diffuse 0 }
  }
}

#declare ScaledStation = object { 
    Station 
    scale 0.4 
}

union { 
   ScaledStation
       
   texture {Future_Chrome}          
   no_shadow 
   
   // animation
   rotate -90*y
   rotate -360*clock*y 
          
   // view angle
   rotate -25*x
}
