"
A PDFDummyLayout is a dummy layout used for PDFLayoutTest.

Instance Variables

"
Class {
	#name : #PDFDummyLayout,
	#superclass : #PDFLayout,
	#category : #'Artefact-Elements-Test'
}

{ #category : #'as yet unclassified' }
PDFDummyLayout >> defineElementDimension: anElement with: aPDFGenerator styleSheet: aStyleSheet [
	anElement dimension: 10pt @ 10pt
]

{ #category : #'as yet unclassified' }
PDFDummyLayout >> defineElementPosition: anElement with: aPDFGenerator styleSheet: aStyleSheet [
	anElement from: 10pt @ 10pt
]
