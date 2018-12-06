converting
asGeometryArray
	"JunOpenGL3dObject cube asGeometryArray."

	"JunOpenGL3dObject axes asGeometryArray."

	| aStream |
	aStream := WriteStream on: (Array new: 128).
	self geometriesDo: [ :geometry | aStream nextPut: geometry ].
	^ aStream contents