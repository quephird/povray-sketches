#macro DanieCap ()              
union {
    // Main body
    superellipsoid { 
        <1.0, 0.1>   
        scale <0.3, 0.3, 0.5>
        pigment {color White}
        finish { 
            phong 1.0 
            diffuse 0.7
        }
        rotate <90,0,0>
        translate <0,0,0>
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
