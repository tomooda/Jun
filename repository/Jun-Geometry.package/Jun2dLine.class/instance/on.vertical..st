private
on: aPoint vertical: aLine
	| thePoint theLine |
	thePoint := Jun2dPoint coerce: aPoint.
	(aLine isKindOf: self class)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := self class from: aLine first to: aLine last ].
	self setX0: thePoint x.
	self setY0: thePoint y.
	self setF: theLine g negated.
	self setG: theLine f