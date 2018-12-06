tests
testUnity
	| unity |
	unity := Jun2dPoint unity.
	self assert: unity x equals: 1.0.
	self assert: unity y equals: 1.0