accessing
name
	^ name ifNil: [ self identityHash printString ]