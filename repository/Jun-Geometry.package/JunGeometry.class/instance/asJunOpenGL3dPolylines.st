converting
asJunOpenGL3dPolylines
	"((0 , 0 , 0 box: 1 , 2 , 3) asJunOpenGL3dPolylines) show."
	^ self notYetImplemented "
	| aBody |
	aBody := JunOpenGL3dCompoundObject new.
	self asArrayOfLines 
		do: [:aLine | aBody add: (JunOpenGL3dPolyline with: aLine first with: aLine last)].
	^aBody"