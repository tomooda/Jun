instance creation
onForm: aForm
	^ self on: aForm getCanvas viewport: (0 @ 0 extent: aForm extent)