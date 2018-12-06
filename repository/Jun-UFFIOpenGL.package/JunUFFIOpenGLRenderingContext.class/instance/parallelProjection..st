projecting
parallelProjection: aJunParallelProjection
	forms first
		ifNotNil: [ :form | 
			| aspect halfHeight halfWidth |
			self setProjection: aJunParallelProjection copy.
			aspect := form width asFloat / form height asFloat.
			halfHeight := projection height / 2.0.
			halfWidth := halfHeight * aspect.
			self
				activate: [ :gl | 
					gl matrixMode: GL_PROJECTION.
					gl loadIdentity.
					gl
						ortho_left: halfWidth negated
						right: halfWidth
						bottom: halfHeight
						top: halfHeight negated
						zNear: projection near
						zFar: projection far.
					gl matrixMode: GL_MODELVIEW.
					gl loadIdentity.
					gl
						loadMatrixf:
							(Jun3dTransformation
								fromOrigin: aJunParallelProjection eyePoint
								xAxis: aJunParallelProjection unitRightVector
								yAxis: aJunParallelProjection unitUpVector
								zAxis: aJunParallelProjection unitSightVector negated) asByteArray16f ] ]