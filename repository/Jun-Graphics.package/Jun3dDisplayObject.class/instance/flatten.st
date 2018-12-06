converting
flatten
	^ self notYetImplemented "JunOpenGL3dCompoundObject
	| aBody |
	aBody := JunOpenGL3dCompoundObject new.
	self primitivesDo: [:aPolygon | aBody add: aPolygon].
	^aBody"