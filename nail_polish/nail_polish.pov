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
//    location  <2.0 , 3.0, -5.0>  
//    look_at   <-0.5 , 1.0 , 0.0>
    location  <-1.5 , 1.0, -3.0>  
    look_at   <-2.5 , 0.0 , 0.0>
}

// Main light
light_source{
	  < 10,10,-10>
	  color White
}

// And now the actual scene.
//object {
//    KeflonBottle( 
//        RandomColor()) 
//    translate <-3.5, 0, 0.0>
//}
//object { 
//    MimaniBottle( 
//        RandomColor())  
//    translate <-0.6, 0, -0.5>
//    rotate    <0, 20-40*rand(My_seed), 0>
//}
//object { 
//    DanieBottleCapOn( 
//        RandomColor(), 
//        360*rand(My_seed)) 
//    rotate    <0, 20-40*rand(My_seed), 0>
//    translate <-1, 0, 1.0>
//}
//object { 
//    DanieBottleCapOn( 
//        RandomColor(), 
//        360*rand(My_seed))   
//    rotate    <0, 20-40*rand(My_seed), 0>
//    translate <0, 0, 1.0>
//}
//object { 
//    KeflonBottle( 
//        RandomColor()) 
//    translate <1, 0, 0.5>
//}
//object { 
//    DanieBottle( 
//        RandomColor(), 
//        360*rand(My_seed))  
//    rotate    <0, 20-40*rand(My_seed), 0>
//    translate <2, 0, 1.0>
//}

#macro StreamFromBottle (polishColor, streamHeight, spillRadius)
union {
		isosurface {
		    function { 0.01*(pow(y,6) - pow(y,4) + 4*pow(z,2) + 4*pow(x,2)-0.02) }
        translate <0, 1.8*streamHeight, 0>
		    scale <0.5*streamHeight, 0.5*streamHeight, 0.5*streamHeight>
		}
		superellipsoid {
		    <1.0, 0.9>
		    scale <spillRadius, spillRadius, 0.05>
		    rotate <90, 0, 0>
		}
    pigment {
        color polishColor
    }
}
#end

// This one bottle is on its side
#declare bottleOnSideColor = RandomColor();
object { 
    DanieBottle( 
        bottleOnSideColor, 
        360*rand(My_seed)) 
    rotate    <-100, 0, 90>
    translate <-2, 0.5, 0.5>
}
object {
    StreamFromBottle(
        bottleOnSideColor,
        0.45
        0.4)
    translate <-1.75, 0, -1.0>
}
// Polish spill from bottle
//superellipsoid {
//    <1.0, 0.9>
//    scale <0.4, 0.4, 0.05>
//    pigment {
//        color bottleOnSideColor
//    }
//    rotate <90, 0, 0>
//    translate <-1.75, 0, -0.75>
//}

// This one cap is on its side too
//object { 
//    DanieCap(bottleOnSideColor)
//    rotate    <20, 0, 90>
//    translate <-3, 0.3, -1.5>
//}
//
//// Polish spill from end of brush
//superellipsoid { 
//    <1.0, 0.9>   
//    scale <0.2, 0.2, 0.05>
//    pigment {
//    	  color bottleOnSideColor
//    }
//    rotate <90, 0, 0>
//    translate <-1.5, 0, -2.0>
//}


// Marble counter top
superellipsoid { 
    <0.05, 0.05>
    scale <8.0, 0.5, 4.0>
    texture { 
        T_Stone24
        scale 4   
        finish { 
            reflection {.01, .1}
        }
    }
    rotate <0, -25, 0>        
    translate <-1, -0.5, 2>
}
   
// Rear wall         
plane {        
    <0, 0, 1>, 1      
    pigment {color <0.5, 0.5, 0.8>}             
    rotate <0, -25, 0>        
    translate <-1, 0, 5.5>
}

// Mirror        
box { 
    <-10, 0.0, -0.5>, <5.0, 5, -0.5>
    rotate <0, -25, 0>        
    texture {T_Silver_1C}
    translate <-1, 0, 7>
}
        
              