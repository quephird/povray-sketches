#include "includes/caps.inc"

#macro DanieBottle (nailColor, capAngleY)
union {
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
        // Rectangular cutout on side
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
    
    // Neck
    difference {
        superellipsoid { 
            <1.0, 0.1>   
		        scale <0.2, 0.2, 0.3>
		        rotate <90,0,0>
		        translate <0, 1.2, 0>
		    }
        superellipsoid { 
            <1.0, 0.1>   
		        scale <0.15, 0.15, 0.3>
		        rotate <90,0,0>
		        translate <0, 1.2, 0>
		    }
        material { M_Glass3 }
        finish { 
            phong 1.0 
            diffuse 0.7
            reflection 0.3
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

#macro DanieBottleCapOn (nailColor, capAngleY)
union{
	  // Cap
    object {
        DanieCap ()
        translate <0, 1.5, 0>
        rotate <0, capAngleY, 0>
    }
	  // Cap
    object {
        DanieBottle (nailColor, capAngleY)
    }
}
#end

#macro KeflonBottle (nailColor)
union {
	  // Cap
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
}
#end

#macro MimaniBottle (nailColor)
union {
	  // Cap
    object{
        MimaniCap ()
        translate <0, 1.0, 0>
    }
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
}
#end

