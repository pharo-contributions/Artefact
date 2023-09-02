Extension { #name : #FileLocator }

{ #category : #'*Artefact-Pharo6Compatibility' }
FileLocator >> binaryWriteStream [
	"Answer a binary write stream on the receiver"

	^ self resolve binaryWriteStream
]
