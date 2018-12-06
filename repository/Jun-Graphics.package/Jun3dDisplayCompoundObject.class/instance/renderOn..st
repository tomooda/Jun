rendering
renderOn: aJunRenderingContext
	| oldColor |
	oldColor := aJunRenderingContext color.
	color ifNotNil: [ aJunRenderingContext color: color ].
	components do: [ :obj | obj renderOn: aJunRenderingContext ].
	aJunRenderingContext color: oldColor