utilities
neighborhood8Points: aPoint
	"JunPoint neighborhood8Points: Point zero."

	| aCollection |
	aCollection := OrderedCollection new: 8.
	aCollection add: aPoint + (1 @ 0).
	aCollection add: aPoint + (1 @ 1).
	aCollection add: aPoint + (0 @ 1).
	aCollection add: aPoint + (-1 @ 1).
	aCollection add: aPoint + (-1 @ 0).
	aCollection add: aPoint + (-1 @ -1).
	aCollection add: aPoint + (0 @ -1).
	aCollection add: aPoint + (1 @ -1).
	^ aCollection