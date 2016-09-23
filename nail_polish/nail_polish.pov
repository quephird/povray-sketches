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

#include "includes/caps.inc"
                                
// Random color generator with moving seed
#declare My_seed = seed(now * 100000);    
#macro RandomColor()    
    <rand(My_seed), rand(My_seed), rand(My_seed)>
#end

// Main camera 
camera {
    perspective angle 75   
    location  <2.0 , 3.0, -4.0>  
    right     x*image_width/image_height
    look_at   <-0.5 , 1.0 , 0.0>
}

// Main light
light_source{< 10,10,-10> color White}
              
              
#macro DanieBottle (nailColor, capAngleY)
union {   
    object {
        DanieCap ()
        translate <0, 1.5, 0>
        rotate <0, capAngleY, 0>
    }

    // Bottle   
    difference {
        // Main body
        superellipsoid { 
            <0.25, 0.25>
            scale <0.45, 0.5, 0.45>
            material { M_Glass3 }
            finish { 
                phong 1.0 
                diffuse 0.7
                reflection 0.3
            }
            translate <0,0.5,0>
        }
        // Rectangular cutout
        superellipsoid { 
            <0.1, 0.1>
            scale <0.2, 0.42, 0.05>
            material { M_Glass3 }
            finish { 
                phong 1.0 
                diffuse 0.7
                reflection 0.3
            }
            translate <0.18, 0.5, -0.45>
        }
    }

    // Nail polish  
    superellipsoid { 
        <0.25, 0.25>
        scale <0.35, 0.4, 0.35>
        pigment {color nailColor}
        translate <0,0.5,0>
    }

    // Side label
    object { 
        Bevelled_Text (
            "texgyreadventor-regular.ttf", // font file
            "danie",  // text
            10 ,      // slice
            35,       // taper
            0.045,    // point chamfer
            0.1,      // character depth along z-axis
            0.00,     // increase per character
            0)        // 1 = "merge"
        material { M_Glass3 }
        finish { 
            phong 1.0 
            diffuse 1.0
            reflection 0.1
        }
        rotate <0, 0, 90>
        scale <0.27, 0.27, 0.27>
        translate <0.25, 0.1, -0.42>   
    }
}
#end

#macro KeflonBottle (nailColor)
union {
    object {
        KeflonCap ()
        translate <0, 1.5, 0>
    }

    // Main body   
    object {           
    Round_Cone(
        <0, 0, 0>, 0.6    // Center and radius of one end
        <0, 1.0, 0>, 0.4    // Center and radius of other end
        0.05, // rounding radius,
        1)
    material { M_Glass3 }
    }  
        
    // Nail polish
    object {           
    Round_Cone(
        <0, 0.1, 0>, 0.5    // Center and radius of one end
        <0, 0.95, 0>, 0.38    // Center and radius of other end
        0.05, // rounding radius,
        1)
    pigment {color nailColor}
    } 
ls }
#end

#macro MimaniBottle (nailColor)
union {
    // Glass body    
    object{
        Round_Cone(
            <0, 0, 0>, 0.4
            <0, 1.0, 0>, 0.5
            0.15,
            1)
        material { M_Glass3 }
        scale <1, 1, 0.6>         
    }
    // Polish
    object{
        Round_Cone(
            <0, 0, 0>, 0.3
            <0, 0.9, 0>, 0.4
            0.15,
            1)
        pigment {color nailColor}
        scale <1, 1, 0.6>         
        translate <0, 0.1, 0>         
    }
    // Cap    
    object{
        Round_Cone(
            <0, 0, 0>, 0.22
            <0, 1.0, 0>, 0.17 
            0.02, // rounding radius,
            1)
        pigment { BrightGold }
        finish {
            ambient .1
            diffuse .1
            specular 1
            roughness .1
            reflection { 0.75 }
        }
    scale <1, 1, 1>                          
    translate <0, 1.0, 0>         
    }
}
#end
     
// And now the actual scene.   


object { 
    KeflonBottle( 
        RandomColor()) 
    translate <-3.5, 0, -1.0>
}
// This one bottle is on its side...  
object { 
    DanieBottle( 
       RandomColor(), 
       360*rand(My_seed)) 
    rotate    <-90-20*rand(My_seed), 0, 90>
    translate <-2, 0.5, -0.5>
}
object { 
    MimaniBottle( 
        RandomColor())  
    translate <-0.6, 0, -1.5>
    rotate    <0, 20-40*rand(My_seed), 0>
}
object { 
    DanieBottle( 
        RandomColor(), 
        360*rand(My_seed)) 
    rotate    <0, 20-40*rand(My_seed), 0>
    translate <-1, 0, 0>
}
object { 
    DanieBottle( 
        RandomColor(), 
        360*rand(My_seed))   
    rotate    <0, 20-40*rand(My_seed), 0>
    translate <0, 0, 0>
}
object { 
    KeflonBottle( 
        RandomColor()) 
    translate <1, 0, -0.5>
}
object { 
    DanieBottle( 
        RandomColor(), 
        360*rand(My_seed))  
    rotate    <0, 20-40*rand(My_seed), 0>
    translate <2, 0, 0>
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
        
              