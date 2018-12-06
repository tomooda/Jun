examples
exampleMethane
	<script: 'JunMoleculeGeometry exampleMethane inspect'>
	<gtExample>
	^ (self
		fromXYZ:
		'5
methane molecule (in ångströms) from https://en.wikipedia.org/wiki/XYZ_file_format
C        0.000000        0.000000        0.000000
H        0.000000        0.000000        1.089000
H        1.026719        0.000000       -0.363000
H       -0.513360       -0.889165       -0.363000
H       -0.513360        0.889165       -0.363000')
		autoBonds;
		yourself