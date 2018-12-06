rendering
displayPolygon: anArrayOfJun3dPoint1 normalVectors: anArrayOfJun3dPoint2 texturePoints: anArrayOfJun2dPoint
	presentation = #wireframe
		ifTrue: [ ^ self displayLines: anArrayOfJun3dPoint1 normalVectors: anArrayOfJun3dPoint2 ].
	self
		activate: [ :gl | 
			gl begin: GL_POLYGON.
			1 to: ((anArrayOfJun3dPoint1 size min: anArrayOfJun3dPoint2 size) min: anArrayOfJun2dPoint size) do: [ :index | 
				| t n p |
				t := anArrayOfJun2dPoint at: index.
				n := anArrayOfJun3dPoint2 at: index.
				p := anArrayOfJun3dPoint1 at: index.
				gl
					texCoord2d_s: t x t: t y;
					normal3d_nx: n x negated ny: n y negated nz: n z negated;
					vertex3d_x: p x y: p y z: p z ].
			gl end ]