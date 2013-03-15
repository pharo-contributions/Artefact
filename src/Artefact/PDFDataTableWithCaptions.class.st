Class {
	#name : #PDFDataTableWithCaptions,
	#superclass : #PDFDataTable,
	#instVars : [
		'captions'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #action }
PDFDataTableWithCaptions >> buildCaption: aString styleSheet: aStyleSheet [
	"answer a PDFCellStyle instance for a caption datatable cell"

	|ink captionElement |

	captionElement := PDFCellElement new 
		styleSheet: aStyleSheet; 
		wh: self wh; 
		text: aString;
		margin: self margin.
		
	"The fill color is remplaced by the caption color"
	captionElement fillColor: (aStyleSheet get: #captionColor). 
	
	^captionElement
		
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captionColor [
	"Answer the color for the background of a caption. "
	
	^ self styleSheet get: #captionColor
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captionColor: aPDFColor [
	self styleSheet setAttribute: #captionColor value: aPDFColor
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captions [
	^ captions
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captions: anObject [
	captions := anObject
]
