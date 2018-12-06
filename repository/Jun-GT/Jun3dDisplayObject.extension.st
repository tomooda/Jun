Extension { #name : #Jun3dDisplayObject }

{ #category : #'*Jun-GT' }
Jun3dDisplayObject >> gtInspectorJun3dDisplayObjectIn: composite [
	<gtInspectorPresentationOrder: 91>
	^ composite morph
		title: 'Jun';
		display: [ self asMorph ]
]
