"
A PDFDataTableWithColumnsCaptionElement is the specific dataTable for columns caption.

Instance Variables

"
Class {
	#name : #PDFDataTableWithColumnsCaptionElement,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Core-Elements-Composites'
}

{ #category : #render }
PDFDataTableWithColumnsCaptionElement >> cellsData [ 
	^ {self captions}, self data
]

{ #category : #render }
PDFDataTableWithColumnsCaptionElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"answer a datatable model with the captions in the columns"

	| elements |
	elements := super getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet.
	1 to: self captions size do: [ :anIndex | (elements at: anIndex) addStyle: #caption ].
	^ elements
]
