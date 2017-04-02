#macro Box ()
box {
    <-0.3, 0, -0.3>,
    <0.3, 1.0, 0.3>
}
#end

#macro LaLaCapTop ()
    difference {
        object { Box() }
        #for (i, 0, 5)
            object {
                Box()
                scale <1.1, 1.1, 1.1>
                rotate <0, 0, 10>
                 translate <-0.5, -0.1, 0>
                rotate <0, i*60, 0>
            }
            object {
                Box()
                scale <1.1, 1.1, 1.1>
                rotate <0, 0, -15>
                 translate <-0.65, 0.8, 0>
                rotate <0, i*60, 0>
            }
        #end
        #for (i, 0, 3)
            object {
                Box()
                scale <1.1, 1.1, 1.1>
                rotate <0, 0, -40>
                 translate <-0.65, 1.0, 0>
                rotate <0, i*90, 0>
            }
        #end
    }
    interior { ior 1.5 }
    pigment { color rgbf <1.0, 1.0, 1.0, 1.0> }
    finish {
        phong 1.0
        diffuse 0.7
        reflection 0.3
    }
#end

#macro LaLaBottle (l, h, w, bottleColor)
union {
    // Body
    difference {
        superellipsoid {
            <0.1, 0.1>
            scale <0.5*l, 0.5*h, 0.5*w>
            translate <0, 0.5*h, 0>
        }
        superellipsoid {
            <0.1, 0.1>
            scale <0.4*l, 0.4*h, 0.4*w>
            translate <0, 0.55*h, 0>
        }
        interior { ior 1.5 }
        pigment { color bottleColor }
        finish {
            phong 1.0
            diffuse 0.7
            reflection 0.3
        }
    }
    // Perfume
    superellipsoid {
        <0.1, 0.1>
        scale <0.39*l, 0.2*h, 0.39*w>
        translate <0, 0.35*h, 0>
        interior { ior 1.5 }
        pigment { color rgbf <1.0, 1.0, 0.6, 0.9> }
        finish {
            phong 1.0
            diffuse 0.7
            reflection 0.3
        }
    }
    // Cap
    union {
        // Neck
        union {
            cylinder {
                <0, 0, 0>,
                <0, 0.6, 0>, 0.3
            }
            torus {
                0.3, 0.05
                translate <0, 0.05, 0>
            }
            torus {
                0.3, 0.05
                translate <0, 0.55, 0>
            }
            texture {
                pigment { Silver }
                finish {
                    ambient .1
                    diffuse 0.1
                    specular 1
                    roughness .001
                    reflection { 2.0 }
                }
            }
        }
        object {
            LaLaCapTop()
            translate <0, 0.6, 0>
        }
        translate <0, h, 0>
    }
}
#end

#macro Quooture ()
//union {
difference {
    // Main body
    sor {
        12,
        <0.5, 0.0>
        <0.51, 0.01>
        <0.8, 0.5>
        <1.2, 1.8>
        <1.22, 1.801>
        <1.221, 2.0>
        <1.22, 2.001>
        <1.1, 2.002>
        <0.6, 2.15>
        <0.4, 3.0>
        <0.4, 3.5>
        <0.4, 3.5>
    }
    // Bottom cutouts
    #for (i, 0, 24)
        sphere {
            <0.0, 0.0, 0.0>, 1
            scale <0.1, 1.0, 0.1>
            rotate <0, 0, -20>
            translate <0.58, 0.0, 0.0>
            rotate <0, 14.4*i, 0>
        }
    #end
    // Middle reeding
    #for (i, 0, 99)
        sphere {
            <0.0, 0.0, 0.0>, 1
            scale <0.02, 0.2, 0.02>
            rotate <0, 0, -5>
            translate <1.05, 1.5, 0.0>
            rotate <0, 3.6*i, 0>
        }
    #end
    // Top cutouts
    #for (i, 0, 15)
        sphere {
            <0.0, 0.0, 0.0>, 1
            scale <0.4, 0.4, 0.3>
            translate <0.8, 2.4, 0.0>
            rotate <0, 22.5*i, 0>
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
#end
