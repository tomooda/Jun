instance creation
center: aJun3dPoint radius: aNumber
	| sphere |
	sphere := self new.
	sphere center: aJun3dPoint.
	sphere radius: aNumber.
	^ sphere