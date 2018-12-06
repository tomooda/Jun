examples
example1
	"Jun2dPoint example1."

	| aPoint |
	aPoint := 1 , 0.5.
	Transcript
		cr;
		show: aPoint printString.
	Transcript
		cr;
		show: aPoint storeString.
	self todo: 'asJunOpenGL3dObject'.
	"aPoint asJunOpenGL3dObject showWithUnitAxes."
	 ^ aPoint