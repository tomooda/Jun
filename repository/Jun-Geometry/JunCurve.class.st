"
JunCurve is an abstract class for geometric objects that represent curves.
"
Class {
	#name : #JunCurve,
	#superclass : #JunGeometry,
	#category : 'Jun-Geometry-Abstract'
}

{ #category : #converting }
JunCurve >> asNurbsCurve [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunCurve >> atT: aNumber [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunCurve >> center [
	^ self atT: 0.5
]

{ #category : #accessing }
JunCurve >> first [
	^ self from
]

{ #category : #accessing }
JunCurve >> from [
	^ self atT: 0.0
]

{ #category : #testing }
JunCurve >> isCurve [
	^ true
]

{ #category : #accessing }
JunCurve >> last [
	^ self to
]

{ #category : #accessing }
JunCurve >> middle [
	^ self center
]

{ #category : #accessing }
JunCurve >> second [
	^ self to
]

{ #category : #accessing }
JunCurve >> to [
	^ self atT: 1.0
]

{ #category : #testing }
JunCurve >> whichSideOf: bisector [
	^ self subclassResponsibility
]
