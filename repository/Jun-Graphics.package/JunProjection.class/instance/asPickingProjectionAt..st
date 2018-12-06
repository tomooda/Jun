converting
asPickingProjectionAt: aPoint
	| pickingCenter pickingZoomHeight projection |
	pickingCenter := self translateTo3dPointFromPoint: aPoint.
	pickingZoomHeight := (pickingCenter - (self translateTo3dPointFromPoint: aPoint + (0 _, -0.01))) length.
	projection := self copy.
	projection sightPoint: pickingCenter.
	self isParallel
		ifTrue: [ projection eyePoint: self eyePoint + pickingCenter - self sightPoint ].
	projection zoomHeight: pickingZoomHeight.
	^ projection