Class {
	#name : #PDFDataTableWithRowsCaptionElement,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #'as yet unclassified' }
PDFDataTableWithRowsCaptionElement >> cellsData [ 
	| current |
	current := 0.
	^ self data collect: [ :aLine | current := current + 1. {captions at: current}, aLine ]
]

{ #category : #render }
PDFDataTableWithRowsCaptionElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"answer a datatable model with the captions in the rows"

	| elements |
	elements := super getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet.
	1 to: elements size by: self data first size + 1 do: [ :anIndex | (elements at: anIndex) style: #caption ].
	^ elements
]
