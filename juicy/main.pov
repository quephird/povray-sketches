#version 3.7;
global_settings { assumed_gamma 1.0 }

#include "colors.inc"
#include "functions.inc"
#include "glass.inc"          
#include "metals.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "shapesq.inc"
#include "stones.inc"
#include "textures.inc"

#include "includes/bottles.inc"
                                
// Random color generator with moving seed
#declare My_seed = seed(now * 100000);    
#macro RandomColor()    
    <rand(My_seed), rand(My_seed), rand(My_seed)>
#end

// Main camera 
camera {
    perspective angle 75
    right     x*image_width/image_height
    location  <0.0, 4.0, -4.0>
    look_at   <0.0, 2.0, 0.0>
}

// Main light
light_source{
	  < 10, 10, -10>
	  color White
}

object { 
    LaLaBottle(2.0, 2.4, 1.2)
    rotate    <0, 10, 0>
    translate <0, 0, 0.0>
}

// Marble counter top
superellipsoid { 
    <0.05, 0.05>
    scale <8.0, 0.5, 4.0>
    texture { 
        White_Marble
        scale 4   
        finish { 
            reflection {.01, .1}
        }
    }
    rotate <0, 0, 0>        
    translate <0, -0.5, 2>
}
   
// Rear wall         
plane {        
    <0, 0, 1>, 1      
    pigment {color <0.9, 0.9, 0.9>}             
    rotate <0, 0, 0>        
    translate <0, 0, 5.5>
}

// Mirrors
box { 
    <-9.1, 2.0, -1.0>, <-3.1, 15, -1.0>
    rotate <0, 0, 0>        
    texture {T_Silver_1C}
    translate <0, 0, 7>
}
box { 
    <-3.0, 2.0, -1.0>, <3.0, 15, -1.0>
    rotate <0, 0, 0>        
    texture {T_Silver_1C}
    translate <0, 0, 7>
}
box { 
    <3.1, 2.0, -1.0>, <9.1, 15, -1.0>
    rotate <0, 0, 0>        
    texture {T_Silver_1C}
    translate <0, 0, 7>
}
        
              