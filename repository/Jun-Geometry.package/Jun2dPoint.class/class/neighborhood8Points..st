utilities
neighborhood8Points: aPoint
	"Jun2dPoint neighborhood8Points: Jun2dPoint zero."

	| aCollection |
	aCollection := OrderedCollection new: 8.
	aCollection add: aPoint + (1 _, 0).
	aCollection add: aPoint + (1 _, 1).
	aCollection add: aPoint + (0 _, 1).
	aCollection add: aPoint + (-1 _, 1).
	aCollection add: aPoint + (-1 _, 0).
	aCollection add: aPoint + (-1 _, -1).
	aCollection add: aPoint + (0 _, -1).
	aCollection add: aPoint + (1 _, -1).
	^ aCollection