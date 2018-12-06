tests
testUnity
	"unity transformation is the identity function"
	| unity |
	unity := Jun2dTransformation unity.
	self assert: (0 _, 0 transform: unity) equals: 0 _, 0.
	self assert: (1 _, 0 transform: unity) equals: 1 _, 0.
	self assert: (0 _, 1 transform: unity) equals: 0 _, 1.
	self assert: (1 _, 1 transform: unity) equals: 1 _, 1