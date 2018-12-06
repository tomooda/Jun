converting
asJunOpenGL3dObject
	"(1 , 1 , 1) asJunOpenGL3dObject showWithAxes."

	^ self notYetImplemented "| aVertex |
	aVertex := JunOpenGL3dVertex point: self.
	aVertex size: 5.
	aVertex paint: self defaultColor.
	^aVertex"