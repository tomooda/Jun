examples
example1
	"Jun3dPoint example1."

	| aPoint |
	aPoint := 1 _, 0.5 _, 0.25.
	Transcript
		cr;
		show: aPoint printString.
	Transcript
		cr;
		show: aPoint storeString.
	self todo: 'asJunOpenGL3dObject'.
	"aPoint asJunOpenGL3dObject showWithUnitAxes."
	^aPoint