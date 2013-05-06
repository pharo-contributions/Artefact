Class {
	#name : #PDFDataTableWithColumnsCaptionElement,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #'as yet unclassified' }
PDFDataTableWithColumnsCaptionElement >> cellsData [ 
	^ {self captions}, self data
]

{ #category : #render }
PDFDataTableWithColumnsCaptionElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"answer a datatable model with the captions in the columns"

	| elements |
	elements := super getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet.
	1 to: captions size do: [ :anIndex | (elements at: anIndex) style: #caption ].
	^ elements
]
