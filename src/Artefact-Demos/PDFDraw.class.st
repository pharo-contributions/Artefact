Class {
	#name : #PDFDraw,
	#superclass : #PDFVisibleItem,
	#instVars : [
		'destination'
	],
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFDraw >> destination [
	^ destination
]

{ #category : #accessing }
PDFDraw >> destination: anObject [
	destination := anObject
]

{ #category : #accessing }
PDFDraw >> dotted: anObject [
	self styleSheet dotted: anObject
]

{ #category : #accessing }
PDFDraw >> drawColor: aPDFColor [
	self styleSheet drawColor: aPDFColor 
]

{ #category : #accessing }
PDFDraw >> fillColor: aPDFColor [
	self styleSheet fillColor: aPDFColor 
]

{ #category : #configuration }
PDFDraw >> initStyle: aDocument [

	
	"Set line thickness to n point"
	| dotted thickness |
	thickness := (self styleSheet get: #thickness ifAbsentFrom: aDocument styleSheet).
	self out: ((thickness / aDocument scaleFactor) roundDownTo: 0.001) asString , ' w'.
	
	"Set line cap style to square"
	self out: '2 J'.
	
	"Set the colors or grey levels"
	self out: (self setColorForInk: (self styleSheet get: #drawColor ifAbsentFrom: aDocument styleSheet ) 
		fillWith: (self styleSheet get: #fillColor ifAbsentFrom: aDocument styleSheet)
		).

	dotted := (self styleSheet get: #dotted ifAbsentFrom: aDocument styleSheet).

	"Set the dotted if defined"
	dotted ifNil: [ self out: '[] 0 d' ]
		ifNotNil: [ self out: (dotted setDottedInto: aDocument) ]

	
]

{ #category : #accessing }
PDFDraw >> initialize [
	super initialize. 
	self styleSheet: PDFStyleSheet draw
]

{ #category : #accessing }
PDFDraw >> thickness: anObject [
	self styleSheet thickness: anObject
]
