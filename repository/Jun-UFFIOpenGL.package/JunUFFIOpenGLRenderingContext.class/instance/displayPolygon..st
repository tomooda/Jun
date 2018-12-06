rendering
displayPolygon: anArrayOfJun3dPoint1
	| n |
	presentation = #wireframe
		ifTrue: [ ^ self displayLines: anArrayOfJun3dPoint1 ].
	n := Jun3dPoint normalUnitVectorOfPoints: anArrayOfJun3dPoint1.
	self
		activate: [ :gl | 
			gl begin: GL_POLYGON.
			gl normal3d_nx: n x ny: n y nz: n z.
			anArrayOfJun3dPoint1 do: [ :p | gl vertex3d_x: p x y: p y z: p z ].
			gl end ]