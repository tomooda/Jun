converting
asRotationMatrix
	^ self notYetImplemented "| anArray |
	anArray := Array new: 3 * 3.
	anArray at: 1 put: a.
	anArray at: 2 put: b.
	anArray at: 3 put: c.
	anArray at: 4 put: d.
	anArray at: 5 put: e.
	anArray at: 6 put: f.
	anArray at: 7 put: g.
	anArray at: 8 put: h.
	anArray at: 9 put: i.
	^JunMatrix new: 3 collection: anArray"