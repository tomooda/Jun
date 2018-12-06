typical transformation
alignPoints: anArrayOfAssociations
	"Jun2dTransformation alignPoints: (Array
			with: 0 , 0  -> (0 , -1)
			with: 2 , 0  -> (-1 , 0)
			with: 0, -3 -> (-2, -1))."

	| assocs aTransformation solvingBlock |
	anArrayOfAssociations size < 3
		ifTrue: [ ^ self error: 'Can''t decide a transformation with less than 3 mappings.' ].
	assocs := anArrayOfAssociations copyFrom: 1 to: 3.
	aTransformation := self unity.
	solvingBlock := [ :getSelector :setSelectors | 
	| equations |
	equations := assocs
		collect: [ :assoc | Array with: assoc key x with: assoc key y with: 1.0 with: (assoc value perform: getSelector) negated ].
	self solveLinearEquations: equations.
	1 to: 3 do: [ :index | aTransformation perform: (setSelectors at: index) with: (equations at: index) last negated ] ].
	solvingBlock value: #x value: #(#setA: #setC: #setM:).
	solvingBlock value: #y value: #(#setB: #setD: #setN:).
	^ aTransformation