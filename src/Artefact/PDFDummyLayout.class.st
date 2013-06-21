"
A PDFDummyLayout is a dummy layout used for PDFLayoutTest.

Instance Variables

"
Class {
	#name : #PDFDummyLayout,
	#superclass : #PDFLayout,
	#category : #'Artefact-Elements-Test'
}

{ #category : #layouting }
PDFDummyLayout >> defineElementDimension: anElement with: aPDFGenerator styleSheet: aStyleSheet [
	anElement dimension: 10pt @ 10pt
]

{ #category : #layouting }
PDFDummyLayout >> defineElementPosition: anElement with: aPDFGenerator styleSheet: aStyleSheet [
	anElement from: 10pt @ 10pt
]
