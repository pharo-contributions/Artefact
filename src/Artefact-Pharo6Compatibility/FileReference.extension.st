Extension { #name : #FileReference }

{ #category : #'*Artefact-Pharo6Compatibility' }
FileReference >> binaryWriteStream [

	^ (filesystem writeStreamOn: self path)
		  binary;
		  yourself
]
