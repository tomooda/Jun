functions
normalizedLine
	| copy n |
	copy := self copy.
	n := self n.
	copy setF: f * n.
	copy setG: g * n.
	^ copy