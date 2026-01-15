// Mirror Finish Spiral Galaxy - Top Down View
// POV-Ray 3.7

#version 3.7;

global_settings {
  assumed_gamma 1.0
  max_trace_level 20
  radiosity {
    pretrace_start 0.08
    pretrace_end 0.01
    count 60
    error_bound 0.4
    recursion_limit 2
  }
}

// Camera - directly above looking down
camera {
  location <0, 30, 0>
  look_at <0, 0, 0>
  angle 55
}

// Main light from above
light_source {
  <0, 35, 0>
  color rgb <1.2, 1.2, 1.2>
}

// Side lights for better reflections
light_source {
  <25, 20, 25>
  color rgb <0.5, 0.5, 0.6>
}

light_source {
  <-25, 20, -25>
  color rgb <0.5, 0.5, 0.6>
}

light_source {
  <25, 20, -25>
  color rgb <0.4, 0.4, 0.5>
}

light_source {
  <-25, 20, 25>
  color rgb <0.4, 0.4, 0.5>
}

// Deep space background
sky_sphere {
  pigment {
    granite
    color_map {
      [0.000 color rgb <0, 0, 0.01>]
      [0.600 color rgb <0, 0, 0.01>]
      [0.800 color rgb <0.2, 0.2, 0.4>]
      [0.900 color rgb <0.5, 0.5, 0.7>]
      [0.980 color rgb <0.8, 0.8, 1>]
      [1.000 color rgb <1, 1, 1>]
    }
    scale 0.002
  }
}

// Distant stars layer
sky_sphere {
  pigment {
    bozo
    color_map {
      [0.0 color rgbt <0, 0, 0, 1>]
      [0.985 color rgbt <0, 0, 0, 1>]
      [0.993 color rgbt <0.7, 0.7, 1, 0>]
      [1.0 color rgbt <1, 1, 1, 0>]
    }
    scale 0.006
    turbulence 0.6
  }
}

// Premium mirror finish
#declare PremiumMirror = finish {
  ambient 0.15
  diffuse 0.25
  reflection {
    0.92
    metallic
  }
  specular 1.0
  roughness 0.0008
  metallic
}

// Gold-tinted mirror for core
#declare GoldMirror = finish {
  ambient 0.25
  diffuse 0.2
  reflection {
    0.95
    metallic
  }
  specular 1.0
  roughness 0.0005
  metallic
}

// Galactic core (brilliant mirror center)
sphere {
  <0, 0, 0>, 1.5
  pigment { 
    radial
    frequency 6
    color_map {
      [0.0 color rgb <1.8, 1.5, 1.2>]
      [0.4 color rgb <1.6, 1.3, 1.0>]
      [0.7 color rgb <1.4, 1.2, 0.95>]
      [1.0 color rgb <1.8, 1.5, 1.2>]
    }
  }
  finish { 
    GoldMirror
    emission 1.2
  }
}

// Inner core bulge
sphere {
  <0, 0, 0>, 2.3
  pigment { 
    spherical
    color_map {
      [0.0 color rgb <1.4, 1.2, 0.95>]
      [0.4 color rgb <1.2, 1.0, 0.85>]
      [0.7 color rgb <1.0, 0.9, 0.75>]
      [1.0 color rgbt <0.9, 0.8, 0.7, 0.4>]
    }
  }
  finish { 
    GoldMirror
    emission 0.7
  }
}

// Primary spiral arm A (blue region)
disc {
  <0, 0.1, 0>, <0, 1, 0>, 14, 2.8
  pigment {
    spiral1 8
    color_map {
      [0.0 color rgbt <0, 0, 0, 1>]
      [0.22 color rgb <0.3, 0.4, 0.95>]
      [0.35 color rgb <0.5, 0.6, 1>]
      [0.45 color rgb <0.65, 0.75, 1>]
      [0.55 color rgb <0.55, 0.65, 0.98>]
      [0.68 color rgb <0.4, 0.5, 0.9>]
      [0.78 color rgbt <0.25, 0.35, 0.8, 0.4>]
      [1.0 color rgbt <0, 0, 0, 1>]
    }
    turbulence 0.5
    scale 2.5
  }
  finish { 
    PremiumMirror
    emission 0.8
  }
  normal {
    ripples 0.15
    scale 1.2
  }
}

// Primary spiral arm B (pink/magenta region)
disc {
  <0, -0.1, 0>, <0, 1, 0>, 13.5, 2.9
  pigment {
    spiral2 7
    color_map {
      [0.0 color rgbt <0, 0, 0, 1>]
      [0.24 color rgb <0.95, 0.5, 0.7>]
      [0.37 color rgb <1, 0.7, 0.85>]
      [0.47 color rgb <1, 0.8, 0.9>]
      [0.57 color rgb <0.98, 0.65, 0.8>]
      [0.7 color rgb <0.9, 0.55, 0.7>]
      [0.8 color rgbt <0.8, 0.4, 0.6, 0.4>]
      [1.0 color rgbt <0, 0, 0, 1>]
    }
    turbulence 0.6
    scale 2.3
  }
  finish { 
    PremiumMirror
    emission 0.75
  }
  rotate <0, 40, 0>
  normal {
    bumps 0.12
    scale 0.9
  }
}

// Secondary spiral structure C (cyan tints)
disc {
  <0, 0.05, 0>, <0, 1, 0>, 12.8, 3.0
  pigment {
    spiral1 11
    color_map {
      [0.0 color rgbt <0, 0, 0, 1>]
      [0.28 color rgb <0.4, 0.7, 0.95>]
      [0.4 color rgb <0.55, 0.8, 1>]
      [0.5 color rgb <0.6, 0.85, 1>]
      [0.6 color rgbt <0.45, 0.7, 0.95, 0.3>]
      [0.75 color rgbt <0.3, 0.6, 0.9, 0.6>]
      [1.0 color rgbt <0, 0, 0, 1>]
    }
    turbulence 0.75
    scale 2.0
  }
  finish { 
    PremiumMirror
    emission 0.65
  }
  rotate <0, -30, 0>
}

// Secondary spiral structure D (violet tints)
disc {
  <0, -0.05, 0>, <0, 1, 0>, 12.3, 3.1
  pigment {
    spiral2 9
    color_map {
      [0.0 color rgbt <0, 0, 0, 1>]
      [0.26 color rgb <0.7, 0.4, 0.95>]
      [0.39 color rgb <0.85, 0.6, 1>]
      [0.49 color rgb <0.9, 0.7, 1>]
      [0.59 color rgbt <0.75, 0.5, 0.95, 0.35>]
      [0.73 color rgbt <0.6, 0.35, 0.85, 0.6>]
      [1.0 color rgbt <0, 0, 0, 1>]
    }
    turbulence 0.7
    scale 2.1
  }
  finish { 
    PremiumMirror
    emission 0.6
  }
  rotate <0, 65, 0>
}

// Dust lanes (dark reflective bands)
disc {
  <0, 0, 0>, <0, 1, 0>, 11.5, 2.7
  pigment {
    spiral1 10
    color_map {
      [0.0 color rgbt <0, 0, 0, 1>]
      [0.3 color rgb <0.2, 0.18, 0.15>]
      [0.42 color rgb <0.32, 0.28, 0.24>]
      [0.5 color rgb <0.38, 0.33, 0.28>]
      [0.58 color rgb <0.28, 0.24, 0.2>]
      [0.7 color rgbt <0.18, 0.15, 0.12, 0.5>]
      [1.0 color rgbt <0, 0, 0, 1>]
    }
    turbulence 0.45
    scale 2.2
  }
  finish { 
    ambient 0.08
    diffuse 0.15
    reflection {
      0.75
      metallic
    }
    specular 0.9
    roughness 0.004
    metallic
  }
  rotate <0, 22, 0>
}

// Outer spiral wisps (faint extended arms)
disc {
  <0, 0.12, 0>, <0, 1, 0>, 15, 3.5
  pigment {
    spiral1 6
    color_map {
      [0.0 color rgbt <0, 0, 0, 1>]
      [0.32 color rgbt <0.45, 0.55, 0.95, 0.75>]
      [0.44 color rgbt <0.6, 0.7, 1, 0.6>]
      [0.52 color rgbt <0.55, 0.65, 0.95, 0.65>]
      [0.65 color rgbt <0.4, 0.5, 0.85, 0.8>]
      [1.0 color rgbt <0, 0, 0, 1>]
    }
    turbulence 1.1
    scale 3.2
  }
  finish { 
    PremiumMirror
    emission 0.45
  }
  rotate <0, -52, 0>
}

// Highly reflective star clusters
#declare ChromeCluster = sphere {
  <0, 0, 0>, 0.18
  pigment { color rgb <1.1, 1.1, 1.05> }
  finish {
    ambient 0.6
    diffuse 0.15
    reflection {
      0.98
      metallic
    }
    specular 1.0
    roughness 0.0003
    metallic
    emission 1.6
  }
}

// Distribute chrome clusters in spiral pattern
#declare I = 0;
#while (I < 80)
  #declare Angle = I * 360/80 + rand(seed(777)) * 30;
  #declare Radius = 3.0 + rand(seed(I+888)) * 9.5;
  #declare Y = (rand(seed(I+999)) - 0.5) * 0.35;
  
  object {
    ChromeCluster
    scale 0.5 + rand(seed(I+1111)) * 1.0
    translate <Radius * cos(radians(Angle)), Y, Radius * sin(radians(Angle))>
  }
  
  #declare I = I + 1;
#end

// Brilliant core star regions
#declare J = 0;
#while (J < 12)
  sphere {
    <0, 0, 0>, 0.22
    pigment { color rgb <1.3, 1.2, 1.05> }
    finish {
      ambient 0.9
      diffuse 0.08
      reflection {
        0.99
      metallic
      }
      specular 1.0
      roughness 0.0002
      metallic
      emission 2.0
    }
    translate <
      1.8 * cos(radians(J * 30)),
      (rand(seed(J+2222)) - 0.5) * 0.25,
      1.8 * sin(radians(J * 30))
    >
  }
  #declare J = J + 1;
#end

// Galactic halo (subtle outer glow)
disc {
  <0, 0, 0>, <0, 1, 0>, 16, 1.0
  pigment {
    radial
    frequency 3
    color_map {
      [0.0 color rgbt <0.35, 0.45, 0.65, 0.93>]
      [0.5 color rgbt <0.3, 0.4, 0.6, 0.96>]
      [1.0 color rgbt <0.35, 0.45, 0.65, 0.93>]
    }
  }
  finish {
    ambient 0.25
    diffuse 0.08
    reflection {
      0.6
      metallic
    }
    specular 0.7
    roughness 0.008
    metallic
    emission 0.25
  }
  hollow
}

// Additional reflective layer for depth and complexity
disc {
  <0, -0.18, 0>, <0, 1, 0>, 13.8, 2.6
  pigment {
    spiral2 8
    color_map {
      [0.0 color rgbt <0, 0, 0, 1>]
      [0.27 color rgbt <0.55, 0.65, 0.95, 0.82>]
      [0.41 color rgbt <0.7, 0.8, 1, 0.68>]
      [0.51 color rgbt <0.75, 0.85, 1, 0.72>]
      [0.61 color rgbt <0.6, 0.7, 0.95, 0.78>]
      [0.76 color rgbt <0.45, 0.55, 0.85, 0.88>]
      [1.0 color rgbt <0, 0, 0, 1>]
    }
    turbulence 0.68
    scale 2.4
  }
  finish {
    ambient 0.18
    diffuse 0.22
    reflection {
      0.88
      metallic
    }
    specular 0.95
    roughness 0.002
    metallic
    emission 0.52
  }
  rotate <0, 75, 0>
}