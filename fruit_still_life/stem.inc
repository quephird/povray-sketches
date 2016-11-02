#macro Stem()
sphere_sweep {
    cubic_spline
    5,
    <0, 0.1, 0>, 0.1
    <0, 0.1, 0>, 0.1
    <0, 0.6, 0>, 0.1
    <-0.2, 0.9, 0>, 0.1
    <-0.2, 0.9, 0>, 0.1
    pigment { rgbf <0.7, 0.4, 0.2, 0.95> }
    finish {
    	  phong 0.9 
    	  phong_size 40 
    	  reflection 0.2 
    }
    interior { ior 1.5 }
}
#end
