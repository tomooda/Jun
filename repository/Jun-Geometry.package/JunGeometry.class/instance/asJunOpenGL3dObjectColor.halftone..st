converting
asJunOpenGL3dObjectColor: aColor halftone: halftoneValue 
	"((0 , 0 , 0 box: 1 , 1 , 1) asJunOpenGL3dObjectColor: ColorValue red halftone: 0.5) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dObject.
	compoundObject objectsDo: 
			[:each | 
			each
				color: nil;
				halftone: halftoneValue].
	compoundObject color: aColor.
	^compoundObject