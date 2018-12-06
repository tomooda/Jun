drawing
drawOnSpartaCanvas: aCanvas
	| innerBounds extent |
	super drawOnSpartaCanvas: aCanvas.
	self drawBorderOnSpartaCanvas: aCanvas.
	innerBounds := self innerBounds.
	extent := innerBounds extent.
	(form isNil or: [ form extent ~= extent ])
		ifTrue: [ form := Form extent: extent depth: 32 ].
	self drawOnForm: form.
	aCanvas fill
		path: innerBounds;
		paint: (aCanvas bitmap fromForm: form);
		draw