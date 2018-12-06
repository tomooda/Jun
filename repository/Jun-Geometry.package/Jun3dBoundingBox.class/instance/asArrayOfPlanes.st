converting
asArrayOfPlanes
	"| planes compound |
	planes := Jun3dBoundingBox unity asArrayOfPlanes.
	compound := JunOpenGL3dCompoundObject new.
	planes do: 
			[:plane | 
			compound 
				add: ((JunOpenGL3dPolygon vertexes: (Array 
								with: plane p1
								with: plane p2
								with: plane p3))
						paint: ColorValue red;
						yourself)].
	compound show.
	^planes"

	| originPoint cornerPoint planeClass |
	originPoint := self origin.
	cornerPoint := self corner.
	planeClass := self planeClass.
	^ (Array new: 6)
		at: 1
			put:
				(planeClass
						on: originPoint x _, originPoint y _, originPoint z
						on: originPoint x _, cornerPoint y _, originPoint z
						on: cornerPoint x _, originPoint y _, originPoint z);
		at: 2
			put:
				(planeClass
						on: originPoint x _, originPoint y _, originPoint z
						on: cornerPoint x _, originPoint y _, originPoint z
						on: originPoint x _, originPoint y _, cornerPoint z);
		at: 3
			put:
				(planeClass
						on: originPoint x _, originPoint y _, originPoint z
						on: originPoint x _, originPoint y _, cornerPoint z
						on: originPoint x _, cornerPoint y _, originPoint z);
		at: 4
			put:
				(planeClass
						on: cornerPoint x _, cornerPoint y _, cornerPoint z
						on: cornerPoint x _, originPoint y _, cornerPoint z
						on: cornerPoint x _, cornerPoint y _, originPoint z);
		at: 5
			put:
				(planeClass
						on: cornerPoint x _, cornerPoint y _, cornerPoint z
						on: cornerPoint x _, cornerPoint y _, originPoint z
						on: originPoint x _, cornerPoint y _, cornerPoint z);
		at: 6
			put:
				(planeClass
						on: cornerPoint x _, originPoint y _, cornerPoint z
						on: cornerPoint x _, cornerPoint y _, cornerPoint z
						on: originPoint x _, cornerPoint y _, cornerPoint z);
		yourself