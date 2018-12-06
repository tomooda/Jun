typical objects - chemical
benzene
	"(Jun3dDisplayObject benzene) show."

	| compoundObject |
	compoundObject := Jun3dDisplayCompoundObject
		compoundFromString:
			'
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
	'.
	compoundObject name: 'benzene'.
	^ compoundObject