rendering
renderRoughOn: aJunRenderingContext
	| r |
	r := self vanDerWaalsRadius * 0.25.
	aJunRenderingContext color: self color.
	self
		triangles32Do: [ :v1 :v2 :v3 | 
			aJunRenderingContext
				displayPolygon: (Array with: v1 * r + position with: v2 * r + position with: v3 * r + position)
				normalVectors: (Array with: v1 unitVector with: v2 unitVector with: v3 unitVector) ]