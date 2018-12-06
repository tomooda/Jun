Class {
	#name : #JunCarbon,
	#superclass : #JunAtom,
	#category : 'Jun-Chemistry-Atoms'
}

{ #category : #accessing }
JunCarbon class >> bondRadius1 [
	^ 0.75
]

{ #category : #accessing }
JunCarbon class >> bondRadius2 [
	^ 0.67
]

{ #category : #accessing }
JunCarbon class >> bondRadius3 [
	^ 0.60
]

{ #category : #accessing }
JunCarbon class >> color [
	^ Color fromHexString: '909090'
]

{ #category : #accessing }
JunCarbon class >> covalentRadius [
	^ 0.76
]

{ #category : #accessing }
JunCarbon class >> group [
	^ 14
]

{ #category : #accessing }
JunCarbon class >> mass [
	^ 12.011
]

{ #category : #accessing }
JunCarbon class >> number [
	^ 6
]

{ #category : #accessing }
JunCarbon class >> period [
	^ 2
]

{ #category : #accessing }
JunCarbon class >> symbol [
	^ 'C'
]

{ #category : #accessing }
JunCarbon class >> vanDerWaalsRadius [
	^ 1.70
]
