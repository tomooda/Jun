Extension { #name : #Number }

{ #category : #'*Jun-Geometry-Basic' }
Number >> _ [
	^ Jun1dPoint x: self
]

{ #category : #'*Jun-Geometry-Basic' }
Number >> asDegrees [
	^ JunAngle degrees: self
]

{ #category : #'*Jun-Geometry-Basic' }
Number >> asRadians [
	^ JunAngle radians: self
]
