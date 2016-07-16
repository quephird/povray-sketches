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
    location  <0.0, 8.0, -8.0>  
    right     x*image_width/image_height
    look_at   <0.0, 1.0, 0.0>
}

// Main light
light_source {
	  <10, 10, -10> 
	  color White
}
              
#macro Foo (brickcolor)
difference {
    superellipsoid {
        <1.0, 0.1>
        scale <0.3, 0.3, 0.1>
    }
    superellipsoid {
        <1.0, 0.1>
        scale <0.15, 0.15, 0.2>
        translate <0., 0., 0.2>
    }
}
#end

#macro Stud (brickColor)              
union {
	  // Main stud shape
	  object {
        Foo(brickColor)
        rotate <90, 0, 0>
	  }
	          
    // Brand on top of each stud
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

#macro Tube (pieceHeight)
difference {
		superellipsoid {
		    <1.0, 0.1>
		    scale <0.4, 0.4, pieceHeight>
		    rotate <90, 0, 0>
        translate <0, 0.0, 0>   
		}
		superellipsoid {
		    <1.0, 0.1>
		    scale <0.33, 0.33, pieceHeight>
		    rotate <90, 0, 0>
        translate <0, -0.05, 0>   
		}
}
#end

#macro Bar (pieceHeight)
superellipsoid {
    <1.0, 0.1>
    scale <0.2, 0.2, pieceHeight>
    rotate <90, 0, 0>
}
#end

#macro Piece (pieceColor, pieceHeight, studWidth, studLength)
		union {
			  difference {
			  	  // Main shape
				    superellipsoid { 
				        <0.02, 0.02>
				        scale <0.5*studWidth, pieceHeight, 0.5*studLength>
		            translate <0.0, pieceHeight, 0.0>
				    }
				    // Hollowed out box
				    superellipsoid { 
		            <0.02, 0.02>
		            scale <0.5*studWidth-0.15, 
		                   0.9*pieceHeight, 
		                   0.5*studLength-0.15>
		            translate <0.0, pieceHeight-0.1, 0.0>
				    }

						// Subtraction of dimples inside piece under each stud
				    #for (i, 0, studWidth-1)
				        #for (j, 0, studLength-1)
								    superellipsoid {
								        <1.0, 0.1>
								        scale <0.15, 0.15, 10>
								        rotate <90, 0, 0>
				                translate <i-(studWidth-1)*0.5, 
				                           pieceHeight, 
				                           j-(studLength-1)*0.5>
								    }
				        #end
				    #end
		    }
		
		    // Addition of studs
		    #for (i, 0, studWidth-1)
		        #for (j, 0, studLength-1)
		            object { 
		                Stud (brickColor) 
		                translate <i-(studWidth-1)*0.5, 
		                           2*pieceHeight+0.1, 
		                           j-(studLength-1)*0.5>
		            }
		        #end
		    #end
		    
		    //Addition of tubes
		    #if (studWidth > 1 & studLength > 1)
				    #for (i, 0, studWidth-2)
				        #for (j, 0, studLength-2)
				            object { 
				                Tube (pieceHeight) 
				                translate <i-(studWidth-2)*0.5, 
				                           pieceHeight, 
				                           j-(studLength-2)*0.5>
								    }
				        #end
				    #end
				#end
		    //Addition of bars
		    #if (studWidth = 1 & studLength > 1)
				        #for (j, 0, studLength-2)
				            object { 
				                Bar (pieceHeight) 
				                translate <0, 
				                           pieceHeight, 
				                           j-(studLength-2)*0.5>
								    }
				    #end
				#end
//		    #if (studLength == 1 & studWidth > 1)
//		    #end
		}

    pigment {
    	  color brickColor
    }
    finish {
    	  ambient 0.1
        diffuse 0.9
        phong 1
    }
#end

#macro Brick(brickColor, studWidth, studLength)
    Piece(brickColor, 0.6, studWidth, studLength)
#end

#macro Plate(brickColor, studWidth, studLength)
    Piece(brickColor, 0.2, studWidth, studLength)
#end
     
// And now the actual scene.
object { 
    Brick(Orange, 1, 4)
    rotate <0, -10, 0>
    translate <-3.75, 0, 2>
}
object { 
    Brick(ForestGreen, 1, 4)
    rotate <180, 10, 0>
    translate <-5.5, 1.2, 2>
}

object { 
    Brick(MediumSlateBlue, 3, 2)
    rotate <90, -10, 0>
    translate <0, 1.0, 2.5>
}

object { 
    Plate(SpicyPink, 1, 3)
    rotate <180, 20, 0>
    translate <-1, 0.5, 0.5>
}


object { 
    Plate(NeonPink, 1, 1)
    rotate <180, 60, 0>
    translate <1, 0.5, 1>
}
object { 
    Plate(White, 1, 1)
    rotate <180, 10, 0>
    translate <2, 0.5, 1.6>
}
object { 
    Plate(NeonPink, 1, 1)
    rotate <0, 40, 0>
    translate <1.5, 0, 0>
}

object { 
    Brick(Red, 2, 2)
    rotate <0, 60, 0>
    translate <4, 0, 3>
}
object { 
    Brick(Blue, 2, 2)
    rotate <0, 60, 0>
    translate <4.95, 0, 1.35>
}
object { 
    Brick(Yellow, 2, 2)
    rotate <0, 60, 0>
    translate <4.5, 1.2, 2.15>
}

// Table top
superellipsoid { 
    <0.05, 0.05>
    scale <20.0, 0.5, 10.0>
    texture { 
        DMFDarkOak
        scale <0.5, 0.5, 0.5>
        translate <-8, 0, 0>
        finish { 
            reflection {.01, .1}
        }
    }
    rotate <0, 0, 0>        
    translate <0, -0.5, 2>
}
   
// Rear wall         
plane {        
    <0, 0, 1>, 1      
    pigment {color <0.5, 0.5, 0.9>}             
    rotate <0, 0, 0>        
    translate <0, 0, 10>
}

        
              