instance creation
on: aMorph origin: aPoint arg: aJunAtom
	| menuMorph |
	menuMorph := self new.
	menuMorph origin: aPoint.
	menuMorph arg: aJunAtom.
	menuMorph bounds: aMorph bounds.
	aMorph addMorph: menuMorph.
	^ menuMorph