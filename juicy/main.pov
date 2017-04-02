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

// Main camera 
camera {
    perspective angle 75
    right     x*image_width/image_height
    location  <0.0, 4.0, -12.0>
    look_at   <0.0, 2.0, 0.0>
}

// Main light
light_source{
	  < 10, 10, -10>
	  color White
}

// Peace, Love, and Juicy Couture
object {
    LaLaBottle(2.0, 2.4, 1.2, <1.0, 1.0, 1.0, 1.0>)
    rotate    <0, 4, 0>
    translate <-6.5, 0, 0.0>
}

// Malibu
object {
    LaLaBottle(1.2, 3.6, 1.2, <1.0, 0.8, 0.7, 1.0>)
    rotate    <0, -5, 0>
    translate <-2.7, 0, 0.0>
}

// Viva La Juicy
object {
    LaLaBottle(1.2, 3.6, 1.2, <1.0, 1.0, 1.0, 1.0>)
    rotate    <0, 3, 0>
    translate <-1.3, 0, 0.0>
}

// Hollywood Royal
object {
    LaLaBottle(1.2, 3.6, 1.2, <1.0, 1.0, 1.0, 1.0>)
    rotate    <0, 5, 0>
    translate <0.0, 0, 0.0>
}

// La La Malibu
object {
    LaLaBottle(1.0, 3.0, 1.0, <1.0, 0.7, 0.7, 1.0>)
    rotate    <0, 3, 0>
    translate <1.3, 0, 0.0>
}

// La La
object {
    LaLaBottle(2.0, 2.4, 1.2, <1.0, 0.9, 0.8, 1.0>)
    rotate    <0, 2, 0>
    translate <3.0, 0, 0.0>
}

// ???
object {
    LaLaBottle(2.0, 2.4, 1.2, <1.0, 0.9, 0.6, 1.0>)
    rotate    <0, -6, 0>
    translate <4.9, 0, 0.0>
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
        
              