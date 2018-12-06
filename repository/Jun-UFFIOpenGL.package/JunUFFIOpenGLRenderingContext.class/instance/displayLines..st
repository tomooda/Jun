rendering
displayLines: anArrayOfJun3dPoint1
	| n |
	anArrayOfJun3dPoint1 size >= 3
		ifTrue: [ n := Jun3dPoint normalUnitVectorOfPoints: anArrayOfJun3dPoint1 ].
	self
		activate: [ :gl | 
			gl begin: GL_LINES.
			n ifNotNil: [ gl normal3d_nx: n x ny: n y nz: n z ].
			anArrayOfJun3dPoint1 do: [ :p | gl vertex3d_x: p x y: p y z: p z ].
			gl end ]