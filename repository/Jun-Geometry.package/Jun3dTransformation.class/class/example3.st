examples
example3
	"Jun3dTransformation example3."

	| fromPoint toPoint tS form |
	fromPoint := 50 _, 100 _, 0.
	toPoint := 100 _, 50 _, 0.
	tS := Jun3dTransformation scale: 2 _, 2 _, 0.
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
			canvas line: (fromPoint transform: tS) asPoint to: (toPoint transform: tS) asPoint color: Color red.
			canvas flush ].
	form asMorph openInWindow.
	^ tS