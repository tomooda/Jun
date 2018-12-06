converting
asJunOpenGL3dPolylinesLineWidth: lineWidth 
	"((0 , 0 , 0 box: 1 , 1 , 1) asJunOpenGL3dPolylinesLineWidth: 5) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dPolylines.
	compoundObject 
		objectsDo: [:each | each isPolyline ifTrue: [each lineWidth: lineWidth]].
	^compoundObject