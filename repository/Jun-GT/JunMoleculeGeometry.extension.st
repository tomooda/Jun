Extension { #name : #JunMoleculeGeometry }

{ #category : #'*Jun-GT' }
JunMoleculeGeometry >> gtInspectorJun3dDisplayObjectIn: composite [
	<gtInspectorPresentationOrder: 91>
	^ composite morph
		title: 'Jun';
		display: [ self asMorph ]
]
