examples
exampleFakeRaytracing
	| sphere1 sphere2 eyePoint random form offset morph |
	sphere1 := JunSphereSurface unity.
	sphere2 := JunSphereSurface center: 0.4 _, 0.3 _, 0.5 radius: 0.7.
	eyePoint := 0 _, 0 _, 10.
	random := Random new.
	form := Form extent: 400 @ 400 depth: 32.
	form getCanvas fillColor: Color black.
	offset := form extent // 2.
	form getCanvas
		in: [ :canvas | 
			-1.0 to: 1.0 by: 200.0 reciprocal do: [ :dy | 
				-1.0 to: 1.0 by: 200.0 reciprocal do: [ :dx | 
					| sight |
					sight := Jun3dLine from: eyePoint to: (dx asRadians sin * 2) _, (dy asRadians sin * 2)_, 0.0.
					((sphere1 crossPointsWithLine: sight) collect: [ :p | sphere1 -> p ])
						_, ((sphere2 crossPointsWithLine: sight) collect: [ :p | sphere2 -> p ])
						ifNotEmpty: [ :ts | 
							(ts asSortedCollection: [ :shallow :deep | shallow value z >= deep value z ]) first
								in: [ :assoc | 
									| point sphere c x y |
									point := assoc value.
									sphere := assoc key.
									c := sphere == sphere1
										ifTrue: [ (Color h: 240 s: 0.5 v: 1.0) mixed: point z abs with: (Color h: 240 s: 1 v: 0.0) ]
										ifFalse: [ (Color h: 60 s: 0.5 v: 1.0) mixed: ((point z - sphere2 center z) / sphere2 radius) abs with: (Color h: 60 s: 1 v: 0.0) ].
									x := (dx + 1) * 200.
									y := (dy + 1) * 200.
									canvas fillRectangle: (x @ y extent: 1 @ 1) color: c ] ] ] ] ].
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	morph on: #click send: #value to: [ morph delete ]