transformation
transformationToRotate: anAngle 
	^ Jun3dTransformation rotate: anAngle around: (self to: self + (0 _, 0 , 1))