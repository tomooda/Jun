typical objects - cubes
unitCube
	"Jun3dDisplayObject unitCube show"
	| faces |
	faces := OrderedCollection new: 6.
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 0 _, 0 _, 1
						with: 1 _, 0 _, 1
						with: 1 _, 1 _, 1
						with: 0 _, 1 _, 1)).
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 0 _, 1 _, 0
						with: 1 _, 1 _, 0
						with: 1 _, 0 _, 0
						with: 0 _, 0 _, 0)).
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 1 _, 0 _, 0
						with: 1 _, 1 _, 0
						with: 1 _, 1 _, 1
						with: 1 _, 0 _, 1)).
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 0 _, 0 _, 1
						with: 0 _, 1 _, 1
						with: 0 _, 1 _, 0
						with: 0 _, 0 _, 0)).
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 0 _, 1 _, 1
						with: 1 _, 1 _, 1
						with: 1 _, 1 _, 0
						with: 0 _, 1 _, 0)).
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 0 _, 0 _, 0
						with: 1 _, 0 _, 0
						with: 1 _, 0 _, 1
						with: 0 _, 0 _, 1)).
	^ Jun3dDisplayCompoundObject components: faces