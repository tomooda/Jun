functions
projectionOfPoint: aJun3dPoint
	| denominator thePoint numerator |
	denominator := a squared + b squared + c squared.
	denominator abs < self class accuracy
		ifTrue: [ 
			self normalizeParameters.
			denominator := a squared + b squared + c squared.
			denominator abs < self class accuracy
				ifTrue: [ ^ self error: 'Can''t define a plane' ] ].
	numerator := (a * aJun3dPoint x + (b * aJun3dPoint y) + (c * aJun3dPoint z) + d) negated.
	thePoint := Jun3dPoint
		x: aJun3dPoint x + (a * numerator / denominator)
		y: aJun3dPoint y + (b * numerator / denominator)
		z: aJun3dPoint z + (c * numerator / denominator).
	^ thePoint