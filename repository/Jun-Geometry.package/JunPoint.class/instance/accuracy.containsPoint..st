testing
accuracy: aNumber containsPoint: aJunPoint
	^ (self distance: (self class coerce: aJunPoint)) < aNumber