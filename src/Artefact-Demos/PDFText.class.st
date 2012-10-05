Class {
	#name : #PDFText,
	#superclass : #PDFVisibleItem,
	#instVars : [
		'text'
	],
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFText >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #configuration }
PDFText >> initStyle: aDocument [
	
	"Set the colors or grey levels"
	| font |
	self out: (self setColorForInk: (self ink) fillWith: (self fillColor)).

	font := (self styleSheet get: #font ifAbsentFrom: aDocument styleSheet).
	
	"Insert the font size in the PDF document"
	aDocument fonts at: (font fontName) ifAbsent: [ aDocument fonts at: font fontName put: ((aDocument fonts size) + 1) ].
	self out: 'BT /F', (aDocument fonts at: (font fontName)) asString , ' ' , (font scaledFontSize: aDocument scaleFactor) asString , ' Tf ET'.
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
PDFText >> textColor: aColor [
	self styleSheet textColor: aColor
]
