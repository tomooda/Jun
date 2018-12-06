cache
cacheLock: aBlock
	(CacheLock ifNil: [ CacheLock := Semaphore forMutualExclusion ]) critical: aBlock