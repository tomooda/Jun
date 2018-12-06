utilities
neighborhood6Points: aPoint
	"Jun3dPoint neighborhood6Points: Jun3dPoint zero."

	| aCollection |
	aCollection := OrderedCollection new: 6.
	aCollection add: aPoint + (0 _, 0 _, 1).
	aCollection add: aPoint + (1 _, 0 _, 0).
	aCollection add: aPoint + (0 _, 1 _, 0).
	aCollection add: aPoint + (-1 _, 0 _, 0).
	aCollection add: aPoint + (0 _, -1 _, 0).
	aCollection add: aPoint + (0 _, 0 _, -1).
	^ aCollection