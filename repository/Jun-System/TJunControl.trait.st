"
A TJunControl is a trait for control structuring utilities.

"
Trait {
	#name : #TJunControl,
	#category : 'Jun-System-Framework'
}

{ #category : #evaluating }
TJunControl classSide >> assert: assertBlock do: doBlock ensure: ensureBlock [
	| assertValue returnValue |
	^ [ returnValue := doBlock cull: (assertValue := assertBlock value) ]
		ensure: [ ensureBlock cull: assertValue cull: returnValue ]
]

{ #category : #evaluating }
TJunControl classSide >> do: aBlock during: millisecondTime [ 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility do: [10 timesRepeat: [Transcript show: ' d']] during: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^[self do: aBlock forMicroseconds: millisecondTime * 1000] 
		on: MessageNotUnderstood 
		do: [:exception | exception return: (self do: aBlock forMilliseconds: millisecondTime)]
]

{ #category : #evaluating }
TJunControl classSide >> do: doBlock ensure: ensureBlock [
	^ [ doBlock value ]
		ensure: ensureBlock
]

{ #category : #evaluating }
TJunControl classSide >> do: aBlock forMicroseconds: microsecondTime [
	"
	| startTime endTime |
	startTime := Time microsecondClockValue.
	JunControlUtility do: [10 timesRepeat: [Transcript show: ' d']] forMicroseconds: 1000 * 1000.
	endTime := Time microsecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	| timeLimit |
	microsecondTime <= 0
		ifTrue: [ ^ aBlock value ].
	^ self
		assert: [ timeLimit := Time microsecondClockValue + microsecondTime ]
		do: aBlock
		ensure: [ 
			Processor yield.
			((timeLimit - Time microsecondClockValue) * 1000) nanoSeconds wait ]
]

{ #category : #evaluating }
TJunControl classSide >> do: aBlock forMilliseconds: millisecondTime [ 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility do: [10 timesRepeat: [Transcript show: ' d']] forMilliseconds: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	| timeLimit |
	millisecondTime <= 0 ifTrue: [^aBlock value].
	^self 
		assert: [timeLimit := Time millisecondClockValue + millisecondTime]
		do: aBlock
		ensure: 
			[Processor yield.
			(timeLimit - Time millisecondClockValue) milliSeconds wait]
]

{ #category : #evaluating }
TJunControl classSide >> do: aBlock forNanoseconds: microsecondTime [ 
	"
	| startTime endTime |
	startTime := Time microsecondClockValue.
	JunControlUtility do: [10 timesRepeat: [Transcript show: ' d']] forMicroseconds: 1000 * 1000.
	endTime := Time microsecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	| timeLimit |
	microsecondTime <= 0 ifTrue: [^aBlock value].
	^self 
		assert: [timeLimit := Time microsecondClockValue + microsecondTime]
		do: aBlock
		ensure: 
			[Processor yield.
			(timeLimit - Time microsecondClockValue) * 1000.0 nanoSeconds wait]
]

{ #category : #evaluating }
TJunControl classSide >> do: aBlock framesPerSecond: aNumber [
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	10 timesRepeat: [JunControlUtility do: [] framesPerSecond: 10].
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	aNumber <= 0
		ifTrue: [ ^ aBlock value ].
	^ self do: aBlock forMilliseconds: (1000 / (0.001 max: (aNumber min: 1000))) rounded
]

{ #category : #evaluating }
TJunControl classSide >> fork: aBlock during: millisecondTime [
	"JunControlUtility fork: [[true] whileTrue: [Transcript show: ' f']] during: 1000."

	^ [ self fork: aBlock forMicroseconds: millisecondTime * 1000 ]
		on: MessageNotUnderstood 
		do: [ :exception | exception return: (self fork: aBlock forMilliseconds: millisecondTime) ]
]

{ #category : #evaluating }
TJunControl classSide >> fork: aBlock forMicroseconds: microsecondTime [ 
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
]

{ #category : #evaluating }
TJunControl classSide >> fork: aBlock forMilliseconds: millisecondTime [
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
]

{ #category : #holding }
TJunControl classSide >> holdFor: millisecondTime [ 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility holdFor: 10000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self holdForMilliseconds: millisecondTime
]

{ #category : #holding }
TJunControl classSide >> holdFor: millisecondTime do: aBlock [ 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility holdFor: 10000 do: [Transcript cr; show: 'd '].
	endTime := Time millisecondClockValue.
	Transcript show: (endTime - startTime) printString.
	"

	^self holdForMilliseconds: millisecondTime do: aBlock
]

{ #category : #holding }
TJunControl classSide >> holdFor: millisecondTime untilDo: aBlock [ 
	"
	[JunControlUtility
		holdFor: 10000 
		untilDo: [Transcript show: 'u '. ActiveHand anyButtonPressed]] forkAt: Processor lowestPriority."

	| timeLimit |
	timeLimit := Time millisecondClockValue + millisecondTime.
	[Time millisecondClockValue < timeLimit] whileTrue: 
			[aBlock value = true ifTrue: [^true].
			Processor yield].
	^false
]

{ #category : #holding }
TJunControl classSide >> holdFor: millisecondTime whileDo: aBlock [ 
	"[JunControlUtility
		holdFor: 10000 
		whileDo: [Transcript show: 'w '. ActiveHand noButtonPressed]] forkAt: Processor lowestPriority."

	^self holdFor: millisecondTime untilDo: [aBlock value ~= true]
]

{ #category : #holding }
TJunControl classSide >> holdForMicroseconds: millisecondTime [ 
	"
	| startTime endTime |
	startTime := Time microsecondClock.
	JunControlUtility holdForMicroseconds: 10000 * 1000.
	endTime := Time microsecondClock.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self holdForMicroseconds: millisecondTime untilDo: [false]
]

{ #category : #holding }
TJunControl classSide >> holdForMicroseconds: microsecondTime do: aBlock [ 
	"
	| startTime endTime |
	startTime := Time microsecondClock.
	JunControlUtility holdForMicroseconds: 10000 * 1000 do: [Transcript cr; show: 'd '].
	endTime := Time microsecondClock.
	Transcript show: (endTime - startTime) printString.
	"

	| timeLimit resultValue |
	timeLimit := Time microsecondClockValue + microsecondTime.
	resultValue := aBlock value.
	[Time microsecondClockValue < timeLimit] whileTrue: [Processor yield].
	^resultValue
]

{ #category : #holding }
TJunControl classSide >> holdForMicroseconds: microsecondTime untilDo: aBlock [ 
	"[
		JunControlUtility
			holdForMicroseconds: 10000 * 1000 
			untilDo: [Transcript show: 'u '. Sensor anyButtonPressed]
	] forkAt: Processor lowestPriority."

	| timeLimit |
	timeLimit := Time microsecondClockValue + microsecondTime.
	[Time microsecondClockValue < timeLimit] whileTrue: 
			[aBlock value = true ifTrue: [^true].
			Processor yield].
	^false
]

{ #category : #holding }
TJunControl classSide >> holdForMicroseconds: millisecondTime whileDo: aBlock [ 
	"[
		JunControlUtility
			holdForMicroseconds: 10000 * 1000
			whileDo: [Transcript show: 'w '. Sensor noButtonPressed]
	] forkAt: Processor lowestPriority."

	^self holdForMicroseconds: millisecondTime untilDo: [aBlock value ~= true]
]

{ #category : #holding }
TJunControl classSide >> holdForMilliseconds: millisecondTime [ 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility holdForMilliseconds: 10000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self holdForMilliseconds: millisecondTime untilDo: [false]
]

{ #category : #holding }
TJunControl classSide >> holdForMilliseconds: millisecondTime do: aBlock [ 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility holdForMilliseconds: 10000 do: [Transcript cr; show: 'd '].
	endTime := Time millisecondClockValue.
	Transcript show: (endTime - startTime) printString.
	"

	| timeLimit resultValue |
	timeLimit := Time millisecondClockValue + millisecondTime.
	resultValue := aBlock value.
	[Time millisecondClockValue < timeLimit] whileTrue: [Processor yield].
	^resultValue
]

{ #category : #holding }
TJunControl classSide >> holdForMilliseconds: millisecondTime untilDo: aBlock [ 
	"[
		JunControlUtility
			holdForMilliseconds: 10000 
			untilDo: [Transcript show: 'u '. Sensor anyButtonPressed]
	] forkAt: Processor lowestPriority."

	| timeLimit |
	timeLimit := Time millisecondClockValue + millisecondTime.
	[Time millisecondClockValue < timeLimit] whileTrue: 
			[aBlock value = true ifTrue: [^true].
			Processor yield].
	^false
]

{ #category : #holding }
TJunControl classSide >> holdForMilliseconds: millisecondTime whileDo: aBlock [ 
	"[
		JunControlUtility
			holdForMilliseconds: 10000 
			whileDo: [Transcript show: 'w '. Sensor noButtonPressed]
	] forkAt: Processor lowestPriority."

	^self holdForMilliseconds: millisecondTime untilDo: [aBlock value ~= true]
]

{ #category : #'clock inquiries' }
TJunControl classSide >> nextMillisecondClockValue [
	"JunControlUtility nextMillisecondClockValue."

	^self nextMillisecondClockValue: 1
]

{ #category : #'clock inquiries' }
TJunControl classSide >> nextMillisecondClockValue: tickTime [
	"JunControlUtility nextMillisecondClockValue: 100."

	| currentTime nextTime |
	currentTime := Time millisecondClockValue.
	nextTime := currentTime + tickTime.
	nextTime := nextTime truncateTo: tickTime.
	(nextTime - currentTime) milliSeconds wait.
	^ nextTime
]

{ #category : #evaluating }
TJunControl classSide >> punctuallyDo: aBlock during: millisecondTime [
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility punctuallyDo: [[true] whileTrue: [Transcript show: ' p']] during: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^ [ self punctuallyDo: aBlock forMicroseconds: millisecondTime * 1000 ]
		on: MessageNotUnderstood 
		do: [ :exception | exception return: (self punctuallyDo: aBlock forMilliseconds: millisecondTime) ]
]

{ #category : #evaluating }
TJunControl classSide >> punctuallyDo: aBlock forMicroseconds: microsecondTime [ 
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
]

{ #category : #evaluating }
TJunControl classSide >> punctuallyDo: aBlock forMilliseconds: millisecondTime [
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
]

{ #category : #waiting }
TJunControl classSide >> waitDuring: millisecondTime [ 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility waitDuring: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self do: [] during: millisecondTime
]

{ #category : #waiting }
TJunControl classSide >> waitForMicroseconds: microsecondTime [ 
	"
	| startTime endTime |
	startTime := Time microsecondClock.
	JunControlUtility waitForMicroseconds: 1000 * 1000.
	endTime := Time microsecondClock.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self do: [] forMicroseconds: microsecondTime
]

{ #category : #waiting }
TJunControl classSide >> waitForMilliseconds: millisecondTime [ 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility waitForMilliseconds: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self do: [] forMilliseconds: millisecondTime
]

{ #category : #evaluating }
TJunControl >> assert: assertBlock do: doBlock ensure: ensureBlock [
	^ self class assert: assertBlock do: doBlock ensure: ensureBlock
]

{ #category : #evaluating }
TJunControl >> do: aBlock during: millisecondTime [
	^ self class do: aBlock during: millisecondTime
]

{ #category : #evaluating }
TJunControl >> do: doBlock ensure: ensureBlock [
	^ self class do: doBlock ensure: ensureBlock
]

{ #category : #evaluating }
TJunControl >> do: aBlock forMicroseconds: microsecondTime [
	^ self class do: aBlock forMicroseconds: microsecondTime
]

{ #category : #evaluating }
TJunControl >> do: aBlock forMilliseconds: millisecondTime [
	^ self class do: aBlock forMilliseconds: millisecondTime
]

{ #category : #evaluating }
TJunControl >> do: aBlock framesPerSecond: aNumber [
	^ self class do: aBlock framesPerSecond: aNumber
]

{ #category : #evaluating }
TJunControl >> fork: aBlock during: millisecondTime [
	^ self class fork: aBlock during: millisecondTime
]

{ #category : #evaluating }
TJunControl >> fork: aBlock forMicroseconds: microsecondTime [
	^ self class fork: aBlock forMicroseconds: microsecondTime
]

{ #category : #evaluating }
TJunControl >> fork: aBlock forMilliseconds: millisecondTime [
	^ self class fork: aBlock forMilliseconds: millisecondTime
]

{ #category : #evaluating }
TJunControl >> punctuallyDo: aBlock during: millisecondTime [
	^ self class punctuallyDo: aBlock during: millisecondTime
]

{ #category : #evaluating }
TJunControl >> punctuallyDo: aBlock forMicroseconds: microsecondTime [
	^ self class punctuallyDo: aBlock forMicroseconds: microsecondTime
]

{ #category : #evaluating }
TJunControl >> punctuallyDo: aBlock forMilliseconds: millisecondTime [
	^ self class punctuallyDo: aBlock forMilliseconds: millisecondTime
]
