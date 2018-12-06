functions
projectionOfLine: aJun3dLine
	| from to |
	from := aJun3dLine from.
	to := aJun3dLine to.
	^ aJun3dLine class from: (self projectionOfPoint: from) to: (self projectionOfPoint: to)