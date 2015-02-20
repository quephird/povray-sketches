#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"          
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"           
                                
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

// ground -------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ T_Wood19
                scale <0.3, 0.3, 0.3>
                normal { bumps 0.75 scale 0.025}
                finish { phong 0.1}
              } // end of texture
     } // end of plane

//---------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//---------------------------------------------------------------------------

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
               0.1,      // character depth along z-axis
               0.00,     // increase per character
               0)        // 1 = "merge"
        material { M_Glass3 }
        finish { phong 1.0 
                 diffuse 1.0
                 reflection 0.1
                }
        rotate <0, 0, 90>
        scale <0.27, 0.27, 0.27>
        translate <0.25, 0.1, -0.38>   
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

