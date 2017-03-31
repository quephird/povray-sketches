#version 3.7;
global_settings { assumed_gamma 1.0 }

#include "colors.inc"
#include "functions.inc"
#include "glass.inc"          
                                
// Main camera 
camera {
    perspective angle 75
    right     x*image_width/image_height
    location  <2.0, -0.5, -1.0>
    look_at   <0.0, 0.2, -0.2>
}

background { color <0.0, 0.0, 0.0> }

// Main light
light_source{
	  < 10, 10, -10>
	  color White
}

#macro Heart(heartColor, boxLowerBounds, boxUpperBounds)
isosurface {
    function {
        sqrt(pow(x*2.5,2) + z*z + pow(abs(y*1.1-0.8*sqrt(sqrt(z*z+pow(x/2,2)/(pow(abs(y+1.4),4)+0.001)))), 2))-1
    }
    accuracy 0.005
    max_gradient 5
    contained_by {
    	  box {
    	  	boxLowerBounds, boxUpperBounds
    	  }
    }
    max_trace 10 all_intersections
		interior { ior 1.5 }
		pigment { color heartColor }
		finish { 
		    phong 1.0 
		    diffuse 0.7
		    reflection 0.3
    }
}
#end

object { Heart(rgbf <0.4, 0.8, 1.0, 0.7>, <-1.5, 0.9, -1.5>, <1.5, 1.5, 1.5>) }
object { Heart(rgbf <1.0, 0.6, 0.6, 0.7>, <-1.5, 0.5, -1.5>, <1.5, 0.8, 1.5>) }
object { Heart(rgbf <1.0, 1.0, 1.0, 0.7>, <-1.5, 0.1, -1.5>, <1.5, 0.4, 1.5>) }
object { Heart(rgbf <1.0, 0.6, 0.6, 0.7>, <-1.5, -0.3, -1.5>, <1.5, -0.0, 1.5>) }
object { Heart(rgbf <0.4, 0.8, 1.0, 0.7>, <-1.5, -1.5, -1.5>, <1.5, -0.4, 1.5>) }



