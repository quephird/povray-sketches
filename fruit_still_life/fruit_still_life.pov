#version 3.7;
global_settings {
	  assumed_gamma 1.0
}

#include "colors.inc"
#include "functions.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "textures.inc"

#include "apple.inc"
#include "banana.inc"
#include "orange.inc"
#include "pear.inc"
#include "stem.inc"
                                
// Random color generator with moving seed
#declare My_seed = seed(now * 100000);    
#macro RandomColor()    
    <rand(My_seed), rand(My_seed), rand(My_seed)>
#end

// Main camera 
camera {
    perspective angle 75   
    location  <0.0, 8.0, -13.0>  
    right     x*image_width/image_height
    look_at   <0.0, 1.0, 0.0>
}

// Main light
light_source {
	  <10, 10, -10> 
	  color White
}

object {
    Apple(1.5)
    translate <-4, 0, 0>
}

object {
    Pear()
    translate <0, 0, 0>
}

object {
    Orinj()
    translate <4.5, 2, -1>
}

object {
    Banana()
    translate<0, 0, -3>
}


// Table top
superellipsoid { 
    <0.05, 0.05>
    pigment { color LightGrey }
    finish { 
        phong 0.5
        diffuse 0.1
        reflection 0.5
    }
    scale <20.0, 0.5, 10.0>
    translate <0, -0.5, 0>
}
 