typical objects - spheres
sphere: degree texture: aJunTexture
	"(Jun3dDisplayObject sphere: 15 texture: JunTexture globe) show."

	| sphere |
	sphere := Jun3dDisplayCompoundObject new.
	0 to: 180 - 1 by: degree do: [ :latitude | 
		0 to: 360 - 1 by: degree do: [ :longitude | 
			| polygon |
			polygon := Jun3dDisplayPolygon
				points:
					(Array
						with: (Jun3dPoint rho: 2.0 phi: longitude asDegrees theta: (latitude + degree) asDegrees)
						with: (Jun3dPoint rho: 2.0 phi: (longitude + degree) asDegrees theta: (latitude + degree) asDegrees)
						with: (Jun3dPoint rho: 2.0 phi: (longitude + degree) asDegrees theta: latitude asDegrees)
						with: (Jun3dPoint rho: 2.0 phi: longitude asDegrees theta: latitude asDegrees)).
			polygon
				setTexture: aJunTexture
				points:
					(Array
						with: longitude / 360.0 _, ((latitude + degree) / 180.0)
						with: (longitude + degree) / 360.0 _, ((latitude + degree) / 180.0)
						with: (longitude + degree) / 360.0 _, (latitude / 180.0)
						with: longitude / 360.0 _, (latitude / 180.0)).
			sphere add: polygon ] ].
	^ sphere