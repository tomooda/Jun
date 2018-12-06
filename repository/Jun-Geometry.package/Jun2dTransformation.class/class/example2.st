examples
example2
	"Jun2dTransformation example2."

	| form fromPoint toPoint tT canvas  |
	form := Form extent: 300@250 depth: 32.
	fromPoint := 50 _, 100.
	toPoint := 100 _, 50.
	tT := Jun2dTransformation translate: 100 _, 100.
	canvas := form getCanvas.
	canvas fillColor: Color white.
	canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
	canvas line: (fromPoint transform: tT) asPoint to: (toPoint transform: tT) asPoint color: Color red.
	canvas flush.
	form asMorph openInWindow.
	^tT