evaluating
assert: assertBlock do: doBlock ensure: ensureBlock
	| assertValue returnValue |
	^ [ returnValue := doBlock cull: (assertValue := assertBlock value) ]
		ensure: [ ensureBlock cull: assertValue cull: returnValue ]