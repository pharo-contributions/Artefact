"
The letter format
"
Class {
	#name : #PDFLetterFormat,
	#superclass : #PDFFormat,
	#category : #'Artefact-Core-Formats'
}

{ #category : #'accessing - defaults' }
PDFLetterFormat >> defaultSize [

	^ 612 point @ 1008 point
]
