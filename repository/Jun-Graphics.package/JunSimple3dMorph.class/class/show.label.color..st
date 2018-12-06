utilities
show: aJun3dDisplayObject label: aString color: aColor
	| morph window |
	morph := (self on: aJun3dDisplayObject)
		fit;
		color: aColor;
		yourself.
	window := morph openInWindowLabeled: aString.
	morph color: aColor.
	^ window