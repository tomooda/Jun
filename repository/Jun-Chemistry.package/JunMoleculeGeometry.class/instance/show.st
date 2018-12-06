utilities
show
	"(JunMoleculeGeometry fromXYZ: (UIManager default fileOpen: 'Please select an XYZ file' extensions: #('xyz'))) autoBonds; show"

	JunSimple3dMorph show: self label: 'molecule viewer' color: Color black