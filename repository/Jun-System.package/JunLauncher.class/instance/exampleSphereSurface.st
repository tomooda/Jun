examples
exampleSphereSurface
	| sphere random projection form offset morph process |
	sphere := JunSphereSurface unity.
	random := Random new.
	projection := Jun3dTransformation perspective: 1_, 3_, 10.
	form := Form extent: 400 @ 400 depth: 32.
	form getCanvas fillColor: Color black.
	offset := form extent // 2.
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	process := [ 
	[ 
	form getCanvas
		in: [ :canvas | 
			| line |
			"line :=  random next * 2 - 1_, (random next * 2 - 1)_, 2 to: random next * 2 - 1_, (random next * 2 - 1)_, -2."
			line := random next * 2 - 1 _, (random next * 2 - 1) _, 1 to: 0 _, 0 _, 0.
			(sphere crossPointsWithLine: line)
				do: [ :point | 
					(point transform: projection)
						in: [ :p | 
							| z n |
							z := p z abs * 2 max: 0.5.
							n := p unitVector z negated.
							n > 0
								ifTrue: [ canvas fillOval: (p asPoint * 200 - z + offset extent: (z * 2) asPoint) color: (Color gray: (n + 0.2 min: 1.0)) ] ] ] ].
	morph changed ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ 
			process terminate.
			morph delete ]