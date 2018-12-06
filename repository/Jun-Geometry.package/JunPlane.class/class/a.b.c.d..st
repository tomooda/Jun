instance creation
a: aNumber1 b: aNumber2 c: aNumber3 d: aNumber4
	| aPlane normalVector pa pb pc p1 p2 p3 |
	aPlane := self new.
	aPlane setA: aNumber1.
	aPlane setB: aNumber2.
	aPlane setC: aNumber3.
	aPlane setD: aNumber4.
	normalVector := aNumber1 _, aNumber2 _, aNumber3.
	normalVector length < self accuracy
		ifTrue: [ ^ self error: 'Invalid parameters.' ].
	pa := pb := pc := nil.
	aPlane a abs >= self accuracy
		ifTrue: [ pa := (aPlane d / aPlane a) negated _, 0 _, 0 ].
	aPlane b abs >= self accuracy
		ifTrue: [ pb := 0 _, (aPlane d / aPlane b) negated _, 0 ].
	aPlane c abs >= self accuracy
		ifTrue: [ pc := 0 _, 0 _, (aPlane d / aPlane c) negated ].
	pa notNil
		ifTrue: [ 
			p1 := pa.
			pb notNil
				ifTrue: [ p2 := pb ]
				ifFalse: [ 
					pc notNil
						ifTrue: [ p2 := pc ]
						ifFalse: [ p2 := pa x _, 0.0 _, 1.0 ] ] ]
		ifFalse: [ 
			pb notNil
				ifTrue: [ 
					p1 := pb.
					pc notNil
						ifTrue: [ p2 := pc ]
						ifFalse: [ p2 := 1.0 _, pb y _, 0.0 ] ]
				ifFalse: [ 
					pc notNil
						ifTrue: [ 
							p1 := pc.
							p2 := 1.0 _, 0.0 _, pc z ]
						ifFalse: [ self error: 'Invalid parameters.' ] ] ].
	p2 := p1 + (p2 - p1) unitVector.
	p3 := p1 - p2 vectorProduct: normalVector unitVector.
	aPlane setP1: p1.
	aPlane setP2: p2.
	aPlane setP3: p3.
	^ aPlane