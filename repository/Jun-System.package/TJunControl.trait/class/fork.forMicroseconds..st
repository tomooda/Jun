evaluating
fork: aBlock forMicroseconds: microsecondTime 
	"JunControlUtility fork: [[true] whileTrue: [Transcript show: ' f']] forMicroseconds: 1000 * 1000."

	| currentProcess priorityValue timeLimit childProcess killProcess |
	microsecondTime <= 0 ifTrue: [^aBlock fork].
	currentProcess := Processor activeProcess.
	priorityValue := currentProcess priority.
	timeLimit := Time microsecondClockValue + microsecondTime.
	childProcess := [aBlock value] newProcess.
	childProcess priority: priorityValue.
	killProcess := 
			[self 
				assert: [childProcess resume]
				do: 
					[Processor yield.
					(timeLimit - Time microsecondClockValue) * 1000 nanoSeconds wait.
					childProcess terminate]
				ensure: [childProcess := nil]] 
					newProcess.
	killProcess priority: priorityValue + 1.
	^killProcess resume