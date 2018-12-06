displaying
displayPolygon: aCollectionOfJun3dPoint normalVector: aJun3dPoint
	| t points near far n |
	aCollectionOfJun3dPoint ifEmpty: [ ^ self ].
	t := self totalTransformation.
	near := projection near.
	far := projection far.
	points := aCollectionOfJun3dPoint
		collect: [ :point | 
			| p |
			p := point transform: t.
			(p z between: near and: far)
				ifFalse: [ ^ self ].
			p ].
	n := aJun3dPoint unitVector dotProduct: projection unitSightVector negated.
	presentation = #wireframe
		ifTrue: [ 
			| c w |
			c := color.
			w := lineWidth.
			blocks
				nextPut:
					(points collect: #z) average
						-> [ 
							1 to: points size - 1 do: [ :i | 
								| p1 p2 |
								p1 := points at: i.
								p2 := points at: i + 1.
								canvas
									line: p1 asPoint
									to: p2 asPoint
									width: w
									color: c ].
							canvas
								line: points last asPoint
								to: points first asPoint
								width: w
								color: c ] ].
	(cullfaceEnabled not or: [ n >= 0.0 ])
		ifTrue: [ 
			presentation = #solid
				ifTrue: [ 
					| c |
					c := Color h: color hue s: color saturation v: (n max: 0.5).
					blocks nextPut: (points collect: #z) average -> [ canvas drawPolygon: (points collect: #asPoint) fillStyle: c ].
					^ self ].
			presentation = #hiddenline
				ifTrue: [ 
					| bc c w |
					bc := self backgroundColor.
					c := self color.
					w := lineWidth.
					blocks
						nextPut:
							(points collect: #z) average
								-> [ 
									canvas
										drawPolygon: (points collect: #asPoint)
										color: bc
										borderWidth: w
										borderColor: c ].
					^ self ] ]