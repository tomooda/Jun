converting
asJunOpenGL3dObject
	"(JunPlane on: 1 , 0 , 0 on: 0 , 1 , 0 on: 0 , 0 , 1) asJunOpenGL3dObject showWithAxes."

	"(JunPlane on: 1 , 1 , 0 normalVector: -1 , -1 , 0) asJunOpenGL3dObject showWithAxes."

	^ self notYetImplemented "| aCollection aPolygon compoundObject |
	aCollection := self asCircle trackPointsBy: 36.
	aPolygon := JunOpenGL3dPolygon vertexes: aCollection.
	compoundObject := JunOpenGL3dCompoundObject new.
	compoundObject add: ((aPolygon reversed)
				paint: (self defaultColor blendWith: ColorValue black)
					alpha: self defaultAlpha;
				yourself).
	compoundObject add: (aPolygon
				paint: self defaultColor alpha: self defaultAlpha;
				yourself).
	^compoundObject"