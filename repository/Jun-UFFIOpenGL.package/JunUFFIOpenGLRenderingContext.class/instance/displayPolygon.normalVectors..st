rendering
displayPolygon: anArrayOfJun3dPoint1 normalVectors: anArrayOfJun3dPoint2
	presentation = #wireframe
		ifTrue: [ ^ self displayLines: anArrayOfJun3dPoint1 normalVectors: anArrayOfJun3dPoint2 ].
	self
		activate: [ :gl | 
			gl begin: GL_POLYGON.
			anArrayOfJun3dPoint1
				with: anArrayOfJun3dPoint2
				do: [ :p :n | 
					gl normal3d_nx: n x negated ny: n y negated nz: n z negated.
					gl vertex3d_x: p x y: p y z: p z ].
			gl end ]