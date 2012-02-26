Class {
	#name : #PDFPageNumberStyle,
	#superclass : #PDFText,
	#instVars : [
		'label'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFPageNumberStyle >> label [
	^ label ifNil: [ label := '' ]
]

{ #category : #accessing }
PDFPageNumberStyle >> label: anObject [
	label := anObject
]

{ #category : #render }
PDFPageNumberStyle >> render: aDocument [
	"Draw the page number on the page at the specified position"
		
	^(PDFCellStyle new
		xy: self xy;
		wh: self wh;
		font: self font;
		ink: self ink;
		fillColor: self fillColor;
		border: self border;
		text: (self label , (self text asString));
		alignToCenter).
		
]
