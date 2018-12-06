typical transformation
rotate: anAngle around: aLine
	"Jun3dTransformation 
		rotate: (JunAngle fromDeg: 45) 
		around: (Array 
		with: (Jun3dPoint fromArray: #(75 75 0)) 
		with: (Jun3dPoint fromArray: #(75 75 75)))."

	| theAngle firstPoint lastPoint aVector aV aL aT aRx aRy aRz rRy rRx rT aTransformation |
	theAngle := JunAngle coerce: anAngle.
	firstPoint := Jun3dPoint coerce: aLine first.
	lastPoint := Jun3dPoint coerce: aLine last.
	aVector := lastPoint - firstPoint.
	aV := (aVector y squared + aVector z squared) sqrt.
	aL := (aVector x squared + aVector y squared + aVector z squared) sqrt.
	aT := self translate: firstPoint negated.
	aRx := self unity.
	aV isZero
		ifFalse: [ 
			aRx setE: aVector z / aV.
			aRx setF: aVector y / aV.
			aRx setH: (aVector y / aV) negated.
			aRx setI: aVector z / aV ].
	aRy := self unity.
	aL isZero
		ifFalse: [ 
			aRy setA: aV / aL.
			aRy setC: aVector x / aL.
			aRy setG: (aVector x / aL) negated.
			aRy setI: aV / aL ].
	aRz := self rotate: theAngle.
	rRy := self unity.
	aL isZero
		ifFalse: [ 
			rRy setA: aV / aL.
			rRy setC: (aVector x / aL) negated.
			rRy setG: aVector x / aL.
			rRy setI: aV / aL ].
	rRx := self unity.
	aV isZero
		ifFalse: [ 
			rRx setE: aVector z / aV.
			rRx setF: (aVector y / aV) negated.
			rRx setH: aVector y / aV.
			rRx setI: aVector z / aV ].
	rT := self translate: firstPoint.
	aTransformation := aT product: aRx.
	aTransformation := aTransformation product: aRy.
	aTransformation := aTransformation product: aRz.
	aTransformation := aTransformation product: rRy.
	aTransformation := aTransformation product: rRx.
	aTransformation := aTransformation product: rT.
	^ aTransformation