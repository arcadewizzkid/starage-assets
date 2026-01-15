// Laser Tower with Mirror Finish
// POV-Ray 3.7

#version 3.7;

global_settings { assumed_gamma 2.2 }


#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

camera {
    location <0.0, 15.0, -25>
    direction z*-1.2
//    right 4/3*x
    right x
    up y
    look_at <0.0, 9, 0.00>
}

light_source { <-60.00, 20.00, -5.00> White}
light_source { <60.00, -20.00, -5.00> color Gray50 }

#include "wizzpov.h"

object { 
    Future_Sky 
    scale <10,10,20> 
    rotate <60,0,0>
    translate <0, 4, 6>
}

// Base platform
cylinder {
  <0, 0, 0>, <0, 0.5, 0>, 3
  pigment { color rgb <0.7, 0.75, 0.8> }
   texture {Future_Chrome}          
}

// Base platform rim
torus {
  3, 0.15
  translate <0, 0.5, 0>
  pigment { color rgb <0.8, 0.85, 0.9> }
   texture {Future_Chrome}          
}

// Main tower base (octagonal)
intersection {
  cylinder { <0, 0.5, 0>, <0, 3, 0>, 2 }
  plane { <1, 0, 0>, 1 rotate <0, 0, 0> }
  plane { <1, 0, 0>, 1 rotate <0, 45, 0> }
  plane { <1, 0, 0>, 1 rotate <0, 90, 0> }
  plane { <1, 0, 0>, 1 rotate <0, 135, 0> }
  plane { <1, 0, 0>, 1 rotate <0, 180, 0> }
  plane { <1, 0, 0>, 1 rotate <0, 225, 0> }
  plane { <1, 0, 0>, 1 rotate <0, 270, 0> }
  plane { <1, 0, 0>, 1 rotate <0, 315, 0> }
  pigment { color rgb <0.75, 0.8, 0.85> }
   texture {Future_Chrome}          
}

// Mid section connector
cone {
  <0, 3, 0>, 2
  <0, 4, 0>, 1.5
  pigment { color rgb <0.7, 0.75, 0.8> }
   texture {Future_Chrome}          
}

// Main tower shaft
cylinder {
  <0, 4, 0>, <0, 12, 0>, 1.5
  pigment { color rgb <0.8, 0.85, 0.9> }
   texture {Future_Chrome}          
}

// Tower rings (decorative)
#declare I = 0;
#while (I < 5)
  torus {
    1.55, 0.1
    translate <0, 5 + I * 1.5, 0>
    pigment { color rgb <0.6, 0.65, 0.75> }
   texture {Future_Chrome}          
  }
  #declare I = I + 1;
#end

// Upper platform
cylinder {
  <0, 12, 0>, <0, 12.5, 0>, 2
  pigment { color rgb <0.75, 0.8, 0.85> }
   texture {Future_Chrome}          
}

// Laser housing (main dome)
sphere {
  <0, 13.5, 0>, 1.2
  pigment { color rgb <0.8, 0.85, 0.9> }
   texture {Future_Chrome}          
}

// Laser emitter ring
torus {
  0.8, 0.15
  rotate <90, 0, 0>
  translate <0, 13.5, 0>
  pigment { color rgb <0.9, 0.95, 1> }
   texture {Future_Chrome}          
}

// Laser focusing lens (glowing)
sphere {
  <0, 13.5, 0>, 0.7
  pigment { color rgbt <0.3, 0.7, 1, 0.7> }
  finish {
    ambient 0.8
    diffuse 0.2
    reflection 0.3
    specular 1
    roughness 0.001
  }
  interior {
    ior 1.5
  }
}




// Support struts (4 around the tower)
#declare Strut = 
  cylinder {
    <0, 0, 0>, <0, 1, 0>, 0.1
    pigment { color rgb <0.7, 0.75, 0.8> }
   texture {Future_Chrome}          
  }

#declare J = 0;
#while (J < 4)
  object {
    Strut
    scale <1, 8, 1>
    translate <1.7, 4, 0>
    rotate <0, J * 90, 0>
  }
  
  // Diagonal braces
  object {
    Strut
    scale <1, 4, 1>
    rotate <25, 0, 0>
    translate <1.7, 4, 0>
    rotate <0, J * 90, 0>
  }
  
  #declare J = J + 1;
#end

// Antenna/sensor array on top
union {
  cylinder { <0, 14.7, 0>, <0, 16, 0>, 0.08 }
  sphere { <0, 16, 0>, 0.15 }
  
  // Side antennas
  cylinder { <0, 15.5, 0>, <0.5, 16.2, 0>, 0.04 }
  sphere { <0.5, 16.2, 0>, 0.08 }
  
  cylinder { <0, 15.5, 0>, <-0.5, 16.2, 0>, 0.04 }
  sphere { <-0.5, 16.2, 0>, 0.08 }
  
  pigment { color rgb <0.85, 0.9, 0.95> }
   texture {Future_Chrome}          
}

// Power conduits (glowing lines on tower)
#declare K = 0;
#while (K < 4)
  cylinder {
    <0, 4, 0>, <0, 12, 0>, 0.05
    pigment { color rgb <0.3, 0.8, 1> }
    finish {
      ambient 1.0
      diffuse 0.2
      emission 1.2
      specular 0.8
    }
    translate <1.52, 0, 0>
    rotate <0, K * 90 + 22.5, 0>
  }
  #declare K = K + 1;
#end