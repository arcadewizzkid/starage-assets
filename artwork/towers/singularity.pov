// Black Hole with Accretion Disk
// POV-Ray 3.7

#version 3.7;

global_settings {
  assumed_gamma 1.0
  max_trace_level 10
}

// Camera
camera {
  location <0, 3, -8>
  look_at <0, 0, 0>
  angle 45
}

// Lights
light_source {
  <10, 20, -30>
  color rgb <1, 1, 1>
}

light_source {
  <-15, 10, -20>
  color rgb <0.3, 0.3, 0.4>
}

// Starfield background
sky_sphere {
  pigment {
    granite
    color_map {
      [0.0 color rgb <0, 0, 0>]
      [0.5 color rgb <0, 0, 0>]
      [0.6 color rgb <0.8, 0.8, 1>]
      [1.0 color rgb <1, 1, 1>]
    }
    scale 0.01
  }
}

// Black hole event horizon (perfectly black sphere)
sphere {
  <0, 0, 0>, 1
  pigment { color rgb <0, 0, 0> }
  finish {
    ambient 0
    diffuse 0
  }
  no_shadow
}

// Photon sphere glow (gravitational lensing effect)
sphere {
  <0, 0, 0>, 1.5
  pigment { color rgbt <1, 0.8, 0.6, 0.95> }
  finish {
    ambient 1.5
    diffuse 0
  }
  hollow
  no_shadow
}

// Outer glow halo
sphere {
  <0, 0, 0>, 2.0
  pigment { color rgbt <1, 0.6, 0.3, 0.98> }
  finish {
    ambient 0.8
    diffuse 0
  }
  hollow
  no_shadow
}

// Accretion disk
disc {
  <0, 0, 0>, <0, 1, 0>, 4.5, 1.6
  pigment {
    radial
    frequency 8
    color_map {
      [0.0 color rgbt <1, 0.3, 0.1, 0.3>]
      [0.3 color rgbt <1, 0.5, 0.2, 0.4>]
      [0.5 color rgbt <1, 0.7, 0.3, 0.5>]
      [0.7 color rgbt <0.8, 0.4, 0.1, 0.6>]
      [1.0 color rgbt <1, 0.3, 0.1, 0.3>]
    }
    turbulence 0.5
    scale 2
  }
  finish {
    ambient 0.6
    diffuse 0.4
    emission 0.8
  }
  normal {
    ripples 0.3
    scale 0.5
  }
  rotate <0, 0, 0>
}

// Inner accretion disk (hotter, brighter)
disc {
  <0, 0, 0>, <0, 1, 0>, 2.2, 1.6
  pigment {
    radial
    frequency 12
    color_map {
      [0.0 color rgbt <1, 1, 0.8, 0.2>]
      [0.4 color rgbt <1, 0.8, 0.4, 0.3>]
      [0.7 color rgbt <1, 0.5, 0.2, 0.4>]
      [1.0 color rgbt <1, 1, 0.8, 0.2>]
    }
    turbulence 0.7
  }
  finish {
    ambient 1.2
    diffuse 0.2
    emission 1.5
  }
  rotate <0, 0, 0>
}

// Particle jets (slightly visible)
cone {
  <0, 1.6, 0>, 0.2
  <0, 8, 0>, 0.6
  pigment {
    color rgbt <0.6, 0.8, 1, 0.85>
  }
  finish {
    ambient 0.8
    diffuse 0.1
    emission 0.5
  }
  no_shadow
}

cone {
  <0, -1.6, 0>, 0.2
  <0, -8, 0>, 0.6
  pigment {
    color rgbt <0.6, 0.8, 1, 0.85>
  }
  finish {
    ambient 0.8
    diffuse 0.1
    emission 0.5
  }
  no_shadow
}