utility
solveLinearEquations: anArrayOfArrayOfFloat
	1 to: anArrayOfArrayOfFloat size do: [ :index | 
		| maxRowIndex maxRowValue row |
		maxRowIndex := index.
		maxRowValue := ((anArrayOfArrayOfFloat at: index) at: index) abs.
		index + 1 to: anArrayOfArrayOfFloat size do: [ :i | 
			| v |
			v := ((anArrayOfArrayOfFloat at: i) at: index) abs.
			maxRowValue < v
				ifTrue: [ 
					maxRowValue := v.
					maxRowIndex := i ] ].
		index < maxRowIndex
			ifTrue: [ 
				| t |
				t := anArrayOfArrayOfFloat at: index.
				anArrayOfArrayOfFloat at: index put: (anArrayOfArrayOfFloat at: maxRowIndex).
				anArrayOfArrayOfFloat at: maxRowIndex put: t ].
		row := anArrayOfArrayOfFloat at: index.
		maxRowValue := row at: index.
		index to: row size do: [ :i | row at: i put: (row at: i) / maxRowValue ].
		index + 1 to: anArrayOfArrayOfFloat size do: [ :i | 
			| r v |
			r := anArrayOfArrayOfFloat at: i.
			v := r at: index.
			index to: r size do: [ :c | r at: c put: (r at: c) - (v * (row at: c)) ] ] ].
	anArrayOfArrayOfFloat size to: 2 by: -1 do: [ :index | 
		| row |
		row := anArrayOfArrayOfFloat at: index.
		index - 1 to: 1 by:  -1 do: [ :i | 
			| r v |
			r := anArrayOfArrayOfFloat at: i.
			v := r at: index.
			index to: row size do: [ :c | r at: c put: (r at: c) - (v * (row at: c)) ] ] ]