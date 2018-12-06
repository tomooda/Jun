transforming
transform: aTransformation
	^ self copy
		setComponents: (components collect: [ :obj | obj transform: aTransformation ]);
		yourself