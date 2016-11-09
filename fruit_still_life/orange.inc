#declare OrangeFunction = function { 1.0 - cos(u) };
#declare OFx = function { OrangeFunction(u,v,0)*sin(u)*cos(v) };
#declare OFy = function { OrangeFunction(u,v,0)*cos(u) };
#declare OFz = function { OrangeFunction(u,v,0)*sin(u)*sin(v) };

#macro Orinj (orangeRadius)
parametric {
    function { OFx(u,v,0) },
    function { OFy(u,v,0) },
    function { OFz(u,v,0) }
    <0, 0>, <2*pi, pi>
    contained_by {
        box {
            <-2, -2, -2>,
            <2, 2, 2>
        }
    }
    accuracy 0.01
    precompute 10 x,y,z
    pigment {
       rgbf <0.8, 0.5, 0.2, 0.95>
    }
    finish {
        phong 0.9
        phong_size 40
        reflection 0.2
    }
    interior {
        ior 1.5
    }
    scale <orangeRadius, orangeRadius, orangeRadius>
    translate <0, 2*orangeRadius, 0>
}
#end
