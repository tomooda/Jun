displaying
displayLine: aCollectionOfJun3dPoint
	aCollectionOfJun3dPoint size <= 2
		ifTrue: [ self displayLines: aCollectionOfJun3dPoint ]
		ifFalse: [ self displayLines: (Array with: aCollectionOfJun3dPoint first with: aCollectionOfJun3dPoint last) ]