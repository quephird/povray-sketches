#version 3.7;
global_settings { assumed_gamma 1.0 }

#include "colors.inc"
#include "functions.inc"
#include "glass.inc"          
#include "metals.inc"
#include "shapes.inc"
#include "shapes2.inc"
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
    location  <2.0 , 3.0, -5.0>  
    right     x*image_width/image_height
    look_at   <-0.5 , 1.0 , 0.0>
}

// Main light
light_source{
	  < 10,10,-10>
	  color White
}

// And now the actual scene.   
object { 
    KeflonBottle( 
        RandomColor()) 
    translate <-3.5, 0, 0.0>
}
object { 
    MimaniBottle( 
        RandomColor())  
    translate <-0.6, 0, -0.5>
    rotate    <0, 20-40*rand(My_seed), 0>
}
object { 
    DanieBottleCapOn( 
        RandomColor(), 
        360*rand(My_seed)) 
    rotate    <0, 20-40*rand(My_seed), 0>
    translate <-1, 0, 1.0>
}
object { 
    DanieBottleCapOn( 
        RandomColor(), 
        360*rand(My_seed))   
    rotate    <0, 20-40*rand(My_seed), 0>
    translate <0, 0, 1.0>
}
object { 
    KeflonBottle( 
        RandomColor()) 
    translate <1, 0, 0.5>
}
object { 
    DanieBottle( 
        RandomColor(), 
        360*rand(My_seed))  
    rotate    <0, 20-40*rand(My_seed), 0>
    translate <2, 0, 1.0>
}

// This one bottle is on its side...

#declare bottleOnSideColor = RandomColor();
object { 
    DanieBottle( 
       bottleOnSideColor, 
       360*rand(My_seed)) 
    rotate    <-90-20*rand(My_seed), 0, 90>
    translate <-2, 0.5, 0.5>
}
superellipsoid { 
    <1.0, 0.9>   
    scale <0.4, 0.4, 0.05>
    pigment {
    	  color bottleOnSideColor
    }
    rotate <90, 0, 0>
    translate <-1.75, 0, -0.75>
}

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
        
              