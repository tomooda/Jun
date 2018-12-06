examples
example5
	"Jun3dTransformation example5."

	| fromPoint toPoint aLine form |
	fromPoint := 50 _, 100 _, 0.
	toPoint := 100 _, 50 _, 0.
	aLine := Array
		with: (fromPoint center: toPoint)
		with: ((fromPoint center: toPoint) transform: (Jun3dTransformation translate: 0 _, 0 _, 100)).
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
			10 to: 170 by: 10 do: [ :angle | 
				| tR |
				tR := Jun3dTransformation rotate: (JunAngle fromDeg: angle) around: aLine.
				canvas line: (fromPoint transform: tR) asPoint to: (toPoint transform: tR) asPoint color: Color red ].
			canvas flush ].
	form asMorph openInWindow