Extension { #name : #Point }

{ #category : #'*Jun-Geometry-Basic' }
Point >> * arg [ 
	"Answer a Point that is the product of the receiver and arg."

	(arg isKindOf: self class) ifTrue: [^ (x * arg x) @ (y * arg y)].
	^ arg adaptToPoint: self andSend: #*
]

{ #category : #'*Jun-Geometry-Basic' }
Point >> + arg [ 
	"Answer a Point that is the sum of the receiver and arg."

	(arg isKindOf: self class) ifTrue: [^ (x + arg x) @ (y + arg y)].
	^ arg adaptToPoint: self andSend: #+
]

{ #category : #'*Jun-Geometry-Basic' }
Point >> , aNumber [
	^ Jun3dPoint x: self x y: self y z: aNumber
]

{ #category : #'*Jun-Geometry-Basic' }
Point >> - arg [ 
	"Answer a Point that is the difference of the receiver and arg."

	(arg isKindOf: self class) ifTrue: [^ (x - arg x) @ (y - arg y)].
	^ arg adaptToPoint: self andSend: #-
]

{ #category : #'*Jun-Geometry-Basic' }
Point >> / arg [ 
	"Answer a Point that is the quotient of the receiver and arg."

	(arg isKindOf: self class) ifTrue: [^ (x / arg x) @ (y / arg y)].
	^ arg adaptToPoint: self andSend: #/
]

{ #category : #'*Jun-Geometry-Basic' }
Point >> // arg [ 
	"Answer a Point that is the quotient of the receiver and arg."

	(arg isKindOf: self class) ifTrue: [^ (x // arg x) @ (y // arg y)].
	^ arg adaptToPoint: self andSend: #//
]

{ #category : #'*Jun-Geometry-Basic' }
Point >> \\ arg [ 
	"Answer a Point that is the mod of the receiver and arg."

	(arg isKindOf: self class) ifTrue: [^ (x \\ arg x) @ (y \\ arg y)].
	^ arg adaptToPoint: self andSend: #\\
]

{ #category : #'*Jun-Geometry-Basic' }
Point >> asJun3dPoint [
	^ Jun3dPoint fromPoint: self
]
