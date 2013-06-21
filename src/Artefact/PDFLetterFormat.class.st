Class {
	#name : #PDFLetterFormat,
	#superclass : #PDFFormat,
	#category : #'Artefact-Formats'
}

{ #category : #defaults }
PDFLetterFormat >> defaultSize [
	^ 612 point @ 1008 point
]
