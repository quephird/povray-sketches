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


// Orange
sphere {
    <4.5, 2, -1>, 2
    material { M_Glass3 }
    pigment { rgbf <0.8, 0.5, 0.2, 0.95> }
    finish {
    	  phong 0.9
    	  phong_size 40
        reflection 0.2
    }
    interior{ ior 1.5 }
}

//Banana
sphere_sweep {
    b_spline
    12, 
    <-4, 1.0, -3.0>, 0.3
    <-3, 1.0, -2.0>, 0.3
    <-2, 1.0, -1.0>, 1.0
    <-1, 1.0, 0.0>, 1.0
    <0.0, 1.0, 0.5>, 1.0
    <1.0, 1.0, 0.5>, 1.0
    <2.0, 1.0, 0.0>, 1.0
    <2.5, 1.0, -1.0>, 0.8
    <3.0, 1.0, -1.2>, 0.4
    <3.5, 1.0, -1.5>, 0.3
    <3.8, 1.0, -1.7>, 0.3
    <4.0, 1.0, -2.0>, 0.3
    pigment { rgbf <0.9, 0.9, 0.0, 0.95> }
    finish {
        phong 0.9
        phong_size 40
        reflection 0.2
    }
    interior { ior 1.5 }
    translate<0, 0, -3>
    rotate <0, 0, -10>
}

// Table top
superellipsoid { 
    <0.05, 0.05>
    scale <20.0, 0.5, 10.0>
    pigment { color LightGrey }
    finish { 
        phong 0.5
        diffuse 0.1
        reflection 0.5
    }
    rotate <0, 0, 0>
}
 