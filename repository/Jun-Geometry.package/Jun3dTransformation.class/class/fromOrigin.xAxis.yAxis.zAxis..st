typical transformation
fromOrigin: origin xAxis: xAxis yAxis: yAxis zAxis: zAxis
	| t equations |
	t := self new.
	equations := Array new: 4.
	equations
		at: 1
		put:
			(Array
				with: origin x
				with: origin y
				with: origin z
				with: 1.0
				with: 0.0).
	equations
		at: 2
		put:
			(Array
				with: xAxis x + origin x
				with: xAxis y + origin y
				with: xAxis z + origin z
				with: 1.0
				with: -1.0).
	equations
		at: 3
		put:
			(Array
				with: yAxis x + origin x
				with: yAxis y + origin y
				with: yAxis z + origin z
				with: 1.0
				with: 0.0).
	equations
		at: 4
		put:
			(Array
				with: zAxis x + origin x
				with: zAxis y + origin y
				with: zAxis z + origin z
				with: 1.0
				with: 0.0).
	self solveLinearEquations: equations.
	t setA: equations first last negated.
	t setD: equations second last negated.
	t setG: equations third last negated.
	t setL: equations fourth last negated.
	equations
		at: 1
		put:
			(Array
				with: origin x
				with: origin y
				with: origin z
				with: 1.0
				with: 0.0).
	equations
		at: 2
		put:
			(Array
				with: xAxis x + origin x
				with: xAxis y + origin y
				with: xAxis z + origin z
				with: 1.0
				with: 0.0).
	equations
		at: 3
		put:
			(Array
				with: yAxis x + origin x
				with: yAxis y + origin y
				with: yAxis z + origin z
				with: 1.0
				with: -1.0).
	equations
		at: 4
		put:
			(Array
				with: zAxis x + origin x
				with: zAxis y + origin y
				with: zAxis z + origin z
				with: 1.0
				with: 0.0).
	self solveLinearEquations: equations.
	t setB: equations first last negated.
	t setE: equations second last negated.
	t setH: equations third last negated.
	t setM: equations fourth last negated.
	equations
		at: 1
		put:
			(Array
				with: origin x
				with: origin y
				with: origin z
				with: 1.0
				with: 0.0).
	equations
		at: 2
		put:
			(Array
				with: xAxis x + origin x
				with: xAxis y + origin y
				with: xAxis z + origin z
				with: 1.0
				with: 0.0).
	equations
		at: 3
		put:
			(Array
				with: yAxis x + origin x
				with: yAxis y + origin y
				with: yAxis z + origin z
				with: 1.0
				with: 0.0).
	equations
		at: 4
		put:
			(Array
				with: zAxis x + origin x
				with: zAxis y + origin y
				with: zAxis z + origin z
				with: 1.0
				with: -1.0).
	self solveLinearEquations: equations.
	t setC: equations first last negated.
	t setF: equations second last negated.
	t setI: equations third last negated.
	t setN: equations fourth last negated.
	t setP: 0.0.
	t setQ: 0.0.
	t setR: 0.0.
	t setS: 1.0.
	^ t