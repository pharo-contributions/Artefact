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
