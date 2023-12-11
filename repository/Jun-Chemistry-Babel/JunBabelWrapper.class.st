Class {
	#name : #JunBabelWrapper,
	#superclass : #Object,
	#category : #'Jun-Chemistry-Babel'
}

{ #category : #accessing }
JunBabelWrapper class >> babelProgramName [
	^ 'obabel'
]

{ #category : #utilities }
JunBabelWrapper class >> bondsFromMol: aString do: aBlock [
	| mol |
	mol := aString readStream.
	mol
		nextLine;
		nextLine;
		nextLine.
	mol nextLine trim substrings
		in: [ :params | 
			params first asNumber timesRepeat: [ mol nextLine ].
			params second asNumber
				timesRepeat: [ 
					| bond |
					bond := mol nextLine substrings.
					aBlock cull: bond first asNumber cull: bond second asNumber cull: bond third asNumber ] ]
]

{ #category : #utilities }
JunBabelWrapper class >> bondsFromXYZ: aString do: aBlock [
	| mol |
	mol := (self convert: aString from: 'xyz' to: 'mol') readStream.
	mol
		nextLine;
		nextLine;
		nextLine.
	mol nextLine trim substrings
		in: [ :params | 
			params first asNumber timesRepeat: [ mol nextLine ].
			params second asNumber
				timesRepeat: [ 
					| bond |
					bond := mol nextLine substrings.
					aBlock cull: bond first asNumber cull: bond second asNumber cull: bond third asNumber ] ]
]

{ #category : #utilities }
JunBabelWrapper class >> convert: aString from: format1 to: format2 [
	^ self
		exec: self babelProgramName
		args:
			{'-i'.
			format1.
			'-o'.
			format2}
		stdin: aString
]

{ #category : #utilities }
JunBabelWrapper class >> exec: aPathString args: anArrayOfString stdin: aDataString [

	| process output |
	process := OSSUnixSubprocess new
		           command: aPathString;
		           arguments: anArrayOfString;
		           redirectStdin;
		           redirectStdout;
		           run.
	process stdinStream
		nextPutAll: aDataString;
		flush;
		closeWriter.
	process waitForExit.
	output := process stdoutStream upToEnd.
	process closeAndCleanStreams.
	^ output
]
