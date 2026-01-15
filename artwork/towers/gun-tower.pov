// Railgun Launcher with Mirror Finish
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
    look_at <0.0, 7, 0.00>
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


// BASE PLATFORM
// Main base
cylinder {
  <0, 0, 0>, <0, 0.3, 0>, 4
  pigment { color rgb <0.6, 0.65, 0.7> }
   texture {Future_Chrome}          
}

// Base detail ring
torus {
  4, 0.2
  translate <0, 0.3, 0>
  pigment { color rgb <0.7, 0.75, 0.8> }
   texture {Future_Chrome}          
}

// MOUNTING ASSEMBLY
// Elevation pivot housing (left)
sphere {
  <-2, 2, 0>, 1.2
  pigment { color rgb <0.65, 0.7, 0.75> }
   texture {Future_Chrome}          
}

// Elevation pivot housing (right)
sphere {
  <2, 2, 0>, 1.2
  pigment { color rgb <0.65, 0.7, 0.75> }
   texture {Future_Chrome}          
}

// Pivot axle
cylinder {
  <-2.5, 2, 0>, <2.5, 2, 0>, 0.4
  pigment { color rgb <0.7, 0.75, 0.8> }
   texture {Future_Chrome}          
}

// Support columns
#declare SupportColumn = 
  cylinder {
    <0, 0.3, 0>, <0, 2, 0>, 0.3
    pigment { color rgb <0.65, 0.7, 0.75> }
   texture {Future_Chrome}          
  }

object { SupportColumn translate <-2, 0, 0> }
object { SupportColumn translate <2, 0, 0> }
object { SupportColumn translate <-2, 0, -1.5> }
object { SupportColumn translate <2, 0, -1.5> }

// MAIN BARREL ASSEMBLY (angled upward)
#declare BarrelAssembly = union {
  
  // Main barrel (center tube)
  cylinder {
    <0, 0, 0>, <0, 0, 20>, 0.5
    pigment { color rgb <0.75, 0.8, 0.85> }
   texture {Future_Chrome}          
  }
  
  // Barrel reinforcement rings
  #declare I = 0;
  #while (I < 10)
    torus {
      0.52, 0.08
      rotate <90, 0, 0>
      translate <0, 0, 2 + I * 2>
      pigment { color rgb <0.65, 0.7, 0.75> }
   texture {Future_Chrome}          
    }
    #declare I = I + 1;
  #end
  
  // TOP RAIL
  box {
    <-0.15, 0.6, 0>, <0.15, 0.85, 20>
    pigment { color rgb <0.5, 0.55, 0.6> }
   texture {Future_Chrome}          
  }
  
  // Top rail electromagnetic coils
  #declare J = 0;
  #while (J < 20)
    box {
      <-0.18, 0.58, 0>, <0.18, 0.87, 0.3>
      translate <0, 0, J>
      pigment { color rgb <0.3, 0.5, 0.8> }
      finish {
        ambient 0.5
        diffuse 0.3
        emission 0.6
        specular 0.7
        reflection 0.4
      }
    }
    #declare J = J + 1;
  #end
  
  // BOTTOM RAIL
  box {
    <-0.15, -0.85, 0>, <0.15, -0.6, 20>
    pigment { color rgb <0.5, 0.55, 0.6> }
   texture {Future_Chrome}          
  }
  
  // Bottom rail electromagnetic coils
  #declare K = 0;
  #while (K < 20)
    box {
      <-0.18, -0.87, 0>, <0.18, -0.58, 0.3>
      translate <0, 0, K>
      pigment { color rgb <0.3, 0.5, 0.8> }
      finish {
        ambient 0.5
        diffuse 0.3
        emission 0.6
        specular 0.7
        reflection 0.4
      }
    }
    #declare K = K + 1;
  #end
  
  // LEFT RAIL
  box {
    <-0.85, -0.15, 0>, <-0.6, 0.15, 20>
    pigment { color rgb <0.5, 0.55, 0.6> }
   texture {Future_Chrome}          
  }
  
  // RIGHT RAIL
  box {
    <0.6, -0.15, 0>, <0.85, 0.15, 20>
    pigment { color rgb <0.5, 0.55, 0.6> }
   texture {Future_Chrome}          
  }
  
  // Muzzle brake assembly
  difference {
    cone {
      <0, 0, 20>, 0.7
      <0, 0, 21.5>, 0.9
      pigment { color rgb <0.7, 0.75, 0.8> }
   texture {Future_Chrome}          
    }
    cylinder {
      <0, 0, 19.5>, <0, 0, 22>, 0.52
    }
  }
  
  // Muzzle ports (4 vents)
  #declare M = 0;
  #while (M < 4)
    box {
      <-0.05, -1, 20.3>, <0.05, -0.72, 21.2>
      rotate <0, 0, M * 90>
      pigment { color rgb <0.2, 0.2, 0.25> }
      finish {
        ambient 0.1
        diffuse 0.2
      }
    }
    #declare M = M + 1;
  #end
  
  // Barrel shroud supports
  #declare N = 0;
  #while (N < 5)
    cylinder {
      <0, 0, 0>, <-0.9, 0, 0>, 0.08
      translate <0, 0, 4 + N * 3>
      pigment { color rgb <0.6, 0.65, 0.7> }
   texture {Future_Chrome}          
    }
    cylinder {
      <0, 0, 0>, <0.9, 0, 0>, 0.08
      translate <0, 0, 4 + N * 3>
      pigment { color rgb <0.6, 0.65, 0.7> }
   texture {Future_Chrome}          
    }
    #declare N = N + 1;
  #end
  
  // Breech assembly
  cylinder {
    <0, 0, -1.5>, <0, 0, 0>, 0.8
    pigment { color rgb <0.65, 0.7, 0.75> }
   texture {Future_Chrome}          
  }
  
  // Breech detail ring
  torus {
    0.82, 0.1
    rotate <90, 0, 0>
    translate <0, 0, -0.5>
    pigment { color rgb <0.7, 0.75, 0.8> }
   texture {Future_Chrome}          
  }
  
  // Projectile chambered (visible energy glow)
  cylinder {
    <0, 0, -1>, <0, 0, 1>, 0.3
    pigment { color rgbt <0.5, 0.8, 1, 0.5> }
    finish {
      ambient 1.5
      diffuse 0.2
      emission 2.0
      specular 0.8
    }
  }
  
  // Charging glow at breech
  sphere {
    <0, 0, 0>, 1.2
    pigment { color rgbt <0.4, 0.7, 1, 0.85> }
    finish {
      ambient 1.0
      diffuse 0
      emission 1.5
    }
    hollow
    no_shadow
  }
  
  rotate <-15, 0, 0>
  translate <0, 2, 0>
}

object { BarrelAssembly }

// POWER CABLES (running to barrel)
#declare PowerCable = 
  sphere_sweep {
    b_spline
    6,
    <-2, 0.5, -1.5>, 0.15
    <-2, 1, -1>, 0.15
    <-1, 1.5, 0>, 0.12
    <-0.5, 1.8, 1>, 0.12
    <-0.3, 1.9, 2>, 0.1
    <-0.2, 1.95, 3>, 0.1
    pigment { color rgb <0.2, 0.3, 0.4> }
    finish {
      ambient 0.2
      diffuse 0.4
      specular 0.6
      reflection 0.3
    }
  }

object { PowerCable }
object { PowerCable scale <-1, 1, 1> }

// CAPACITOR BANKS (on base)
#declare CapacitorBank =
  union {
    box {
      <-0.8, 0.3, -1>, <-0.3, 1.5, -0.3>
      pigment { color rgb <0.6, 0.65, 0.7> }
   texture {Future_Chrome}          
    }
    // Glowing power indicator
    sphere {
      <-0.55, 1.2, -0.25>, 0.15
      pigment { color rgb <0.3, 0.8, 1> }
      finish {
        ambient 1.2
        diffuse 0.2
        emission 1.5
      }
    }
  }

object { CapacitorBank }
object { CapacitorBank scale <-1, 1, 1> }

// ELECTROMAGNETIC FIELD EFFECT (along rails when charging)
#declare P = 0;
#while (P < 10)
  sphere {
    <0, 0, 0>, 0.4
    pigment { color rgbt <0.5, 0.7, 1, 0.7> }
    finish {
      ambient 0.8
      diffuse 0
      emission 1.2
    }
    scale <1, 0.3, 0.3>
    rotate <-15, 0, 0>
    translate <0, 2, 2 + P * 1.8>
    no_shadow
  }
  #declare P = P + 1;
#end