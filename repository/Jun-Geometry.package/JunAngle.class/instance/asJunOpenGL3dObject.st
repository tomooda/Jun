converting
asJunOpenGL3dObject
	"(JunAngle fromDeg: 30) asJunOpenGL3dObject showWithAxes."

	^ self notYetImplemented "
	| compoundObject aBall |
	compoundObject := JunOpenGL3dCompoundObject new.
	aBall := JunOpenGL3dObject 
				pieFrom: 0
				to: self radiansToDegrees
				by: 5
				radius: 1.
	compoundObject add: aBall reversed.
	compoundObject add: aBall.
	compoundObject 
		objectsDo: [:each | each paint: self defaultColor alpha: self defaultAlpha].
	^compoundObject"