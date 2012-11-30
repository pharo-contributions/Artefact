Class {
	#name : #PDFDataTableWithCaptions,
	#superclass : #PDFDataTable,
	#instVars : [
		'captions',
		'captionColor'
	],
	#category : #'Artefact-Elements-Page-Composites'
}

{ #category : #action }
PDFDataTableWithCaptions >> buildCaption: aString [
	"answer a PDFCellStyle instance for a caption datatable cell"

	|ink captionElement |

	captionElement := PDFCellElement new 
		styleSheet: (self styleSheet deepCopy); 
		wh: self wh; 
		text: aString;
		margin: self margin.
		
	"The fill color is remplaced by the caption color"
	captionElement fillColor: (self captionColor). 
	
	^captionElement
		
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captionColor [
	"Answer the color for the background of a caption. 
	If not defined, answer the fill color of the style or the default fill color of the document"
.
	^ captionColor ifNil: [ captionColor := (self fillColorIfAbsent: (self page document styleSheet)) ]
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captionColor: aPDFColor [
	captionColor := aPDFColor
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captions [
	^ captions
]

{ #category : #accessing }
PDFDataTableWithCaptions >> captions: anObject [
	captions := anObject
]
