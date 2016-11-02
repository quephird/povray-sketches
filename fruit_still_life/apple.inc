#declare Fr = function { 1.0 - cos(u) - 0.1*cos(2*u) - 0.15*cos(3*u) };
#declare Fx = function { Fr(u,v,0)*sin(u)*cos(v) };
#declare Fy = function { Fr(u,v,0)*cos(u) };
#declare Fz = function { Fr(u,v,0)*sin(u)*sin(v) };

#macro Apple (appleRadius)
union {
    parametric {
        function { Fx(u,v,0) },
        function { Fy(u,v,0) },
        function { Fz(u,v,0) }
        <0, 0>, <2*pi, pi>
        contained_by {
        	  box {
        	  	  <-2, -2, -2>,
        	  	  <2, 2, 2>
        	  }
        }
        accuracy 0.1
        precompute 10 x,y,z
        pigment { 
            rgbf <0.9, 0.3, 0.3, 0.95>
        }
        finish {
            phong 0.9
            phong_size 40
            reflection 0.2
        }
        interior {
            ior 1.5
        }
        scale <appleRadius, appleRadius, appleRadius>
        translate <0, 2*appleRadius, 0>
    }
    object {
        Stem(1.5)
        translate<0, 3, 0>
        rotate<0, 50, 0>
		}
}
#end
