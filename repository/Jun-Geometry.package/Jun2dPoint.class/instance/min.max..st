comparing
min: minValue max: maxValue
	| minPoint maxPoint |
	minPoint := self class coerce: minValue.
	maxPoint := self class coerce: maxValue.
	^ self class x: (maxPoint x max: (self x min: minPoint x)) y: (maxPoint y max: (self y min: minPoint y))