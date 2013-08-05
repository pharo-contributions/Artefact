Extension { #name : #PDFPage }

{ #category : #'*Artefact-Nautilus' }
PDFPage classSide >> nautilusIcon [

	^ [Smalltalk ui icons iconNamed: #pdfIcon] on: MessageNotUnderstood do: [ nil ]
]
