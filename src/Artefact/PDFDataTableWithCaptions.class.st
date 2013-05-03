"
A PDFDataTableWithCaptions is a datatable where the user defines captions on the first row or on the first column.
"
Class {
	#name : #PDFDataTableWithCaptions,
	#superclass : #PDFDataTableOld,
	#instVars : [
		'captions'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #action }
PDFDataTableWithCaptions >> buildCaption: aString styleSheet: aStyleSheet [
	"answer a PDFCellStyle instance for a caption datatable cell"

	^ PDFCellElement new 
		wh: self wh; 
		text: aString;
		margin: self margin;
		style: #caption.
		
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captions [
	^ captions
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captions: anObject [
	captions := anObject
]
