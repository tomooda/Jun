converting
asJunOpenGL3dObjectWithPoints
	"(JunPlane on: 1 , 0 , 0 on: 0 , 1 , 0 on: 0 , 0 , 1) asJunOpenGL3dObjectWithPoints showWithAxes."

	^ self notYetImplemented "| compoundObject |
	compoundObject := JunOpenGL3dCompoundObject new.
	compoundObject add: self asJunOpenGL3dObject.
	compoundObject add: (self p1 asJunOpenGL3dObject paint: ColorValue red).
	compoundObject add: (self p2 asJunOpenGL3dObject paint: ColorValue green).
	compoundObject add: (self p3 asJunOpenGL3dObject paint: ColorValue blue).
	^compoundObject"