converting
asJunOpenGL3dPolylinesColor: aColor halftone: halftoneValue lineWidth: lineWidth 
	"((0 , 0 , 0 box: 1 , 2 , 3) asJunOpenGL3dPolylinesColor: ColorValue red halftone: 0.25 lineWidth: 5) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dPolylines.
	compoundObject objectsDo: 
			[:each | 
			each
				paint: nil;
				halftone: halftoneValue.
			each isPolyline ifTrue: [each lineWidth: lineWidth]].
	compoundObject color: aColor.
	^compoundObject