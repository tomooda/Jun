evaluating
punctuallyDo: aBlock forMicroseconds: microsecondTime 
	"
	| startTime endTime |
	startTime := Time microsecondClock.
	JunControlUtility punctuallyDo: [[true] whileTrue: [Transcript show: ' p']] forMicroseconds: 1000 * 1000.
	endTime := Time microsecondClock.
	Transcript cr; show: (endTime - startTime) printString.
	"

	| currentProcess priorityValue returnValue timeLimit childProcess |
	microsecondTime <= 0 ifTrue: [^aBlock value].
	currentProcess := Processor activeProcess.
	priorityValue := currentProcess priority.
	returnValue := nil.
	timeLimit := Time microsecondClockValue + microsecondTime.
	childProcess := [returnValue := aBlock value] newProcess.
	childProcess priority: priorityValue.
	self 
		assert: 
			[currentProcess priority: priorityValue + 1.
			childProcess resume]
		do: 
			[Processor yield.
			(timeLimit - Time microsecondClockValue) * 1000 nanoSeconds wait.
			childProcess terminate]
		ensure: 
			[childProcess := nil.
			currentProcess priority: priorityValue].
	^returnValue