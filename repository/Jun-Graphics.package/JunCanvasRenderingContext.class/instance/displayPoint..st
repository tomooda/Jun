displaying
displayPoint: aJun3dPoint
	| t p |
	t := self totalTransformation.
	p := aJun3dPoint transform: t.
	((viewport containsPoint: p) and: [ p z between: projection near and: projection far ])
		ifTrue: [ 
			| c |
			c := color.
			blocks nextPut: p z -> [canvas
				fillRectangle: ((p x - (pointSize / 2.0)) @ (p y - (pointSize / 2.0)) extent: pointSize @ pointSize)
				fillStyle: c ]]