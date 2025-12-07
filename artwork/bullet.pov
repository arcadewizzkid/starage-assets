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
    location <0.0, .5, -3.3>
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

#declare Plasma = sphere { < 0, 0, 0>, 1
	// pigment { rgbt 1 } // surface of sphere is transparent
	pigment { rgbt 1 } // surface of sphere is transparent
	interior {
		media {
			emission 0.958891536183
			intervals 1
			samples 33
			method 3
			density {
				spherical
				ramp_wave
        translate (0.0574574340402 + clock*2.0)*y  // replace 1.0 = t   by time for animation
        warp { turbulence 0.327886724485 }
        translate -(0.0574574340402 + clock*2.0)*y // replace -1.0 = -t  by time for animation
				color_map {
					[0.0 color rgb <0, 0, 0>]
          [0.00337753471436 color rgb <0.936962564792,0.936962564792,0.936962564792>]
[0.157595145418 color rgb <0.915727262372,0.915727262372,0.915727262372>]
[0.161900810812 color rgb <0.0894002177226,0.0894002177226,0.0894002177226>]
[0.384288946454 color rgb <0.286461266566,0.286461266566,0.286461266566>]
[0.91025286496 color rgb <0.639053692999,0.639053692999,0.639053692999>]
[0.947361816778 color rgb <0.390997088453,0.390997088453,0.390997088453>]
[1.0 color rgb <0.685259551467,0.685259551467,0.685259551467>]
				}
			}
			scale 0.9
		}
	}
	//translate 25*y
	hollow
}
 
#declare lum = .6 + .4 * sin(radians(180 * clock));
 
#declare Core = object {
        sphere {<0, 0, 0> .6}
   texture {
      pigment { rgb <lum lum lum> }
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

union { 
   object {Plasma}
   object {Core}
       
   // animation
   //rotate -90*y
   Axis_Rotate_Trans(<0, 1, 0>, -90*clock)
          
   // view angle
   rotate -45*x
}