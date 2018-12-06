examples
example2
	"Jun3dPoint example2."

	| aPolyline1 aPolyline2 form viewPoint tS tP tT tPT tSPT |
	aPolyline1 := OrderedCollection new.
	aPolyline1 add: 0 _, 0 _, 50.
	aPolyline1 add: 50 _, 0 _, 50.
	aPolyline1 add: 50 _, 50 _, 50.
	aPolyline1 add: 0 _, 50 _, 50.
	aPolyline1 add: 0 _, 0 _, 50.
	aPolyline2 := OrderedCollection new.
	aPolyline2 add: 0 _, 0 _, 0.
	aPolyline2 add: 50 _, 0 _, 0.
	aPolyline2 add: 50 _, 50 _, 0.
	aPolyline2 add: 0 _, 50 _, 0.
	aPolyline2 add: 0 _, 0 _, 0.
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			| polylineBlock |
			viewPoint := 25 _, 25 _, 150.
			tS := Jun3dTransformation scale: 1.5 _, 1.5 _, 1.5.
			tP := Jun3dTransformation perspective: viewPoint.
			tT := Jun3dTransformation translate: (Jun3dPoint fromPoint: form extent // 2).
			tPT := tP product: tT.
			tSPT := (tS product: tP) product: tT.
			canvas fillColor: Color white.
			polylineBlock := [ :points :color | 1 to: points size - 1 do: [ :i | canvas line: (points at: i) to: (points at: i + 1) color: color ] ].
			polylineBlock value: (aPolyline2 collect: [ :p | (p transform: tPT) asPoint ]) value: Color gray.
			aPolyline1
				with: aPolyline2
				do: [ :p1 :p2 | 
					| from to |
					from := (p1 transform: tPT) asPoint.
					to := (p2 transform: tPT) asPoint.
					canvas line: from to: to color: Color red ].
			polylineBlock value: (aPolyline1 collect: [ :p | (p transform: tPT) asPoint ]) value: Color black.
			polylineBlock value: (aPolyline2 collect: [ :p | (p transform: tSPT) asPoint ]) value: Color gray.
			aPolyline1
				with: aPolyline2
				do: [ :p1 :p2 | 
					| from to |
					from := (p1 transform: tSPT) asPoint.
					to := (p2 transform: tSPT) asPoint.
					canvas line: from to: to color: Color red ].
			polylineBlock value: (aPolyline1 collect: [ :p | (p transform: tSPT) asPoint ]) value: Color black.
			canvas flush ].
	form asMorph openInWindow