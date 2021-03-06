accessing
zip
	"Get the zip based on the commitID."

	| c |
	zip isNil
		ifTrue: [ 
			zip := ZipArchive new.
			c := PipeableOSProcess
				command: 'cd ' , stream pathString , '; git archive --format=zip ' , commitID , ' ' , packageDirectory.
			zip readFrom: (ReadStream on: c output asByteArray).
			c succeeded
				ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ] ].
	^ zip