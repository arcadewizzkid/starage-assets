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
    // sphere { <0, 0, 20>, 20 }
    box {<3, 3, 0>, <-3, -3, 3>}
  }
//  cylinder { <0, 0, -3>, <0, 0, 3>, .5 }
//  cylinder { <-3, 0, 0>, <3, 0, 0>, .5 }
//  pigment { Gray65 }
//  finish { phong .4 reflection .1 }
    scale <1,1,0.1>
}

#declare GlassSphere = object {
   sphere { <0, 0, 0>, 3 - R }
    material {M_Glass3}
    no_shadow 
}

#declare lum1 = 1 - .7 * sin(radians(360 * clock));
#declare lum2 = 1 - .7 * sin(radians(45 + 360 * clock));
#declare lum3 = 1 - .7 * sin(radians(90 + 360 * clock));
#declare lum4 = 1 - .7 * sin(radians(135 + 360 * clock));
#declare lum5 = 1 - .7 * sin(radians(180 * clock));
#declare lum6 = 1 - .7 * sin(radians(225 + 360 * clock));
#declare lum7 = 1 - .7 * sin(radians(270 + 360 * clock));
#declare lum8 = 1 - .7 * sin(radians(315 + 360 * clock));

#declare light_globe = 0.30;

#declare GlowEye1 = object {
  sphere {
    <-0, 0, -0>, light_globe
    pigment { Red*lum1 }
    finish { ambient 1 diffuse 0 }
  }
}

#declare GlowEye2 = object {
  sphere {
    <-0, 0, -0>, light_globe
    pigment { Red*lum2 }
    finish { ambient 1 diffuse 0 }
  }
}

#declare GlowEye3 = object {
  sphere {
    <-0, 0, -0>, light_globe
    pigment { Red*lum3 }
    finish { ambient 1 diffuse 0 }
  }
}

#declare GlowEye4 = object {
  sphere {
    <-0, 0, -0>, light_globe
    pigment { Red*lum4 }
    finish { ambient 1 diffuse 0 }
  }
}

#declare GlowEye5 = object {
  sphere {
    <-0, 0, -0>, light_globe
    pigment { Red*lum5 }
    finish { ambient 1 diffuse 0 }
  }
}

#declare GlowEye6 = object {
  sphere {
    <-0, 0, -0>, light_globe
    pigment { Red*lum6 }
    finish { ambient 1 diffuse 0 }
  }
}

#declare GlowEye7 = object {
  sphere {
    <-0, 0, -0>, light_globe
    pigment { Red*lum7 }
    finish { ambient 1 diffuse 0 }
  }
}

#declare GlowEye8 = object {
  sphere {
    <-0, 0, -0>, light_globe
    pigment { Red*lum8 }
    finish { ambient 1 diffuse 0 }
  }
}

#declare Barrel = object {
    cylinder {<-0,-3,-R> <0, 3, -R> R}
}

#declare Final = union {
  object { OuterShell }
  object { Barrel rotate z*00}
  object { Barrel rotate z*45}
  object { Barrel rotate z*-45}
  object { Barrel rotate z*90}
  object { GlassSphere }
  object { GlowEye1 translate <0, 2, -R*2> rotate z*00 }
  object { GlowEye2 translate <0, 2, -R*2> rotate z*45 }
  object { GlowEye3 translate <0, 2, -R*2> rotate z*90 }
  object { GlowEye4 translate <0, 2, -R*2> rotate z*135 }
  object { GlowEye5 translate <0, 2, -R*2> rotate z*180 }
  object { GlowEye6 translate <0, 2, -R*2> rotate z*225 }
  object { GlowEye7 translate <0, 2, -R*2> rotate z*270 }
  object { GlowEye8 translate <0, 2, -R*2> rotate z*315 }
}

#declare ScaledFinal = object { 
    Final 
    scale 0.5 
}

union { 
   ScaledFinal
       
   texture {Future_Chrome}          
   no_shadow 
   
   // animation
   // rotate -90*y
   //rotate -360*clock*z 
          
   // view angle
   // rotate -45*x
}
