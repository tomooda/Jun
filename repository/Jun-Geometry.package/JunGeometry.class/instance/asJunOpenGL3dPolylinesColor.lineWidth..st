converting
asJunOpenGL3dPolylinesColor: aColor lineWidth: lineWidth 
	"((0 , 0 , 0 box: 1 , 2 , 3) asJunOpenGL3dPolylinesColor: ColorValue red lineWidth: 5) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dPolylines.
	compoundObject objectsDo: 
			[:each | 
			each color: nil.
			each isPolyline ifTrue: [each lineWidth: lineWidth]].
	compoundObject color: aColor.
	^compoundObject