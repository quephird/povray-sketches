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
        object {
            LaLaCapTop()
            translate <0, 0.6, 0>
        }
        translate <0, h, 0>
    }
}
#end
