private
totalTransformation
	^ totalTransformation
		ifNil: [ totalTransformation := (transformation product: projectionTransformation) product: viewportTransformation ]