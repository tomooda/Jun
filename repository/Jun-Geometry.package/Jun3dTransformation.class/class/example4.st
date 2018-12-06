examples
example4
	"Jun3dTransformation example4."

	| fromPoint toPoint tR form |
	fromPoint := 50 _, 100 _, 0.
	toPoint := 100 _, 50 _, 0.
	tR := Jun3dTransformation rotate: (JunAngle fromDeg: 20).
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
			canvas line: (fromPoint transform: tR) asPoint to: (toPoint transform: tR) asPoint color: Color red.
			canvas flush ].
	form asMorph openInWindow.
	^ tR