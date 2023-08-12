Extension { #name : #AbstractFileReference }

{ #category : #'*Artefact-Pharo6Compatibility' }
AbstractFileReference >> binaryWriteStream [
	"Answer a binary write stream on the receiver"

	^ self subclassResponsibility
]

{ #category : #'*Artefact-Pharo6Compatibility' }
AbstractFileReference >> binaryWriteStreamDo: aBlock [
	"Pass a binary write stream on the receiver to the supplied block, and ensure that the stream is closed after evaluation."

	| stream |

	stream := self binaryWriteStream.
	^ [ aBlock value: stream ]
		ensure: [ stream close ]
]

{ #category : #'*Artefact-Pharo6Compatibility' }
AbstractFileReference >> binaryWriteStreamDo: doBlock ifPresent: presentBlock [
	^ self isFile
		ifTrue: [ presentBlock value ]
		ifFalse: [ self binaryWriteStreamDo: doBlock ]
]
