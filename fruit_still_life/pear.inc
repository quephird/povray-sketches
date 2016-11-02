#macro Pear()
union {
		sphere_sweep {
		    linear_spline
		    5, 
		    <0, 2.00, 0>, 2.0
		    <0, 2.00, 0>, 2.0
		    <0, 3.0, 0>, 1.4
		    <0, 5, 0>, 0.75
		    <0, 5, 0>, 0.75
		    pigment { rgbf <0.7, 0.9, 0.5, 0.95> }
        finish {
            phong 0.9 
            phong_size 40 
        	  reflection 0.2 
		    }
		    interior { ior 1.5 }
		    translate<0, 0, 0>
		}
		object {
        Stem(1.0)
        translate<0, 5.6, 0>
		}
    rotate <0, 0, -10>
}
#end