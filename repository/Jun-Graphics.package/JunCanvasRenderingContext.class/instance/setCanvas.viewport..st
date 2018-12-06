private
setCanvas: aCanvas viewport: aRectangle
	canvas := aCanvas.
	viewport := aRectangle.
	(viewport width max: viewport height) asFloat / 2.0
		in: [ :scale | 
			viewportTransformation := (Jun3dTransformation
				scale: scale _ , scale negated , 1)
				product:
					(Jun3dTransformation
						translate: (Jun2dPoint fromPoint: aRectangle center) , 0) ]