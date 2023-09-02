Extension { #name : #FileLocator }

{ #category : #'*Artefact-Pharo60-Compatibility' }
FileLocator >> binaryWriteStream [
	"Answer a binary write stream on the receiver"

	^ self resolve binaryWriteStream
]
