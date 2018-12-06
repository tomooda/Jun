typical transformation
alignPoints: anArrayOfAssociations
	"Jun3dTransformation alignPoints: (Array
			with: 0 , 0 , 0 -> (0 , -1 , 0)
			with: 1 , 0 , 0 -> (-1 , 0 , 0)
			with: 0 , 2 , 0 -> (0 , 1 , 0)
			with: 0 , 0 , 1 -> (0 , 0 , 1))."

	| assocs aTransformation solvingBlock |
	anArrayOfAssociations size < 4
		ifTrue: [ ^ self error: 'Can''t decide a transformation with less than 4 mappings.' ].
	assocs := anArrayOfAssociations copyFrom: 1 to: 4.
	aTransformation := self unity.
	solvingBlock := [ :getSelector :setSelectors | 
	| equations |
	equations := assocs
		collect: [ :assoc | 
			Array
				with: assoc key x
				with: assoc key y
				with: assoc key z
				with: 1.0
				with: (assoc value perform: getSelector) negated ].
	self solveLinearEquations: equations.
	1 to: 4 do: [ :index | aTransformation perform: (setSelectors at: index) with: (equations at: index) last negated] ].
	solvingBlock value: #x value: #(#setA: #setD: #setG: #setL:).
	solvingBlock value: #y value: #(#setB: #setE: #setH: #setM:).
	solvingBlock value: #z value: #(#setC: #setF: #setI: #setN:).
	^ aTransformation