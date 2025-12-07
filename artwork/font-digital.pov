// Persistence Of Vision raytracer version 3.5 sample file.
// File by Alexander Enzmann
//
// -w320 -h240
// -w800 -h600 +a0.3

global_settings { assumed_gamma 2.2 charset utf8}


#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

camera {
    location <0.0, 0.0, -2>
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

//#declare CHAR=substr(CHAR_SET,frame_number+1,1)
#declare CHAR=chr(frame_number)

#declare THICKNESS=1.0;

#declare CHAR_TEXT=text{ ttf "digital.ttf", CHAR, THICKNESS, 0}

#declare CHAR_WIDTH=Text_Width("digital.ttf", CHAR, 1, 0);

//#declare CHAR=Circle_Text("font.ttf", substr(CHAR_SET,frame_number+1,1), 1, 0, THICKNESS, 1, 1, Align_Center, 0) 

object {
   CHAR_TEXT          
// pigment{White}
   texture {Future_Chrome}
   no_shadow
   scale <2,1,1>
   translate <-CHAR_WIDTH, -.31, -.9>
}
                  
object { 
    Future_Sky 
    translate <0, -.0, 5>
}
           