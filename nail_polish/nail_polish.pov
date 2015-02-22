#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "functions.inc"
#include "glass.inc"          
#include "metals.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "stones.inc"
#include "textures.inc"
           
                                
// 
#declare My_seed = seed(now * 100000);    
#macro RandomColor()    
  <rand(My_seed), rand(My_seed), rand(My_seed)>
#end

//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {perspective angle 75               // front view
                            location  <2.0 , 3.0, -4.0>
                            right     x*image_width/image_height
                            look_at   <-0.5 , 1.0 , 0.0>}

camera{Camera_0}

// Main light ----------------------------------------------------------------------
light_source{< 10,10,-10> color White}

// sky ----------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <0.6,0.7,1.0>]
                                   [0.35 rgb <0.1,0.0,0.8>]
                                   [0.65 rgb <0.1,0.0,0.8>]
                                   [1.00 rgb <0.6,0.7,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere

#macro NailPolishBottle (nailColor)
union {   
// Cap
superellipsoid { <1.0, 0.1>   
        scale <0.3, 0.3, 0.5>
        pigment{color White}
        finish { phong 1.0 
                 diffuse 0.7
                }
        rotate <90,0,0>
        translate <0,1.5,0>
        }
        
// Brand initial on top of cap
object { 
Bevelled_Text ("texgyreadventor-bold.ttf", // font file
               "d",  // text
               30 ,      // slice
               35,       // taper
               0.045,    // point chamfer
               0.1,      // character depth along z-axis
               0.00,     // increase per character
               0)        // 1 = "merge"
        finish { phong   1.0 
                 diffuse 0.7
                }  
        pigment{color White}
        rotate <90, 0, 0>
        scale <0.5, 0.5, 0.5>
        translate <-0.15, 2.03, -0.16>   
}

// Bottle
superellipsoid { <0.25, 0.25>
        scale <0.45, 0.5, 0.45>
        material{ M_Glass3 }
        finish { phong 1.0 
                 diffuse 0.7
                reflection 0.3
                }
        translate <0,0.5,0>
}

// Nail polish  
superellipsoid { <0.25, 0.25>
        scale <0.35, 0.4, 0.35>
        pigment {color nailColor}
//        finish { reflection 1 } 
        translate <0,0.5,0>
}

// Side label
object { 
Bevelled_Text ("texgyreadventor-regular.ttf", // font file
               "danie",  // text
               10 ,      // slice
               35,       // taper
               0.045,    // point chamfer
               0.2,      // character depth along z-axis
               0.00,     // increase per character
               0)        // 1 = "merge"
        material { M_Glass3 }
        finish { phong 1.0 
                 diffuse 1.0
                 reflection 0.1
                }
        rotate <0, 0, 90>
        scale <0.27, 0.27, 0.27>
        translate <0.25, 0.1, -0.44>   
}
}
#end
     
object { NailPolishBottle( RandomColor() ) 
         rotate    <-90-20*rand(My_seed), 0, 90>
         translate <-2, 0.5, -0.5>
       }
object { NailPolishBottle( RandomColor() ) 
         rotate    <0, 20-40*rand(My_seed), 0>
         translate <-1, 0, 0>
       }
object { NailPolishBottle( RandomColor() ) 
         rotate    <0, 20-40*rand(My_seed), 0>
         translate <0, 0, 0>
       }
object { NailPolishBottle( RandomColor() ) 
         rotate    <0, 20-40*rand(My_seed), 0>
         translate <1, 0, 0>
       }
object { NailPolishBottle( RandomColor() ) 
         rotate    <0, 20-40*rand(My_seed), 0>
         translate <2, 0, 0>
       }


// Marble counter top
superellipsoid { <0.05, 0.05>
        scale <8.0, 0.5, 4.0>
        texture { T_Stone24
                  scale 4
                  finish { reflection{.01,.1}
                  }
        }
        rotate <0, -25, 0>        
        translate <-1, -0.5, 2>
}
   
// Rear wall         
#declare rear_wall=plane {        
        <0, 0, 1>, 1      
        pigment {color <0.5, 0.5, 0.8> }             
        rotate <0, -25, 0>        
        translate <-1, 0, 5.5>
};  
rear_wall

// Mirror        
box { <-10, 0.0, -0.5>, <5.0, 5, -0.5>
        rotate <0, -25, 0>        
        texture {T_Silver_1C}
        translate <-1, 0, 7>
}
        
              