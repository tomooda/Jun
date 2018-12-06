converting
asJunOpenGL3dObject
	"((1 , 1 , 1) extent: (1 , 1 , 1)) asJunOpenGL3dObject showWithAxes."

	^ self notYetImplemented	"| compoundObject |
	compoundObject := JunOpenGL3dObject origin: self origin corner: self corner.
	compoundObject 
		objectsDo: [:each | each paint: self defaultColor alpha: self defaultAlpha].
	^compoundObject"