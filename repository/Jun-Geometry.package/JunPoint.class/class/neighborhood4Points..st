utilities
neighborhood4Points: aPoint 
	"JunPoint neighborhood4Points: Point zero."

	| aCollection |
	aCollection := OrderedCollection new: 4.
	aCollection add: aPoint + (1 @ 0).
	aCollection add: aPoint + (0 @ 1).
	aCollection add: aPoint + (-1 @ 0).
	aCollection add: aPoint + (0 @ -1).
	^aCollection