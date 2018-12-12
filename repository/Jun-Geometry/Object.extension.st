Extension { #name : #Object }

{ #category : #'*Jun-Geometry' }
Object >> , aNumber [
	self deprecated: '"," is used by GToolkit. use ",," instead.'.
	^ Jun2dPoint x: self y: aNumber
]
