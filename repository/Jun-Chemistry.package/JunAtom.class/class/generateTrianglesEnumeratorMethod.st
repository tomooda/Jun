private
generateTrianglesEnumeratorMethod
	| triangles |
	triangles := OrderedCollection new.
	triangles
		add:
			{(1 _, 0 _, 0).
			(0 _, 1 _, 0).
			(0 _, 0 _, 1)}.
	triangles
		add:
			{(0 _, 1 _, 0).
			(-1 _, 0 _, 0).
			(0 _, 0 _, 1)}.
	triangles
		add:
			{(-1 _, 0 _, 0).
			(0 _, -1 _, 0).
			(0 _, 0 _, 1)}.
	triangles
		add:
			{(0 _, -1 _, 0).
			(1 _, 0 _, 0).
			(0 _, 0 _, 1)}.
	triangles
		add:
			{(1 _, 0 _, 0).
			(0 _, 0 _, -1).
			(0 _, 1 _, 0)}.
	triangles
		add:
			{(0 _, 1 _, 0).
			(0 _, 0 _, -1).
			(-1 _, 0 _, 0)}.
	triangles
		add:
			{(-1 _, 0 _, 0).
			(0 _, 0 _, -1).
			(0 _, -1 _, 0)}.
	triangles
		add:
			{(0 _, -1 _, 0).
			(0 _, 0 _, -1).
			(1 _, 0 _, 0)}.
	3
		timesRepeat: [ 
			triangles := Array
				new: triangles size * 4
				streamContents: [ :stream | 
					triangles
						do: [ :tri | 
							| p1 p2 p3 v12 v23 v31 |
							p1 := tri first.
							p2 := tri second.
							p3 := tri third.
							v12 := (p1 + p2) unitVector.
							v23 := (p2 + p3) unitVector.
							v31 := (p3 + p1) unitVector.
							stream
								nextPut:
									{p1.
									v12.
									v31}.
							stream
								nextPut:
									{p2.
									v23.
									v12}.
							stream
								nextPut:
									{p3.
									v31.
									v23}.
							stream
								nextPut:
									{v12.
									v23.
									v31} ] ] ].
	JunAtom
		compile:
			(String
				new: 1024
				streamContents: [ :stream | 
					stream nextPutAll: 'triangles' , triangles size printString , 'Do: aBlock'.
					stream cr.
					triangles
						do: [ :tri | 
							stream
								cr;
								nextPutAll:
										'aBlock value: ' , tri first printString , ' value: ' , tri second printString , ' value: ' , tri third printString
												, '.' ] ])