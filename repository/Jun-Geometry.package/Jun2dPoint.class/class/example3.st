examples
example3
	"Jun2dPoint example3."

	| aPolyline polylineBlock tR tT form canvas |
	aPolyline := OrderedCollection new.
	aPolyline add: 0 _ , 0.
	aPolyline add: 50 _ , 0.
	aPolyline add: 50 _ , 50.
	aPolyline add: 0 _ , 50.
	aPolyline add: 0 _ , 0.
	form := Form extent: 200 @ 200 depth: 32.
	canvas := form getCanvas.
	polylineBlock := [ :points :color | 1 to: points size - 1 do: [ :i | canvas line: (points at: i) to: (points at: i + 1) color: color ] ].
	tR := Jun2dTransformation rotate: (JunAngle fromDeg: 30).
	tT := Jun2dTransformation
		translate: (Jun2dPoint fromPoint: form extent // 2).
	canvas fillColor: Color white.
	polylineBlock
		value: (aPolyline collect: [ :p | (p transform: tT) asPoint ])
		value: Color black.
	polylineBlock
		value: (aPolyline collect: [ :p | (p transform: (tR product: tT)) asPoint ])
		value: Color red.
	canvas flush.
	form asMorph openInWindow