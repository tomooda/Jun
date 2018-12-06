typical transformation
rotate: anAngle around: aPoint
	"Jun2dTransformation 
	rotate: (JunAngle fromDeg: 45) 
	around: (Jun2dPoint fromArray: #(75 75))."

	| theAngle thePoint aT aRz rT aTransformation |
	theAngle := JunAngle coerce: anAngle.
	thePoint := Jun2dPoint coerce: aPoint.
	aT := self translate: thePoint negated.
	aRz := self rotate: theAngle.
	rT := self translate: thePoint.
	aTransformation := aT product: aRz.
	aTransformation := aTransformation product: rT.
	^ aTransformation