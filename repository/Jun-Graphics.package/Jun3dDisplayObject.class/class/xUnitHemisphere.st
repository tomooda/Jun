typical objects - spheres
xUnitHemisphere
	^ self hemisphere
		transform:
			((((Jun3dTransformation scale: 0.5 _, 0.5 _, 0.5) product: (Jun3dTransformation translate: 0 _, 0 _, 0.5))
				product: (Jun3dTransformation rotateZ: (JunAngle fromDeg: 90)))
				product: (Jun3dTransformation rotateY: (JunAngle fromDeg: 90)))