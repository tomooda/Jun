Class {
	#name : #JunOxygen,
	#superclass : #JunAtom,
	#category : 'Jun-Chemistry-Atoms'
}

{ #category : #accessing }
JunOxygen class >> bondRadius1 [
	^ 0.63
]

{ #category : #accessing }
JunOxygen class >> bondRadius2 [
	^ 0.57
]

{ #category : #accessing }
JunOxygen class >> bondRadius3 [
	^ 0.53
]

{ #category : #accessing }
JunOxygen class >> color [
	^ Color fromHexString: 'FF0D0D'
]

{ #category : #accessing }
JunOxygen class >> covalentRadius [
	^ 0.66
]

{ #category : #accessing }
JunOxygen class >> group [
	^ 16
]

{ #category : #accessing }
JunOxygen class >> mass [
	^ 15.999
]

{ #category : #accessing }
JunOxygen class >> number [
	^ 8
]

{ #category : #accessing }
JunOxygen class >> period [
	^ 2
]

{ #category : #accessing }
JunOxygen class >> symbol [
	^ 'O'
]

{ #category : #accessing }
JunOxygen class >> vanDerWaalsRadius [
	^ 1.52
]
