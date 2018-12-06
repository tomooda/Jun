typical transformation
toOrigin: origin xAxis: xAxis yAxis: yAxis zAxis: zAxis
	^ self new
		setA: xAxis x;
		setB: xAxis y;
		setC: xAxis z;
		setD: yAxis x;
		setE: yAxis y;
		setF: yAxis z;
		setG: zAxis x;
		setH: zAxis y;
		setI: zAxis z;
		setL: origin x;
		setM: origin y;
		setN: origin z;
		setP: 0.0;
		setQ: 0.0;
		setR: 0.0;
		setS: 1.0;
		yourself