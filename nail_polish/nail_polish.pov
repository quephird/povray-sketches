// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {perspective angle 75               // front view
                            location  <1.5 , 1.7, -4.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}

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
       texture{ pigment{ DMFDarkOak }
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
// Top
superellipsoid { <1.0, 0.1>   
        scale <0.3, 0.3, 0.5>

//cylinder{ <0, 1, 0>,<0, 2, 0>, 0.3 
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
        translate <0,0.5,0>
}

// Label
object { 
Bevelled_Text ("texgyreadventor-regular.ttf", // font file
               "danie",  // text
               10 ,      // slice
               35,       // taper
               0.045,    // point chamfer
               0.1,        // character depth along z-axis
               0.00,     // increase per character
               0)        // 1 = "merge"
        material { M_Glass3 }
        finish { phong 1.0 
                 diffuse 0.7
                reflection 0.3
                }
        rotate <0, 0, 90>
        scale <0.27, 0.27, 0.27>
        translate <0.25, 0.1, -0.38>   
}
}
#end
     
object { NailPolishBottle( <0.0, 0.0, 0.4> ) 
         translate <-2, 0, 0>
       }
object { NailPolishBottle( <0.3, 0.0, 0.8> ) 
         translate <-1, 0, 0>
       }
object { NailPolishBottle( <0.1, 0.8, 0.1> ) 
         translate <0, 0, 0>
       }
object { NailPolishBottle( <1.0, 0.2, 0.0> ) 
         translate <1, 0, 0>
       }
object { NailPolishBottle( <0.7, 0.0, 0.8> ) 
         translate <2, 0, 0>
       }

