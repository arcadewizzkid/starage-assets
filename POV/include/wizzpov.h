#declare Future_Sunset =  
texture {
    pigment {
            //image_map {jpeg "sunset.jpg"} 
            gradient -y
            turbulence <0, .2, 0>
            color_map {
              [0.0 color <0.01 0.0 0.05>]
              [0.5 color <0.4 0.2 0.3>]
              [0.5 color <0.0 0.5 0.5>]
              [1.0 color <0.9 0.9 1.0>]
            }
            scale 25
    }
    finish {
        ambient 1.0
    }
}  

#declare Future_Chrome = 
texture {
    //pigment { rgb <0.658824, 0.658824, 0.658824> }
    pigment { rgb <0.658824, 0.658824, 0.658824> }
    finish {
        ambient 0.1
        diffuse 0.6
        reflection 0.9
        brilliance 6
        specular 0.7
        roughness 0.005
  
    }
}


#declare Future_Sky = 
difference {
    sphere {
      <0, 0, 0>, 10
    }
    sphere {
      <0, 0, 0.5>, 10
    }
    texture { Future_Sunset }
    no_shadow
  }  
  
#declare Green_Sunset =  
texture {
    pigment {
            gradient -y
            turbulence <0, .2, 0>
            color_map {
              [0.0 color <0.01 0.05 0.00>]
              [0.5 color <0.4 0.3 0.2>]
              [0.5 color <0.0 0.5 0.2>]
              [1.0 color <0.9 1.0 0.9>]
            }
            scale 25
    }
    finish {
        ambient 1.0
    }
}  

#declare Green_Sky = 
difference {
    sphere {
      <0, 0, 0>, 10
    }
    sphere {
      <0, 0, 0.5>, 10
    }
    texture { Green_Sunset }
    no_shadow
  }
  
#declare Grey_Sunset =  
texture {
    pigment {
            gradient -y
            turbulence <0, .2, 0>
            color_map {
              [0.0 color <0.1 0.1 0.1>]
              [0.5 color <0.3 0.3 0.3>]
              [0.5 color <0.5 0.5 0.5>]
              [1.0 color <1.0 1.0 1.0>]
            }
            scale 25
    }
    finish {
        ambient 1.0
    }
}  

#declare Grey_Sky = 
difference {
    sphere {
      <0, 0, 0>, 10
    }
    sphere {
      <0, 0, 0.5>, 10
    }
    texture { Grey_Sunset }
    no_shadow
  } 
      
#declare Red_Sunset =  
texture {
    pigment {
            gradient -y
            turbulence <0, .2, 0>
            color_map {
              [0.0 color <0.1 0.01 0.01>]
              [0.5 color <0.3 0.05 0.05>]
              [0.5 color <0.5 0.1 0.1>]
              [1.0 color <1.0 0.2 0.2>]
            }
            scale 25
    }
    finish {
        ambient 1.0
    }
}  

#declare Red_Sky = 
difference {
    sphere {
      <0, 0, 0>, 10
    }
    sphere {
      <0, 0, 0.5>, 10
    }
    texture { Red_Sunset }
    no_shadow
  } 
        
#declare CHAR_SET="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- .:,;@%<>()*#©!"
     