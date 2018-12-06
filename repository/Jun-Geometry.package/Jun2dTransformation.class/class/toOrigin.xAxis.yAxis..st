typical transformation
toOrigin: origin xAxis: xVector yAxis: yVector
	^ self new
		setA: xVector x;
		setB: xVector y;
		setC: yVector x;
		setD: yVector y;
		setM: origin x;
		setN: origin y;
		setP: 0.0;
		setQ: 0.0;
		setS: 1.0;
		yourself