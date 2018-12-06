Extension { #name : #JunMoleculeGeometry }

{ #category : #'*Jun-Chemistry-Babel' }
JunMoleculeGeometry >> autoBondsByBabel [
	| b |
	b := OrderedCollection new.
	JunBabelWrapper
		bondsFromXYZ: self asXYZString
		do: [ :i1 :i2 :order | 
			b
				add:
					((JunBond between: (atoms at: i1) and: (atoms at: i2))
						order: order;
						yourself) ].
	bonds := b
]
