instance creation
on: aForm
	self
		cacheLock: [ ^ self cache
				detect: [ :rc | rc form == aForm ]
				ifNone: [ self basicNew
						setForm: aForm;
						initialize;
						yourself ] ]