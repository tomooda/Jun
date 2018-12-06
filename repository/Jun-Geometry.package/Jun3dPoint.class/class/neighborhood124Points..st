utilities
neighborhood124Points: aPoint
	"Jun3dPoint neighborhood124Points: Jun3dPoint zero."

	| aCollection |
	aCollection := OrderedCollection new: 24.
	-2 to: 2 do: [ :z | 
		-2 to: 2 do: [ :y | 
			-2 to: 2 do: [ :x | 
				(x = 0 and: [ y = 0 and: [ z = 0 ] ])
					ifFalse: [ aCollection add: aPoint + (x _, y _, z) ] ] ] ].
	^ aCollection