#version 3.7;
global_settings {
	  assumed_gamma 1.0
}

#include "colors.inc"
#include "functions.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "stones.inc"
#include "textures.inc"
           
                                
// Random color generator with moving seed
#declare My_seed = seed(now * 100000);    
#macro RandomColor()    
    <rand(My_seed), rand(My_seed), rand(My_seed)>
#end

// Main camera 
camera {
    perspective angle 75   
    location  <0.0, 8.0, -10.0>  
    right     x*image_width/image_height
    look_at   <0.0, 1.0, 0.0>
}

// Main light
light_source {
	  <10, 10, -10> 
	  color White
}
   
//isosurface {
//		function { pow(1-pow(x*x + z*z, 0.5),2.0) + 0.5*y*y - 2}
//    contained_by { box { <-2.4, -2.1, -2.4>, <2.4, 2.1, 2.4> } }
////    contained_by { sphere { <0,2.5,0>, 2.5 } }
////    translate <0, 1, 0>
//    pigment { rgbf <0.9, 0.3, 0.3, 0.95> }
//    finish {
//    	  phong 0.9 
//    	  phong_size 40 
//    	  reflection 0.2 
//    }
//    interior { ior 1.5 }
//}

// Red apple
// Maybe use difference with sphere and upside down cone
sphere {
    <-4, 2, -1>, 2
    material { M_Glass3 }
    pigment { rgbf <0.9, 0.3, 0.3, 0.95> }
    finish {
    	  phong 0.9 
    	  phong_size 40 
    	  reflection 0.2 
    }
    interior { ior 1.5 }
}

//// Pear
sphere_sweep {
    linear_spline
    3, 
    <0, 2.00, 0>, 2.0
    <0, 3.0, 0>, 1.5
    <0, 5, 0>, 0.75
    pigment { rgbf <0.7, 0.9, 0.5, 0.95> }
    finish {
    	  phong 0.9 
    	  phong_size 40 
    	  reflection 0.2 
    }
    interior { ior 1.5 }
    translate<0, 0, 0>
    rotate <0, 0, -10>
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
 