typical objects - chemical
compoundFromString: aString 
	"(Jun3dDisplayObject compoundFromString: '
   -1.1604   -0.6711   -0.0756 C
   -1.1621    0.6709   -0.0461 C
   -0.0019    1.3422    0.0296 C
    1.1596    0.6708    0.0756 C
    1.1615   -0.6712    0.0461 C
    0.0012   -1.3423   -0.0296 C
   -2.1144   -1.2230   -0.1378 H
   -2.1172    1.2228   -0.0839 H
   -0.0032    2.4459    0.0539 H
    2.1138    1.2225    0.1378 H
    2.1172   -1.2230    0.0840 H
    0.0024   -2.4459   -0.0539 H
	') show."

	| aCollection compoundObject |
	aCollection := OrderedCollection new.
	(aString lines collect: [:line | line substrings]) do: 
			[:anArray | 
			anArray isEmpty 
				ifFalse: 
					[| aName aCenter aRadius aColor aBall anAtom |
					aName := anArray at: 4.
					aCenter := Jun3dPoint 
								fromArray: ((anArray copyFrom: 1 to: 3) collect: [:it | it asNumber]).
					aRadius := nil.
					aColor := nil.
					aName = 'C' 
						ifTrue: 
							[aRadius := 1.7.
							aColor := Color blue mixed: 0.5 with: Color white].
					aName = 'H' 
						ifTrue: 
							[aRadius := 1.2.
							aColor := Color green mixed: 0.5 with: Color white].
					aName = 'O' 
						ifTrue: 
							[aRadius := 1.52.
							aColor := Color red mixed: 0.5 with: Color white].
					aName = 'N' 
						ifTrue: 
							[aRadius := 1.55.
							aColor := Color cyan mixed: 0.5 with: Color white].
					aName = 'P' 
						ifTrue: 
							[aRadius := 1.8.
							aColor := Color magenta mixed: 0.5 with: Color white].
					aName = 'S' 
						ifTrue: 
							[aRadius := 1.8.
							aColor := Color yellow mixed: 0.5 with: Color white].
					aName = 'Cl' 
						ifTrue: 
							[aRadius := 1.75.
							aColor := Color green darker mixed: 0.5 with: Color white].
					(aRadius isNil or: [aColor isNil]) 
						ifTrue: 
							[aRadius := 1.0.
							aColor := Color gray mixed: 0.5 with: Color white].
					aBall := JunSphereSurface center: aCenter radius: aRadius.
					anAtom := Jun3dDisplayObject 
								sphere: 10
								radius: aRadius
								center: aCenter.
					anAtom objectsDo: [:each | each color: aColor].
					anAtom name: aName.
					aCollection add: aBall -> anAtom]].
	compoundObject := Jun3dDisplayCompoundObject new.
	aCollection do: 
			[:anAssociation | 
			| ballCollection atomBody |
			ballCollection := (aCollection 
						reject: [:each | each key = anAssociation key]) collect: [:each | each key].
			atomBody := Jun3dDisplayCompoundObject new.
			atomBody name: anAssociation value name.
			anAssociation value polygonsDo: 
					[:polygon | 
					(ballCollection select: 
							[:ball | 
							| points |
							points := polygon asPointArray.
							(points select: [:point | ball containsPoint: point]) size = points size]) 
						isEmpty ifTrue: [atomBody add: polygon]].
			compoundObject add: atomBody].
	compoundObject name: 'compound'.
	^compoundObject