Class {
	#name : #PDFText,
	#superclass : #PDFStyle,
	#instVars : [
		'xy',
		'wh',
		'text',
		'font',
		'pdfFontSize'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFText >> font [
	^ font ifNil: [ font := PDFHelveticaFont new ]
]

{ #category : #accessing }
PDFText >> font: anObject [
	font := anObject
]

{ #category : #configuration }
PDFText >> initStyle: aDocument [
	"Set line width to n point"
	
	"Set the colors or grey levels"
	self out: (self setColorForInk: (self ink) fillWith: (self fillColor)).
	
	"Set the font size for the PDF document"
	self pdfFontSize: ((self font fontSize / aDocument scaleFactor) roundDownTo: 0.01).	

	"Insert the font size in the PDF document"
	aDocument fonts at: (self font fontName) ifAbsent: [ aDocument fonts at: self font fontName put: ((aDocument fonts size) + 1) ].
	self out: 'BT /F', (aDocument fonts at: (self font fontName)) asString , ' ' , (self pdfFontSize asString) , ' Tf ET'.
]

{ #category : #accessing }
PDFText >> pdfFontSize [
	^ pdfFontSize
]

{ #category : #accessing }
PDFText >> pdfFontSize: anObject [
	pdfFontSize := anObject
]

{ #category : #render }
PDFText >> setColorForInk: aInkColor fillWith: aFillColor [
	"fillColor for the text, inkColor for draw the box"
	^ (super setColorForInk: aFillColor fillWith: aInkColor)
]

{ #category : #accessing }
PDFText >> text [
	(text isNil) ifTrue: [ text := '' ].
	^text
]

{ #category : #accessing }
PDFText >> text: anObject [
	text := anObject
]

{ #category : #accessing }
PDFText >> wh [
	^ wh
]

{ #category : #accessing }
PDFText >> wh: anObject [
	wh := anObject
]

{ #category : #accessing }
PDFText >> xy [
	^ xy
]

{ #category : #accessing }
PDFText >> xy: anObject [
	xy := anObject
]
