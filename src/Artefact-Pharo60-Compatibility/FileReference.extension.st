Extension { #name : #FileReference }

{ #category : #'*Artefact-Pharo60-Compatibility' }
FileReference >> binaryWriteStream [

	^ (filesystem writeStreamOn: self path)
		  binary;
		  yourself
]
