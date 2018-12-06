typical transformation
alignVector: aJun3dPoint1 withVector: aJun3dPoint2
	| aTransformation |
	aTransformation := [ self alignVector: aJun3dPoint1 to: aJun3dPoint2 ] on: [ :ex | ex return: self unity ].
	^ aTransformation