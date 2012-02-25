Class {
	#name : #PDFText,
	#superclass : #PDFStyle,
	#instVars : [
		'xy',
		'wh',
		'text',
		'font'
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
	"buffer add: ((self width / aDocument scaleFactor) roundDownTo: 0.001) asString , ' w'."
	
	"Set line cap style to square"
	"buffer add: '2 J'."
	
	"Set the colors or grey levels"
	self out: (self setColorForInk: (self ink) fillWith: (self fillColor))
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
