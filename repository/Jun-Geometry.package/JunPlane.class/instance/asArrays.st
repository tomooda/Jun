converting
asArrays
	| points |
	points := Array new: 4.
	points at: 1 put: self p1.
	points at: 2 put: self p2.
	points at: 3 put: self p3.
	points at: 4 put: self p1.
	^ Array with: points