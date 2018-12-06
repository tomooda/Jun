Extension { #name : #JunMoleculeGeometry }

{ #category : #'*Jun-Bloc' }
JunMoleculeGeometry >> asElement [
	^ Jun3dDisplayBlocElement on: self
]

{ #category : #'*Jun-Bloc' }
JunMoleculeGeometry classSide >> exampleT3Bloc [
	<gtExample>
	^ self exampleT3 asElement
]
