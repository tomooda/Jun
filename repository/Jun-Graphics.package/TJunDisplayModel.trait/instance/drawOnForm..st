drawing
drawOnForm: aForm
	| rc |
	rc := aForm renderingContext.
	rc
		backgroundColor: self color;
		clear;
		projection: self projection;
		enableCullface;
		enableLighting;
		enableLightIndex: 0;
		ambientLight: (Color gray: 0.6);
		lightIndex: 0 parallel: self projection sightVector color: (Color gray: 0.3);
		color: Color white.
	self object renderOn: rc.
	rc flush.
	^ aForm