utilities
neighborhood4Points: aPoint
	"Jun2dPoint neighborhood4Points: Jun2dPoint zero."

	| aCollection |
	aCollection := OrderedCollection new: 4.
	aCollection add: aPoint + (1 _, 0).
	aCollection add: aPoint + (0 _, 1).
	aCollection add: aPoint + (-1 _, 0).
	aCollection add: aPoint + (0 _, -1).
	^ aCollection