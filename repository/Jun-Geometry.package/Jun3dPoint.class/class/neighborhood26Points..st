utilities
neighborhood26Points: aPoint
	"Jun3dPoint neighborhood26Points: Jun3dPoint zero."

	| aCollection |
	aCollection := OrderedCollection new: 9 + 8 + 9.
	aCollection add: aPoint + (0 _, 0 _, 1).
	aCollection add: aPoint + (1 _, 0 _, 1).
	aCollection add: aPoint + (1 _, 1 _, 1).
	aCollection add: aPoint + (0 _, 1 _, 1).
	aCollection add: aPoint + (-1 _, 1 _, 1).
	aCollection add: aPoint + (-1 _, 0 _, 1).
	aCollection add: aPoint + (-1 _, -1 _, 1).
	aCollection add: aPoint + (0 _, -1 _, 1).
	aCollection add: aPoint + (1 _, -1 _, 1).
	aCollection add: aPoint + (1 _, 0 _, 0).
	aCollection add: aPoint + (1 _, 1 _, 0).
	aCollection add: aPoint + (0 _, 1 _, 0).
	aCollection add: aPoint + (-1 _, 1 _, 0).
	aCollection add: aPoint + (-1 _, 0 _, 0).
	aCollection add: aPoint + (-1 _, -1 _, 0).
	aCollection add: aPoint + (0 _, -1 _, 0).
	aCollection add: aPoint + (1 _, -1 _, 0).
	aCollection add: aPoint + (1 _, 0 _, -1).
	aCollection add: aPoint + (1 _, 1 _, -1).
	aCollection add: aPoint + (0 _, 1 _, -1).
	aCollection add: aPoint + (-1 _, 1 _, -1).
	aCollection add: aPoint + (-1 _, 0 _, -1).
	aCollection add: aPoint + (-1 _, -1 _, -1).
	aCollection add: aPoint + (0 _, -1 _, -1).
	aCollection add: aPoint + (1 _, -1 _, -1).
	aCollection add: aPoint + (0 _, 0 _, -1).
	^ aCollection