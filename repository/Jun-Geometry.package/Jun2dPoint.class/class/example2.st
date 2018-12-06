examples
example2
	"Jun2dPoint example2."

	| aPolyline polylineBlock tS tT form canvas |
	aPolyline := OrderedCollection new.
	aPolyline add: 0 _, 0.
	aPolyline add: 50 _, 0.
	aPolyline add: 50 _, 50.
	aPolyline add: 0 _, 50.
	aPolyline add: 0 _, 0.
	form := Form extent: 200 @ 200 depth: 32.
	canvas := form getCanvas.
	polylineBlock := [ :points :color | 1 to: points size - 1 do: [ :i | canvas line: (points at: i) to: (points at: i + 1) color: color ] ].
	tS := Jun2dTransformation scale: 1.5 _, 1.5.
	tT := Jun2dTransformation translate: (Jun2dPoint fromPoint: form extent // 2).
	canvas fillColor: Color white.
	polylineBlock value: (aPolyline collect: [ :p | (p transform: tT) asPoint ]) value: Color black.
	polylineBlock value: (aPolyline collect: [ :p | (p transform: (tS product: tT)) asPoint ]) value: Color red.
	canvas flush.
	form asMorph openInWindow