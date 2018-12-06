comparing
= aValue
	(aValue respondsTo: #-)
		ifTrue: [ ^ (self - aValue) isZero ]
		ifFalse: [ ^ false ]