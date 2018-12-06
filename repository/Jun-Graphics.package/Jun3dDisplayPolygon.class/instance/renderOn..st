rendering
renderOn: aJunRenderingContext
	texture
		ifNotNil: [ 
			aJunRenderingContext
				withTexture: texture
				do: [ aJunRenderingContext displayPolygon: points normalVectors: self normalVectors texturePoints: texturePoints ] ]
		ifNil: [ 
			| oldColor |
			color
				ifNotNil: [ 
					oldColor := aJunRenderingContext color.
					aJunRenderingContext color: color ].
			aJunRenderingContext displayPolygon: points normalVectors: self normalVectors.
			oldColor ifNotNil: [ aJunRenderingContext color: oldColor ] ]