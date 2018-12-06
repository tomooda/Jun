examples
example1
	"Jun3dTransformation example1."

	| aTransformation |
	aTransformation := Jun3dTransformation fromArray: #(1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1).
	Transcript
		cr;
		show: aTransformation printString.
	Transcript
		cr;
		show: aTransformation storeString.
	^ aTransformation