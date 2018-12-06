instance creation
fromPoints: aCollectionOfJunPoint
	| boundingBox |
	aCollectionOfJunPoint isEmpty
		ifTrue: [ ^ self new ].
	boundingBox := self origin: aCollectionOfJunPoint first corner: aCollectionOfJunPoint first.
	2 to: aCollectionOfJunPoint size do: [ :index | boundingBox := boundingBox add: (aCollectionOfJunPoint at: index) ].
	^ boundingBox