#version 3.7;
global_settings { assumed_gamma 1.0 }

#include "colors.inc"
#include "glass.inc"
#include "metals.inc"
#include "shapes.inc"
#include "stones.inc"
#include "textures.inc"

// Main camera
camera {
    perspective angle 75
    location  <2, 0, -9>
    look_at   <0, 0, 0>
}

// Main lights
light_source{
	  <-5, 1, -5>
	  color White
}

#macro Close()
	difference {
		sphere {
		  <0, 0, 0>, 0.75
			texture {
				pigment {
					color <1, 0, 0, 0>
					filter 0.9
				}
				finish {
					phong .8
				}
			}
			interior {
				ior 2.5
			}
		}
		superellipsoid {
			<0.2, 0.4>
			scale <0.5, 0.1, 3>
			rotate <0, 0, 45>
			translate <0.0, 0.0, -0.5>
		}
		superellipsoid {
			<0.2, 0.4>
			scale <0.5, 0.1, 3>
			rotate <0, 0, -45>
			translate <0.0, 0.0, -0.5>
		}
	}
#end

#macro Minimize()
  difference {
		sphere {
		  <0, 0, 0>, 0.75
			texture {
				pigment {
					color <1, 0.5, 0, 1>
					filter 0.9
				}
				finish {
					ambient 0
					phong .8
				}
			}
			interior {
				ior 2.5
			}
		}
		superellipsoid {
			<0.2, 0.4>
			scale <0.5, 0.1, 3>
			translate <0.0, 0.0, -0.5>
		}
  }
#end

#macro Maximize()
  difference {
		sphere {
		  <0, 0, 0>, 0.75
			texture {
				pigment {
					color <0, 1, 0, 1>
					filter 0.9
				}
				finish {
					phong .8
				}
			}
			interior {
				ior 2.5
			}
		}
		superellipsoid {
			<0.2, 0.4>
			scale <0.5, 0.1, 3>
			translate <0.0, 0.0, -0.5>
		}
		superellipsoid {
			<0.2, 0.4>
			scale <0.5, 0.1, 3>
			rotate <0, 0, 90>
			translate <0.0, 0.0, -0.5>
		}
  }
#end

#macro Window()
  difference {
		superellipsoid {
			<.08, .008>
			scale <5, 7, 2>
			pigment {
				wood
        turbulence .5
        scale <1, 1, 20>*.2
			}
			texture {
        Chrome_Metal
          normal {
            bumps -0.5
            scale <0.01, 1., 0.01>
        }
				finish {
					phong .8
				}
			}
			translate <0.0, 0.0, -0.5>
			rotate <0, 0, 90>
		}
    sphere {
		  <0, 0, 0>, 0.8
			translate <-5.5, 4, -2.5>
    }
    sphere {
		  <0, 0, 0>, 0.8
			translate <-3.5, 4, -2.5>
    }
    sphere {
		  <0, 0, 0>, 0.8
			translate <-1.5, 4, -2.5>
    }
  }
#end

// Main scene
object {
	Close()
	translate <-2.5, 1.5, 0>
}
object {
	Minimize()
	translate <-0.5, 1.5, 0>
}
object {
	Maximize()
	translate <1.5, 1.5, 0>
}
object {
	Window()
	translate <3, -2.5, 2.5>
}


