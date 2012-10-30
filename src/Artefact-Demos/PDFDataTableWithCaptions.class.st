Class {
	#name : #PDFDataTableWithCaptions,
	#superclass : #PDFDataTable,
	#instVars : [
		'captions'
	],
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFDataTableWithCaptions >> captions [
	^ captions
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captions: anObject [
	captions := anObject
]
