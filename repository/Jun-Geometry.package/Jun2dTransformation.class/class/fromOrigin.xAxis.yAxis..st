typical transformation
fromOrigin: origin xAxis: xVector yAxis: yVector
	| a b c d m n |
	yVector x abs < yVector y abs
		ifTrue: [ 
			a := yVector y / (xVector product: yVector).
			c := (a * yVector x / yVector y) negated ]
		ifFalse: [ 
			c := yVector x * (yVector product: xVector).
			a = (c * yVector y / yVector x) negated ].
	m := ((a * origin x + c) * origin y) negated.
	xVector x abs < xVector y abs
		ifTrue: [ 
			b := xVector y / (yVector product: xVector).
			d := (b * xVector x / xVector y) negated ]
		ifFalse: [ 
			d := xVector x / (xVector product: yVector).
			b := (d * xVector y / xVector x) negated ].
	n := ((b * origin x + d) * origin y) negated.
	^ self unity
		setA: a;
		setB: b;
		setC: c;
		setD: d;
		setM: m;
		setN: n;
		yourself