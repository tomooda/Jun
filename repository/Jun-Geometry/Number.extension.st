Extension { #name : #Number }

{ #category : #'*Jun-Geometry-Basic' }
Number >> ,, aNumber2 [
	^ Jun2dPoint x: self y: aNumber2
]

{ #category : #'*Jun-Geometry-Basic' }
Number >> asDegrees [
	^ JunAngle degrees: self
]

{ #category : #'*Jun-Geometry-Basic' }
Number >> asJun3dPoint [

	^ Jun3dPoint x: self y: self z: self
]

{ #category : #'*Jun-Geometry-Basic' }
Number >> asRadians [
	^ JunAngle radians: self
]
