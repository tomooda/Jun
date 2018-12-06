displaying
displayLines: aCollectionOfJun3dPoint
	| t points near far w c |
	aCollectionOfJun3dPoint ifEmpty: [ ^ self ].
	t := self totalTransformation.
	near := projection near.
	far := projection far.
	points := aCollectionOfJun3dPoint
		collect: [ :point | 
			| p |
			p := point transform: t.
			(p z between: near and: far)
				ifFalse: [ ^ self ].
			p ].
	c := color.
	w := lineWidth.
	blocks
		nextPut:
			(points collect: #z) average
				-> [1 to: points size - 1 do: [:i | | p1 p2|
			p1 := points at: i.
			p2 := points at: i+1.
			canvas line: p1 asPoint to: p2 asPoint width: w color: c] ]	
