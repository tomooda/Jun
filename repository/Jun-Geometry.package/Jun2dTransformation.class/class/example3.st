examples
example3
	"Jun2dTransformation example3."

	| form fromPoint toPoint tS canvas |
	form := Form extent: 300 @ 250 depth: 32.
	fromPoint := 50 _ , 100.
	toPoint := 100 _ , 50.
	tS := Jun2dTransformation scale: 2 _ , 2.
	canvas := form getCanvas.
	canvas fillColor: Color white.
	canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
	canvas
		line: (fromPoint transform: tS) asPoint
		to: (toPoint transform: tS) asPoint
		color: Color red.
	canvas flush.
	form asMorph openInWindow.
	^ tS