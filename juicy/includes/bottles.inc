#macro LaLaBottle ()
union {
	  // Body
	  difference {
		    superellipsoid { 
		        <0.1, 0.1>
		        scale <1.0, 1.2, 0.6>
		        translate <0, 1.2, 0>
		    }
		    superellipsoid { 
		        <0.1, 0.1>
		        scale <0.8, 1.0, 0.4>
		        translate <0, 1.35, 0>
		    }
        interior { ior 1.5 }
        pigment { color rgbf <1.0, 1.0, 1.0, 1.0> }
        finish { 
            phong 1.0 
            diffuse 0.7
            reflection 0.3
        }
	  }
	  // Perfume
    superellipsoid { 
        <0.1, 0.1>
        scale <0.79, 0.49, 0.39>
        translate <0, 0.75, 0>
		    interior { ior 1.5 }
		    pigment { color rgbf <1.0, 1.0, 0.6, 0.5> }
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
    	  box {
	    	  	<-0.3, 0, -0.3>,
	    	  	<0.3, 1.0, 0.3>
		        translate <0, 0.6, 0>
		        interior { ior 1.5 }
		        pigment { color rgbf <1.0, 1.0, 1.0, 1.0> }
		        finish { 
		            phong 1.0 
		            diffuse 0.7
		            reflection 0.3
		        }
    	  }
        translate <0, 2.4, 0>
    }
}
#end
