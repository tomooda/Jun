constants access
zero
	| box pointClass |
	box := self new.
	pointClass := box pointClass.
	box origin: pointClass zero corner: pointClass zero.
	^ box