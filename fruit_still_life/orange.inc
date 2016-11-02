#macro Orinj ()
sphere {
    <0, 0, 0>, 2
    material { M_Glass3 }
    pigment { rgbf <0.8, 0.5, 0.2, 0.95> }
    finish {
    	  phong 0.9
    	  phong_size 40
        reflection 0.2
    }
    interior{ ior 1.5 }
}
#end
