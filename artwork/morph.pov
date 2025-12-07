// Persistence Of Vision raytracer version 3.5 sample file.
// updated for compatibility with POV-Ray v3.5 by Ken Tyler on 08-26-01
// piece 3
// by Truman Brown (12/91)
//
// -w320 -h240
// -w800 -h600 +a0.3

// Due to the large number of objects, you will probably have to
// have a lot of memory to render this scene.
// Rendering time using a 25Mhz 386 w/Cyrix fpu is approximately 60 hours.

// NOTE: The following comment by Truman is no longer relevant.  The
// gamma has been modified by the assumed_gamma setting below.  -dmf
//
//   The lighting is intentionally dim when the image is rendered.
//   You can enhance the image using PicLab's gamma, brightness, and
//   contrast command when you post-process the image.


global_settings { assumed_gamma 0.8 max_trace_level 5 }

#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"


camera {
    location <0.0, 35.0, -25.0>
    direction z*1.3
//    right 4/3*x
    right x
    up y
    look_at <0.0, -3.0, 0.00>
}


 
//light_source { <4, 3, 2 > color White }
//light_source { <1, -4, 4> color White }
//light_source { <-3, 1, 5> color White } 
 
light_source { <-60.00, 20.00, -5.00> White}
light_source { <60.00, -20.00, -5.00> color Gray50 }
//light_source { <20.00, 10.00, -0.00> color Gray20 }
//light_source { <-20.00, -10.00, -5.00> color Gray60 }

#declare YourTexture =
texture {  
      pigment { White }
      finish {
         ambient 0.1
         diffuse 0.5     
         reflection .1
         specular 1.0
         roughness 0.1
      }
   
}

#include "curly-q.inc" /* 1251 spheres rotating around in a ring    */
/* brought to you by Spiral 2.0 and ctds 1.6 */


sphere { /* Big ellipsoid to reflect stuff */
   <0, .3, 0>, 1
   scale <6.25, 4.0, 6.25>
   translate <0.0, 0, 0.0>

   texture {
      pigment { Red }
      finish {
         ambient 0.3
         diffuse 0.3     
         reflection .01
         specular 1.0
         roughness 0.01
      }
   }
   no_shadow
}

      
      
object { spirals translate <0.0, 0, 0.0> 
        rotate 36*clock*y 
        no_shadow
}            



#declare ball = /* Ball to top poles placed inside of curly-q */
sphere {
   <0, 0, 0>, 2
   texture {
      pigment { Blue }
      finish {
         reflection 0.01
         ambient 0.2
         diffuse 0.5
         specular 1.0
         roughness 0.00001
      }
   }
}

/* Construct the blue balls. */  
union {
        object { ball translate <11, 0, 0> rotate <0,  18, 0> }
        object { ball translate <11, 0, 0> rotate <0,  54, 0> }
        object { ball translate <11, 0, 0> rotate <0,  90, 0> }
        object { ball translate <11, 0, 0> rotate <0, 126, 0> }
        object { ball translate <11, 0, 0> rotate <0, 162, 0> }
        object { ball translate <11, 0, 0> rotate <0, 198, 0> }
        object { ball translate <11, 0, 0> rotate <0, 234, 0> }
        object { ball translate <11, 0, 0> rotate <0, 270, 0> }
        object { ball translate <11, 0, 0> rotate <0, 306, 0> }
        object { ball translate <11, 0, 0> rotate <0, 342, 0> }
        // rotate 360*clock*y
        no_shadow
}               

#declare Connector_1 = cylinder {
   <0, 0, 0>, <1, 0, 0>, 1

   texture {
      pigment { DimGray }
      finish {
         ambient 0.0
         diffuse 0.6
         specular 1.0
         roughness 0.00001
         reflection 0.25
      }
   }
}

#include "links.inc" /* Poles linking interior balls and poles */
//object { links rotate <0, 18, 0> translate <0.0, 0, 0.0> }
