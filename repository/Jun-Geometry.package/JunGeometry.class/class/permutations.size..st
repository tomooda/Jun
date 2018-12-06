utilities
permutations: sequenceableCollection size: numberOfElements
	"JunGeometry permutations: #(1 2 3 4) size: 3."

	| howMany aCollection aStream |
	howMany := sequenceableCollection size ** numberOfElements.
	aCollection := OrderedCollection new: howMany.
	howMany timesRepeat: [ aCollection add: (OrderedCollection new: numberOfElements) ].
	(numberOfElements to: 1 by: -1)
		do: [ :n | 
			| index |
			index := 1.
			(sequenceableCollection size ** (n - 1)) asInteger
				timesRepeat: [ 
					(1 to: sequenceableCollection size)
						do: [ :i | 
							(howMany / (sequenceableCollection size ** n)) asInteger
								timesRepeat: [ 
									(aCollection at: index) addFirst: i.
									index := index + 1 ] ] ] ].
	self
		assert: [ aStream := (Array new: howMany) writeStream ]
		do: [ 
			aCollection do: [ :each | aStream nextPut: (each asArray collect: [ :index | sequenceableCollection at: index ]) ].
			aCollection := aStream contents ]
		ensure: [ aStream close ].
	^ aCollection