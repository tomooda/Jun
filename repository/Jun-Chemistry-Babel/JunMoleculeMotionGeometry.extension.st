Extension { #name : #JunMoleculeMotionGeometry }

{ #category : #'*Jun-Chemistry-Babel' }
JunMoleculeMotionGeometry >> autoBondsByBabel [
	self do: [ :molecule | molecule autoBondsByBabel ]
]
