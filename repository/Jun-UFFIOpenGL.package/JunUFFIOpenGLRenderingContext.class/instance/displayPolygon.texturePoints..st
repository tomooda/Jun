rendering
displayPolygon: anArrayOfJun3dPoint1 texturePoints: anArrayOfJun2dPoint
	| n |
	presentation = #wireframe
		ifTrue: [ ^ self displayLines: anArrayOfJun3dPoint1 ].
	n := Jun3dPoint normalUnitVectorOfPoints: anArrayOfJun3dPoint1.
	self
		activate: [ :gl | 
			gl begin: GL_POLYGON.
			gl normal3d_nx: n x ny: n y nz: n z.
			anArrayOfJun3dPoint1
				with: anArrayOfJun2dPoint
				do: [ :p :t | 
					gl
						texCoord2d_s: t x t: t y;
						vertex3d_x: p x y: p y z: p z ].
			gl end ]