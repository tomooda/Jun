utilities
show
	"(JunMoleculeMotionGeometry fromXYZ: (UIManager default fileOpen: 'Please select an XYZ file' extensions: #('xyz'))) autoBonds; show"

	| viewer window |
	viewer := JunSimple3dMorph new.
	viewer object: (self at: 1).
	viewer fitEyepoint.
	window := viewer openInWindowLabeled: 'molecule animation'.
	viewer color: Color black.
	[ | index |
	index := 0.
	self
		do: [ :molecule | 
			viewer object: molecule.
			viewer changed.
			window setLabel: 'molecule animation ', (index := index + 1) printString, '/', (self size printString).
			(Delay forMilliseconds: 100) wait ] ] forkAt: Processor userBackgroundPriority