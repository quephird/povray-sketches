#version 3.7;
global_settings {
	  assumed_gamma 1.0
}

#include "colors.inc"
#include "functions.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "textures.inc"
#include "woods.inc"

#include "apple.inc"
#include "banana.inc"
#include "bowl.inc"
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
    location  <0.0, 8, -25.0>
//    location  <0.0, 25, 0.0>
    right     x*image_width/image_height
    look_at   <0.0, 2.5, 0.0>
}

// Main light
light_source {
    <10, 10, -10>
    color White
}

object {
    Bowl()
    translate <-2, 0 ,0>
}

object {
    Apple(1.5)
    translate <-5, 4.0, 2.7>
}

object {
    Pear()
    translate <-2, 4.0, 4.0>
}

object {
    Orinj(1.5)
    translate <2.5, 4.0, 2.2>
}

object {
    Banana()
    rotate<0, 100, 0>
    translate<6, 0, -3>
}
object {
    Banana()
    scale <0.9, 0.9, 0.9>
    rotate <0, 0, 180>
    rotate <0, 95, 0>
    translate <9.5, 2.0, -3>
}


// Table top
superellipsoid { 
    <0.05, 0.05>
    texture {
        T_Wood19
        scale 0.1
    }
    finish { 
        phong 0.5
        diffuse 0.1
        reflection 0.5
    }
    scale <20.0, 0.5, 10.0>
    translate <0, -0.5, 0>
}
 