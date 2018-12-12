"
A Jun3dBoundingBox is a 3D region in form of cuboid.

"
Class {
	#name : #Jun3dBoundingBox,
	#superclass : #JunBoundingBox,
	#category : 'Jun-Geometry-Basic'
}

{ #category : #accessing }
Jun3dBoundingBox >> area [
	^ (self width * self height + (self height * self depth) + (self depth * self width)) * 2
]

{ #category : #converting }
Jun3dBoundingBox >> asArrayOfPlanes [
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
				on: originPoint x ,, originPoint y ,, originPoint z
				on: originPoint x ,, cornerPoint y ,, originPoint z
				on: cornerPoint x ,, originPoint y ,, originPoint z);
		at: 2
			put:
			(planeClass
				on: originPoint x ,, originPoint y ,, originPoint z
				on: cornerPoint x ,, originPoint y ,, originPoint z
				on: originPoint x ,, originPoint y ,, cornerPoint z);
		at: 3
			put:
			(planeClass
				on: originPoint x ,, originPoint y ,, originPoint z
				on: originPoint x ,, originPoint y ,, cornerPoint z
				on: originPoint x ,, cornerPoint y ,, originPoint z);
		at: 4
			put:
			(planeClass
				on: cornerPoint x ,, cornerPoint y ,, cornerPoint z
				on: cornerPoint x ,, originPoint y ,, cornerPoint z
				on: cornerPoint x ,, cornerPoint y ,, originPoint z);
		at: 5
			put:
			(planeClass
				on: cornerPoint x ,, cornerPoint y ,, cornerPoint z
				on: cornerPoint x ,, cornerPoint y ,, originPoint z
				on: originPoint x ,, cornerPoint y ,, cornerPoint z);
		at: 6
			put:
			(planeClass
				on: cornerPoint x ,, originPoint y ,, cornerPoint z
				on: cornerPoint x ,, cornerPoint y ,, cornerPoint z
				on: originPoint x ,, cornerPoint y ,, cornerPoint z);
		yourself
]

{ #category : #converting }
Jun3dBoundingBox >> asJunOpenGL3dObject [
	"((1 , 1 , 1) extent: (1 , 1 , 1)) asJunOpenGL3dObject showWithAxes."

	^ self notYetImplemented	"| compoundObject |
	compoundObject := JunOpenGL3dObject origin: self origin corner: self corner.
	compoundObject 
		objectsDo: [:each | each paint: self defaultColor alpha: self defaultAlpha].
	^compoundObject"
]

{ #category : #converting }
Jun3dBoundingBox >> asPointArray [
	^ (Array new: 8)
		at: 1 put: self origin;
		at: 2 put: self corner x ,, self origin y ,, self origin z;
		at: 3 put: self corner x ,, self corner y ,, self origin z;
		at: 4 put: self origin x ,, self corner y ,, self origin z;
		at: 5 put: self corner;
		at: 6 put: self corner x ,, self origin y ,, self corner z;
		at: 7 put: self origin x ,, self origin y ,, self corner z;
		at: 8 put: self origin x ,, self corner y ,, self corner z;
		yourself
]

{ #category : #accessing }
Jun3dBoundingBox >> depth [
	^ corner z - origin z
]

{ #category : #testing }
Jun3dBoundingBox >> is3d [
	^ true
]

{ #category : #accessing }
Jun3dBoundingBox >> volume [
	^ self width * self height * self depth
]
