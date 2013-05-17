"
A PDFDataTableWithCaptions is an abstract class for dataTable with a specific context for caption.

Instance Variables
	captions:		<Object>

captions
	- xxxxx

"
Class {
	#name : #PDFDataTableWithCaptions,
	#superclass : #PDFDataTableElement,
	#instVars : [
		'captions'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #accessing }
PDFDataTableWithCaptions >> captions [
	^ captions
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captions: anObject [
	captions := anObject
]
