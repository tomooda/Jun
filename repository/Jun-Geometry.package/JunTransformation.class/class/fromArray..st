instance creation
fromArray: anArray
	"Jun2dTransformation fromArray: #(1 0 0 0 1 0 0 0 1)."
	"Jun3dTransformation fromArray: #(1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1)."

	| aTransformation |
	aTransformation := self basicNew.
	aTransformation setFromArray: anArray.
	^ aTransformation