examples
example5
	"Jun2dTransformation example5."

	| form fromPoint toPoint tR canvas |
	form := Form extent: 300 @ 250 depth: 32.
	fromPoint := 50 _, 100.
	toPoint := 100 _, 50.
	tR := Jun2dTransformation rotate: (JunAngle fromDeg: 20).
	canvas := form getCanvas.
	canvas fillColor: Color white.
	canvas
		line: fromPoint asPoint
		to: toPoint asPoint
		color: Color blue.
	10 to: 170 by: 10 do: [ :angle | 
		tR := Jun2dTransformation rotate: (JunAngle fromDeg: angle) around: (fromPoint center: toPoint).
		canvas
			line: (fromPoint transform: tR) asPoint
			to: (toPoint transform: tR) asPoint
			color: Color red ].
	canvas flush.
	form asMorph openInWindow.
	^ tR