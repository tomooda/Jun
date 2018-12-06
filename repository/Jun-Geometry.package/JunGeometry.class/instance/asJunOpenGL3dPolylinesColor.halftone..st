converting
asJunOpenGL3dPolylinesColor: aColor halftone: halftoneValue 
	"((0 , 0 , 0 box: 1 , 2 , 3) asJunOpenGL3dPolylinesColor: ColorValue red halftone: 0.25) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dPolylines.
	compoundObject objectsDo: 
			[:each | 
			each color: nil;
				halftone: halftoneValue].
	compoundObject color: aColor.
	^compoundObject