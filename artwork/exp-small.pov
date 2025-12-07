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
  location <0,0,-3>
  //angle 90
  right <1,0,0> up <0,1,0>
  // clock
}

background { color rgb <0,0,0> }

// light_source { <100, 100, -200> color White }
torus  { .4 + 3*clock, .3/(1+20*clock*clock) 	
	pigment { rgbt 1 } // surface of sphere is transparent
	interior {
		media {
			emission 0.99
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
					[0.0 color rgb <1, 1, 1>]
          [0.00337753471436 color rgb <0.767821849159,0.736962564792,0.22480738792>]
[0.157595145418 color rgb <0.869576920545,0.915727262372,0.0284379105729>]
[0.161900810812 color rgb <0.53103668355,0.0894002177226,0.446725621448>]
[0.384288946454 color rgb <0.369335170056,0.286461266566,0.165725612288>]
[0.71025286496 color rgb <0.241026625562,0.639053692999,0.215698012869>]
[0.747361816778 color rgb <0.731436684668,0.390997088453,0.568385578511>]
[1.0 color rgb <0.751446492442,0.685259551467,0.592018142675>]
				}
			}
      scale 1.5
		}
	}
	//translate 25*y
	hollow
	rotate 13*x
	rotate 13*y
	rotate -45*z
}    

sphere { < 0, 0, 0>, 1.1*sin(radians(20 + 160*clock))
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
          [0.00337753471436 color rgb <0.767821849159,0.736962564792,0.22480738792>]
[0.157595145418 color rgb <0.869576920545,0.915727262372,0.0284379105729>]
[0.161900810812 color rgb <0.53103668355,0.0894002177226,0.446725621448>]
[0.384288946454 color rgb <0.369335170056,0.286461266566,0.165725612288>]
[0.71025286496 color rgb <0.241026625562,0.639053692999,0.215698012869>]
[0.747361816778 color rgb <0.731436684668,0.390997088453,0.568385578511>]
[1.0 color rgb <0.751446492442,0.685259551467,0.592018142675>]
				}
			}
			scale 0.9
		}
	}
	//translate 25*y
	hollow
}

