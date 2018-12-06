converting
asRotationMatrix
	^ self notYetImplemented "| anArray |
	anArray := Array new: 2 * 2.
	anArray at: 1 put: a.
	anArray at: 2 put: b.
	anArray at: 3 put: c.
	anArray at: 4 put: d.
	^JunMatrix new: 2 collection: anArray"