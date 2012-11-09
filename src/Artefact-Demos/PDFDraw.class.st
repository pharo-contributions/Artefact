Class {
	#name : #PDFDraw,
	#superclass : #PDFBasic,
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
PDFDraw >> drawColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #drawColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFDraw >> fillColor: aPDFColor [
	self styleSheet fillColor: aPDFColor 
]

{ #category : #accessing }
PDFDraw >> fillColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #fillColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #configuration }
PDFDraw >> initColors: aDocument [
	| drawColor fillColor pdfcode |
	
	drawColor := self drawColorIfAbsent: aDocument styleSheet.
	fillColor := self fillColorIfAbsent: aDocument styleSheet.
	
	pdfcode := OrderedCollection new.
	
	(drawColor greyLevel isNil) 
		ifTrue: [ (drawColor red isNil) ifFalse: [ pdfcode add: ((PDFColor formatRGB: drawColor) , ' RG') ] ]
		ifFalse: [ pdfcode add: (PDFColor round: (drawColor greyLevel)) , ' G' ].
	(fillColor greyLevel isNil)
		ifTrue: [ (fillColor red isNil) ifFalse: [ pdfcode add: ((PDFColor formatRGB: fillColor) , ' rg') ] ]
		ifFalse: [ pdfcode add: (PDFColor round: (fillColor greyLevel)) , ' g' ].
		
	self out: pdfcode


]

{ #category : #configuration }
PDFDraw >> initStyle: aDocument [

	"Set line thickness to n point"

	| dotted thickness |

	thickness := (self styleSheet get: #thickness ifAbsentFrom: aDocument styleSheet).
	self out: (self userUnitToPoints: thickness into: aDocument) asString , ' w'.
	
	"Set line cap style to square"
	self out: '2 J'.
	
	"Set the colors or grey levels"
	self initColors: aDocument.

	"Set the dotted propertie"
	dotted := (self styleSheet get: #dotted ifAbsentFrom: aDocument styleSheet).

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
