drawing
drawOn: aCanvas
	(form isNil or: [ form extent ~= self innerBounds extent ])
		ifTrue: [ form := Form extent: self innerBounds extent depth: 32 ].
	self drawOnForm: form.
	aCanvas drawImage: form at: self innerBounds origin