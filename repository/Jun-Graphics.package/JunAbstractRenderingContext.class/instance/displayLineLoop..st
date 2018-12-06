displaying
displayLineLoop: aCollectionOfJun3dPoint
	aCollectionOfJun3dPoint ifNotEmpty: [ self displayLines: (aCollectionOfJun3dPoint copyWith: aCollectionOfJun3dPoint) ]