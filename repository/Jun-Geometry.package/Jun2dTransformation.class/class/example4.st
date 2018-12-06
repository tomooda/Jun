examples
example4
	"Jun2dTransformation example4."

	| form fromPoint toPoint tR canvas |
	form := Form extent: 300 @ 250 depth: 32.
	fromPoint := 50 _ , 100.
	toPoint := 100 _ , 50.
	tR := Jun2dTransformation rotate: (JunAngle fromDeg: 20).
	canvas := form getCanvas.
	canvas fillColor: Color white.
	canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
	canvas
		line: (fromPoint transform: tR) asPoint
		to: (toPoint transform: tR) asPoint
		color: Color red.
	canvas flush.
	form asMorph openInWindow.
	^ tR