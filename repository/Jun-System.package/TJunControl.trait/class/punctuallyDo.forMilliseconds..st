evaluating
punctuallyDo: aBlock forMilliseconds: millisecondTime
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility punctuallyDo: [[true] whileTrue: [Transcript show: ' p']] forMilliseconds: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	| currentProcess priorityValue returnValue timeLimit childProcess |
	millisecondTime <= 0
		ifTrue: [ ^ aBlock value ].
	currentProcess := Processor activeProcess.
	priorityValue := currentProcess priority.
	returnValue := nil.
	timeLimit := Time millisecondClockValue + millisecondTime.
	childProcess := [ returnValue := aBlock value ] newProcess.
	childProcess priority: priorityValue.
	self
		assert: [ 
			currentProcess priority: priorityValue + 1.
			childProcess resume ]
		do: [ 
			Processor yield.
			(timeLimit - Time millisecondClockValue) milliSeconds wait.
			childProcess terminate ]
		ensure: [ 
			childProcess := nil.
			currentProcess priority: priorityValue ].
	^ returnValue