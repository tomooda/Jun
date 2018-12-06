arithmetic
min: minValue max: maxValue
	"Caution! The original Jun had the opposite semantics.
	I adopted Squeak/Pharo's semantics to keep sound polymorphism
	in the Smalltalk system. Any code that assumes the original Jun's semantics
	needs modification."

	| minPoint maxPoint |
	minPoint := self class coerce: minValue.
	maxPoint := self class coerce: maxValue.
	^ self class
		x: (maxPoint x max: (self x min: minPoint x))
		y: (maxPoint y max: (self y min: minPoint y))
		z: (maxPoint z max: (self z min: minPoint z))