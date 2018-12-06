projecting
perspectiveProjection: aJunPerspectiveProjection
	forms first
		ifNotNil: [ :form | 
			| aspect halfHeight halfWidth |
			self setProjection: aJunPerspectiveProjection copy.
			aspect := form width asFloat / form height.
			halfHeight := (aJunPerspectiveProjection fovy / 2.0) tan
				* aJunPerspectiveProjection near.
			halfWidth := halfHeight * aspect.
			self
				activate: [ :gl | 
					gl matrixMode: GL_PROJECTION.
					gl loadIdentity.
					gl
						frustum_left: halfWidth negated asFloat
						right: halfWidth asFloat
						bottom: halfHeight asFloat
						top: halfHeight negated asFloat
						zNear: aJunPerspectiveProjection near asFloat
						zFar: aJunPerspectiveProjection far asFloat.
					gl matrixMode: GL_MODELVIEW.
					gl loadIdentity.
					gl
						loadMatrixf:
							(Jun3dTransformation
								fromOrigin: aJunPerspectiveProjection eyePoint
								xAxis: aJunPerspectiveProjection unitRightVector
								yAxis: aJunPerspectiveProjection unitUpVector
								zAxis: aJunPerspectiveProjection unitSightVector negated) asByteArray16f ] ]