comparing
= aTransformation
	self class == aTransformation class
		ifFalse: [ ^ false ].
	^ (((((((a = aTransformation a and: [ b = aTransformation b ]) and: [ p = aTransformation p ])
		and: [ c = aTransformation c ]) and: [ d = aTransformation d ]) and: [ q = aTransformation q ])
		and: [ m = aTransformation m ]) and: [ n = aTransformation n ]) and: [ s = aTransformation s ]