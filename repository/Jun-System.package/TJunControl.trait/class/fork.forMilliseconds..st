evaluating
fork: aBlock forMilliseconds: millisecondTime
	"JunControlUtility fork: [[true] whileTrue: [Transcript show: ' f']] forMilliseconds: 1000."

	| currentProcess priorityValue timeLimit childProcess killProcess |
	millisecondTime <= 0
		ifTrue: [ ^ aBlock fork ].
	currentProcess := Processor activeProcess.
	priorityValue := currentProcess priority.
	timeLimit := Time millisecondClockValue + millisecondTime.
	childProcess := [ aBlock value ] newProcess.
	childProcess priority: priorityValue.
	killProcess := [ 
	self
		assert: [ childProcess resume ]
		do: [ 
			Processor yield.
			(timeLimit - Time millisecondClockValue) milliSeconds wait.
			childProcess terminate ]
		ensure: [ childProcess := nil ] ] newProcess.
	killProcess priority: priorityValue + 1.
	^ killProcess resume