#macro DanieCap (polishColor)              
union {
    // Main body
    difference {
		    superellipsoid { 
		        <1.0, 0.1>   
		        scale <0.3, 0.3, 0.5>
		    }
		    superellipsoid { 
		        <1.0, 0.1>   
		        scale <0.25, 0.25, 0.45>
		        translate <0.0, 0.0, 0.1>
		    }
        rotate <90,0,0>
        pigment {color White}
        finish { 
            phong 1.0 
            diffuse 0.7
        }
    }

    // Brush stem
    superellipsoid { 
        <1.0, 0.1>   
        scale <0.05, 0.05, 0.9>
        translate <0.0, 0.0, 0.4>
        rotate <90,0,0>
        material { M_Glass3 }
        finish { 
            phong 1.0 
            diffuse 0.7
            reflection 0.3
        }
    }

    // Brush
    #declare new_seed = seed(now * 100000);
    #for (i, 0, 6.28, 0.375)
        #declare dr = 0.04*rand(new_seed);
        cylinder {
            <0.025*sin(i), -1.3, 0.025*cos(i)>, 
            <(0.025+dr)*sin(i), -1.7, (0.025+dr)*cos(i)>, 
            0.007
            pigment {color Black}
        }
    #end

    // Polish with same color at end of brush
    blob {
      	threshold 0.1
    		sphere {
		        <0.0, -1.4, 0.0>, 0.03, 1
    		}
        cylinder {
            <0, -1.4, 0>, 
            <0, -1.7, 0>,
            0.05,
            1
        }  
    		sphere {
		        <0.0, -1.7, 0.0>, 0.05, 1
    		}
        pigment {
        	  color polishColor
        }
		}

    // Brand initial on top of cap
    object { 
        Bevelled_Text (
            "texgyreadventor-bold.ttf", // font file
            "d",      // text
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
        pigment {color White}
        rotate <90, 0, 0>
        scale <0.5, 0.5, 0.5>
        translate <-0.15, 0.53, -0.16>   
    }
}
#end

#macro KeflonCap ()
union {
    // Cap
    superellipsoid { 
        <1.0, 0.05>   
        scale <0.3, 0.3, 0.7>
        pigment {color Black}
        finish { 
            phong 1.0 
            diffuse 0.7
        }
        rotate <90, 0, 0>
    }
           
    // Brand ring around cap
    object{ 
        Supertorus(
            0.30, 0.01,
            1.00, 0.45,
            0.001, 1.50)

        pigment { 
            object { 
                text { 
                    ttf "aftasansthin-regular.ttf", 
                    "KEFLON", 
                    1, 0 
                    scale <.08, 0.01, 1>
                    translate <0, -0.003, 0>
                }
                pigment { BrightGold }
                pigment { Black }
            }
            warp { cylindrical }
            rotate y*110
        }
        finish {
            ambient .1
            diffuse .1
            specular 1
            roughness .001
            reflection { 0.75 }
        }
        scale <1,10,1>
        translate <0, -0.4, 0>
    }
}
#end

#macro MimaniCap ()
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
}
#end
