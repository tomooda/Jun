utilities
numberOfPolygons
	^ components inject: 0 into: [ :sum :obj | sum + obj numberOfPolygons ]