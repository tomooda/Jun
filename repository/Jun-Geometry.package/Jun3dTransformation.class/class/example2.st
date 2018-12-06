examples
example2
	"Jun3dTransformation example2."

	| fromPoint toPoint tT form |
	fromPoint := 50 _, 100 _, 0.
	toPoint := 100 _, 50 _, 0.
	tT := Jun3dTransformation translate: 100 _, 100 _, 0.
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
			canvas line: (fromPoint transform: tT) asPoint to: (toPoint transform: tT) asPoint color: Color red.
			canvas flush ].
	form asMorph openInWindow.
	^ tT