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
           
                                
// Random color generator with moving seed
#declare My_seed = seed(now * 100000);    
#macro RandomColor()    
    <rand(My_seed), rand(My_seed), rand(My_seed)>
#end

// Main camera 
camera {
    perspective angle 75   
    location  <2.0 , 5.0, -4.0>  
    right     x*image_width/image_height
    look_at   <-0.5 , 1.0 , 0.0>
}

// Main light
light_source{< 10,10,-10> color White}
              
#macro Stud (brickColor)              
union {
    // Main body
    superellipsoid { 
        <1.0, 0.1>   
        scale <0.3, 0.3, 0.1>
        pigment {color brickColor}
        
        finish { 
            phong 1.0 
            diffuse 0.7
        }
        rotate <90, 0, 0>
    }
        
    // Brand initial on top of cap
    object { 
        Bevelled_Text (
            "Politica_Bold_Italic.ttf", // font file
            "DANI",   // text
            30 ,      // slice
            35,       // taper
            0.045,    // point chamfer
            0.1,      // character depth along z-axis
            0.00,     // increase per character
            0)        // 1 = "merge"
        finish { 
            phong   1.0 
            diffuse 0.7
        }  
        pigment {color brickColor}
        rotate <90, 0, 0>
        scale <0.25, 0.5, 0.25>
        translate <-0.20, 0.13, -0.12>   
    }
}
#end

#macro Brick (brickColor, studWidth, studLength)
union {
    superellipsoid { 
        <0.05, 0.05>
        scale <0.5*studWidth, 0.6, 0.5*studLength>
        pigment {color brickColor}
    translate <0.0, 0.6, 0.0>
    }
    #for (i, 0, studWidth-1)
        #for (j, 0, studLength-1)
            object { 
                Stud (brickColor) 
                translate <i-(studWidth-1)*0.5, 
                           1.3, 
                           j-(studLength-1)*0.5>
            }
        #end
    #end
}         
#end
     
// And now the actual scene.   

object { 
    Brick(RandomColor(), 5, 1)
    translate <0, 0, 0>
}
object { 
    Brick(RandomColor(), 1, 4)
    translate <0, 0, 0>
}

// Marble counter top
superellipsoid { 
    <0.05, 0.05>
    scale <8.0, 0.5, 4.0>
    texture { 
        T_Stone22
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

        
              