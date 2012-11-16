Class {
	#name : #PDFText,
	#superclass : #PDFBasic,
	#instVars : [
		'text'
	],
	#category : #'Artefact-Elements'
}

{ #category : #accessing }
PDFText >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #configuration }
PDFText >> fontIfAbsent: aStyleSheet. [
	^ (self styleSheet get: #font ifAbsentFrom: aStyleSheet)
]

{ #category : #configuration }
PDFText >> initColors: aStyleSheet [
		
	| textColor pdfcode |
	
	textColor := self textColorIfAbsent:aStyleSheet.
	
	pdfcode := OrderedCollection new.
	
	(textColor greyLevel isNil)
		ifTrue: [ (textColor red isNil) ifFalse: [ pdfcode add: ((PDFColor formatRGB: textColor) , ' rg') ] ]
		ifFalse: [ pdfcode add: (PDFColor round: (textColor greyLevel)) , ' g' ].
		
	self out: pdfcode


]

{ #category : #configuration }
PDFText >> initStyle: aDocument [
	
	"Set the colors or grey levels"
	| font |

	self initColors: aDocument styleSheet.
		
	font := self fontIfAbsent: aDocument styleSheet.
	
	"Insert the font size in the PDF document"
	aDocument fonts at: (font fontName) ifAbsent: [ aDocument fonts at: font fontName put: ((aDocument fonts size) + 1) ].
	self out: 'BT /F', (aDocument fonts at: (font fontName)) asString , ' ' , (font fontSize asString) , ' Tf ET'.
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

{ #category : #accessing }
PDFText >> textColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #textColor ifAbsentFrom: anAlternativeStyleSheet 
]
