utilities
neighborhood24Points: aPoint
	"Jun2dPoint neighborhood24Points: Point zero."

	| aCollection |
	aCollection := OrderedCollection new: 24.
	-2 to: 2 do: [ :y | 
		-2 to: 2 do: [ :x | 
			(x = 0 and: [ y = 0 ])
				ifFalse: [ aCollection add: aPoint + (x _ , y) ] ] ].
	^ aCollection