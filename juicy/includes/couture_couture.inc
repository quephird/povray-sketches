#macro BodyExterior ()
    object {
        sor {
            14,
            <0.5, 0.0>
            <0.51, 0.01>
            <0.8, 0.5>
            <1.2, 1.8>
            <1.22, 1.801>
            <1.221, 2.0>
            <1.22, 2.001>
            <1.1, 2.002>
            <0.6, 2.15>
            <0.4, 2.5>
            <0.45, 2.55>
            <0.45, 2.6>
            <0.4, 2.65>
            <0.4, 2.65>
        }
    }
#end

#macro BottomCutouts ()
    #for (i, 0, 24)
        sphere {
            <0.0, 0.0, 0.0>, 1
            scale <0.1, 1.0, 0.1>
            rotate <0, 0, -20>
            translate <0.58, 0.0, 0.0>
            rotate <0, 14.4*i, 0>
        }
    #end
#end

#macro MiddleReeding ()
    #for (i, 0, 99)
        sphere {
            <0.0, 0.0, 0.0>, 1
            scale <0.02, 0.2, 0.02>
            rotate <0, 0, -5>
            translate <1.05, 1.5, 0.0>
            rotate <0, 3.6*i, 0>
        }
    #end
#end

#macro TopCutouts ()
    #for (i, 0, 15)
        sphere {
            <0.0, 0.0, 0.0>, 1
            scale <0.4, 0.4, 0.3>
            translate <0.8, 2.4, 0.0>
            rotate <0, 22.5*i, 0>
        }
    #end
#end

#macro BottleInterior ()
    object {
        BodyExterior()
        scale <0.8, 0.8, 0.8>
        translate <0.0, 0.3, 0.0>
    }
#end

#macro Body ()
    difference {
        BodyExterior()
        BottomCutouts()
        MiddleReeding()
        TopCutouts()
        BottleInterior()
        interior { ior 1.5 }
        pigment { color rgbf <1.0, 1.0, 1.0, 0.9> }
        finish {
            phong 1.0
            diffuse 0.7
            reflection 0.3
        }
    }
#end

#macro Perfume ()
    object {
        sor {
            5,
            <0.5, 0.0>
            <0.51, 0.01>
            <0.8, 0.5>
            <1.0, 1.3>
            <1.0, 1.3>
        }
        scale <0.79, 0.79, 0.79>
        interior { ior 1.5 }
        pigment { color rgbf <1.0, 1.0, 0.6, 0.9> }
        finish {
            phong 1.0
            diffuse 0.7
            reflection 0.3
        }
    }
#end

#macro Atomizer ()
    difference {
        union {
            // Cap neck
            cylinder {
                <0, 0, 0>, <0, 0.4, 0>, 0.3
            }
            // Plunger
            cylinder {
                <0, 0, 0>, <0, 0.2, 0>, 0.2
                translate <0, 0.4, 0>
            }
        }
        // Ring cutout
        torus {
            0.3, 0.025
            translate <0, 0.3, 0>
        }
        // Nozzle hole
        cylinder {
            <0, 0, 0>, <0, 0.0, -0.1>, 0.07
            translate <0, 0.5, -0.17>
        }

        texture {
            pigment { Gold }
            finish {
                ambient .1
                diffuse 0.1
                specular 1
                roughness .001
                reflection { 2.0 }
            }
        }
    }
#end

#macro Cap ()
    union {
        difference {
            // Cap exterior
            cylinder {
                <0, 0, 0>, <0, 0.7, 0.0>, 0.4
            }
            // Cap interior
            cylinder {
                <0, 0, 0>, <0, 0.7, 0.0>, 0.35
            }
            // Reeding around cap
            #for (i, 0, 99)
                box {
                    <-0.01, 0, -0.01>, <0.01, 0.7, 0.01>
                    rotate <0, 45, 0>
                    translate <-0.4, 0, 0>
                    rotate <0, 3.6*i, 0>
                }
            #end
            interior { ior 1.5 }
            pigment { color rgbf <1.0, 1.0, 1.0, 0.9> }
            finish {
                phong 1.0
                diffuse 0.7
                reflection 0.3
            }
        }
        // Gold ring around cap
        torus {
            0.4, 0.05
            translate <0, 0.35, 0>
            texture {
                pigment { Gold }
                finish {
                    ambient .1
                    diffuse 0.1
                    specular 1
                    roughness .001
                    reflection { 2.0 }
                }
            }
        }
        // Top
        cone {
            <0, 0, 0>, 0.35,
            <0, 0.2, 0>, 0.15
            translate <0, 0.7, 0>
            interior { ior 1.5 }
            pigment { color rgbf <1.0, 1.0, 1.0, 0.9> }
            finish {
                phong 1.0
                diffuse 0.7
                reflection 0.3
            }
        }
        // Ornament
        union {
            // Main body
            sphere {
                <0, 0, 0>, 1
                scale <0.4, 0.45, 0.1>
                translate <0, 1.35, 0>
            }
            // Spheres along top
            #for (i, 0, 6)
                sphere {
                    <0, 0, 0> 0.009*i+0.04
                    translate <0.4*cos((i*i-4.5)*2*3.14*20/360/8), 1.35+0.45*sin((i*i-4.5)*2*3.14*20/360/8), 0>
                }
                sphere {
                    <0, 0, 0> 0.009*i+0.04
                    translate <-0.4*cos((i*i-4.5)*2*3.14*20/360/8), 1.35+0.45*sin((i*i-4.5)*2*3.14*20/360/8), 0>
                }
            #end
            texture {
                pigment { Gold }
                finish {
                    ambient .1
                    diffuse 0.1
                    specular 1
                    roughness .001
                    reflection { 2.0 }
                }
            }
        }
    }
#end

#macro CoutureCoutureBottle ()
union {
    Body()
    object {
        Perfume()
        translate <0.0, 0.3, 0.0>
    }
    object {
        Atomizer()
        translate <0, 2.65, 0>
    }
    object {
        Cap()
        translate <0, 2.65, 0>
    }
}
#end
