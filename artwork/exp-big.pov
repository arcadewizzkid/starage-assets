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
  location <0,0,-5>
  //angle 90
  right <1,0,0> up <0,1,0>
  // clock
}

background { color rgb <0,0,0> }

// light_source { <100, 100, -200> color White }

torus  { .4 + 2*clock, .17/(1+6*clock) 	
	pigment { rgbt 1 } // surface of sphere is transparent
	interior {
		media {
			emission 0.971111729588
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
					[0.0 color rgb <0.4, 0, 0.6>]
          [0.167794058608 color rgb <0.8744145159025,0.429805412018,0.241940654042>]
[0.394381754023 color rgb <0.220984507921,0.809630759903,0.631233427968>]
[0.647687782226 color rgb <0.711318508587,0.809369964902,0.707297766911>]
[0.866440302808 color rgb <0.774810320127,0.735449169639,0.451242945833>]
[1.0 color rgb <0.87870835321,0.176934591111,0.168196162287>]
				}
			}
      scale 1.5
		}
	}
	//translate 25*y
	hollow
	rotate -13*x
}     

//sphere { < 0, 0, 0>, 1.1*sin(radians(20 + 160*clock))
	// pigment { rgbt 1 } // surface of sphere is transparent
//	pigment { rgbt 1 } // surface of sphere is transparent
//	interior {
//		media {
//			emission 0.971111729588
//			intervals 1
//			samples 33
//			method 3
//			density {
//				spherical
//				ramp_wave
//        translate (11.7647272589 + clock*2.0)*y  // replace 1.0 = t   by time for animation
//        warp { turbulence 0.508237113202 }
//        translate -(11.7647272589 + clock*2.0)*y // replace -1.0 = -t  by time for animation
//				color_map {
//					[0.0 color rgb <0, 0, 0>]
//          [0.167794058608 color rgb <0.8744145159025,0.429805412018,0.241940654042>]
//[0.394381754023 color rgb <0.220984507921,0.809630759903,0.631233427968>]
//[0.647687782226 color rgb <0.711318508587,0.809369964902,0.707297766911>]
//[0.866440302808 color rgb <0.774810320127,0.735449169639,0.451242945833>]
//[1.0 color rgb <0.87870835321,0.176934591111,0.168196162287>]
//				}
//			}
//      scale 0.8
//		}
//	}
//	//translate 25*y
//	hollow
//}

sphere { < 0.2, -.1, 0>, 0.9*sin(radians(20 + 140*clock))
	// pigment { rgbt 1 } // surface of sphere is transparent
	pigment { rgbt 1 } // surface of sphere is transparent
	interior {
		media {
			emission 0.971111729588
			intervals 1
			samples 33
			method 3
			density {
				spherical
				ramp_wave
        translate (11.7647272589 + clock*2.0)*y  // replace 1.0 = t   by time for animation
        warp { turbulence 0.508237113202 }
        translate -(11.7647272589 + clock*1.0)*y // replace -1.0 = -t  by time for animation
				color_map {
					[0.0 color rgb <0, 0, 0>]
          [0.167794058608 color rgb <0.8744145159025,0.429805412018,0.241940654042>]
[0.394381754023 color rgb <0.220984507921,0.809630759903,0.631233427968>]
[0.647687782226 color rgb <0.711318508587,0.809369964902,0.707297766911>]
[0.866440302808 color rgb <0.774810320127,0.735449169639,0.451242945833>]
[1.0 color rgb <0.87870835321,0.176934591111,0.168196162287>]
				}
			}
      scale 0.8
		}
	}
	//translate 25*y
	hollow
}

sphere { < -.2, .1, 0>, 0.9*sin(radians(20 + 145*clock))
	// pigment { rgbt 1 } // surface of sphere is transparent
	pigment { rgbt 1 } // surface of sphere is transparent
	interior {
		media {
			emission 0.971111729588
			intervals 1
			samples 33
			method 3
			density {
				spherical
				ramp_wave
        translate (11.7647272589 + clock*1.0)*y  // replace 1.0 = t   by time for animation
        warp { turbulence 0.508237113202 }
        translate -(11.7647272589 + clock*2.0)*y // replace -1.0 = -t  by time for animation
				color_map {
					[0.0 color rgb <0, 0, 0>]
          [0.167794058608 color rgb <0.8744145159025,0.429805412018,0.241940654042>]
[0.394381754023 color rgb <0.220984507921,0.809630759903,0.631233427968>]
[0.647687782226 color rgb <0.711318508587,0.809369964902,0.707297766911>]
[0.866440302808 color rgb <0.774810320127,0.735449169639,0.451242945833>]
[1.0 color rgb <0.87870835321,0.176934591111,0.168196162287>]
				}
			}
      scale 0.8
		}
	}
	//translate 25*y
	hollow
}