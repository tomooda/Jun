viewing
showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector viewFactor: viewFactor zoomHeight: zoomHeight in: displayRectangle
	| projection form rc window |
	projection := JunPerspectiveProjection default.
	eyePoint ifNotNil: [ projection eyePoint: eyePoint ].
	sightPoint ifNotNil: [ projection sightPoint: sightPoint ].
	upVector ifNotNil: [ projection upVector: upVector ].
	viewFactor ifNotNil: [ projection viewFactor: viewFactor ].
	zoomHeight
		ifNil: [ projection zoomHeight: (self boundingBox origin distance: self boundingBox corner) * 0.8 ]
		ifNotNil: [ projection zoomHeight: zoomHeight ].
	form := Form extent: 400 @ 400 depth: 32.
	rc := form renderingContext.
	form getCanvas fillColor: Color blue.
	rc projection: projection.
	rc clear.
	rc enableCullface.
	self renderOn: rc.
	rc flush.
	window := form asMorph openInWindow.
	displayRectangle ifNotNil: [ window bounds: displayRectangle ]