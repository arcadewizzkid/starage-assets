//	Persistence of Vision Raytracer Version 3.5 Scene Description File
//	File: hollow3.pov
//	Author: Dieter Bayer
//	Description:
// This scene shows a hollow, checkered sphere filled with fire.
//
//*******************************************

global_settings {
  //max_trace_level 5
}

#include "colors.inc"

camera {
  location <0,0,-4>
  //angle 90
  right <1,0,0> up <0,1,0>
  // clock
}

background { color rgb <0,0,0> }

// light_source { <100, 100, -200> color White }
torus  { .4 + 2*clock, .4/(1+20*clock*clock) 	
	pigment { rgbt 1 } // surface of sphere is transparent
	interior {
		media {
			emission 0.991111729588
			intervals 1
			samples 33
			method 3
			density {
				spherical
				ramp_wave
        translate (11.7647272589 + clock*1.0)*y  // replace 1.0 = t   by time for animation
        warp { turbulence 0.508237113202 }
        translate -(11.7647272589 + clock*1.0)*y // replace -1.0 = -t  by time for animation
				color_map {
					[0.0 color rgb <1.5, 0.7, 1.5>]
          [0.000697463385367 color rgb <0.945612184678,0.651773989877,0.89752023653>]
[0.0129975574422 color rgb <0.957418125056,0.933576911983,0.984674279571>]
[0.291510782116 color rgb <0.681307712002,0.0284574022649,0.896508126937>]
[0.753029873217 color rgb <0.719342674464,0.312478526641,0.24581096845>]
[0.764861174315 color rgb <0.539582422767,0.975723186962,0.357007129284>]
[0.990628128417 color rgb <0.917759359124,0.54168705714,0.747330507472>]
[0.992610633887 color rgb <0.699215563805,0.295937149458,0.254578544411>]
[1.0 color rgb <0.99513692837,0.454153925392,0.209908370026>]
				}
			}
      scale 1.5
		}
	}
	//translate 25*y
	hollow
	rotate -13*x
	rotate 45*z
}    

sphere { < 0, 0, 0>, .8*sin(radians(20 + 160*clock))
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
        warp { turbulence 0.427886724485 }
        translate -(0.0574574340402 + clock*2.0)*y // replace -1.0 = -t  by time for animation
				color_map {
					[0.0 color rgb <0, 0, 0>]
          [0.000697463385367 color rgb <0.945612184678,0.251773989877,0.49752023653>]
[0.0129975574422 color rgb <0.857418125056,0.833576911983,0.984674279571>]
[0.291510782116 color rgb <0.381307712002,0.0284574022649,0.896508126937>]
[0.753029873217 color rgb <0.719342674464,0.312478526641,0.24581096845>]
[0.764861174315 color rgb <0.539582422767,0.975723186962,0.357007129284>]
[0.990628128417 color rgb <0.817759359124,0.54168705714,0.647330507472>]
[0.992610633887 color rgb <0.699215563805,0.295937149458,0.254578544411>]
[1.0 color rgb <0.49513692837,0.454153925392,0.209908370026>]
				}
			}
			scale 0.9
		}
	}
	//translate 25*y
	hollow
}

