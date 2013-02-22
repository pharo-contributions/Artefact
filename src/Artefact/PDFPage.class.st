Class {
	#name : #PDFPage,
	#superclass : #Object,
	#instVars : [
		'document',
		'format',
		'elements',
		'xy',
		'lasth',
		'margins'
	],
	#category : #Artefact
}

{ #category : #action }
PDFPage >> add: anElement [
	"Use this to add a new element to this page"
	self elements add: anElement.
]

{ #category : #private }
PDFPage >> defineStyleFor: aCodeSegment [

	| dotted thickness font styleSheet|

	styleSheet := self styleSheet + aCodeSegment styleSheet.

	^ String streamContents: [ :code |
		thickness := styleSheet get: #thickness.
		code nextPutAll: (self document convertToPoints: thickness) asString , ' ' , PDFByteCode thickness , String crlf.
	
		"Set line cap style to square"
		code nextPutAll: ('2 ' , PDFByteCode lineCapStyle); nextPutAll: String crlf.
	
		"Set the colors or grey levels"
		code nextPutAll: (self initColors: styleSheet useDrawColor: aCodeSegment isDrawElement); nextPutAll: String crlf.

		"Set the dotted propertie"
		dotted := styleSheet get: #dotted.

		dotted ifNil: [ code nextPutAll: ('[] 0 ' , PDFByteCode dotted); nextPutAll: String crlf ]
			ifNotNil: [ code nextPutAll: (dotted setDottedInto: self document); nextPutAll: String crlf ].
		
		font := styleSheet get: #font.
	
		"Insert the font size in the PDF document"
		self document fonts at: (font fontName) ifAbsent: [ self document fonts at: font fontName put: ((self document fonts size) + 1) ].
		code nextPutAll: ('BT /F', (self document fonts at: (font fontName)) asString , ' ' , (font fontSize asString) , ' Tf ET'); nextPutAll: String crlf.
	]
]

{ #category : #accessing }
PDFPage >> document [
	"answer the document which the page is attached"
	^ document
]

{ #category : #accessing }
PDFPage >> document: aPDFDocument [
	document :=  aPDFDocument
]

{ #category : #accessing }
PDFPage >> elements [
	^ elements
]

{ #category : #accessing }
PDFPage >> elements: aCollectionOfPDFElements [
	elements :=  aCollectionOfPDFElements
]

{ #category : #accessing }
PDFPage >> format [
	^ format ifNil: [ format := self document format ]
]

{ #category : #accessing }
PDFPage >> format: aPDFFormat [
	format :=  aPDFFormat
]

{ #category : #accessing }
PDFPage >> from [
	^ xy
]

{ #category : #accessing }
PDFPage >> from: aCurrentPosition [
	xy := aCurrentPosition
]

{ #category : #private }
PDFPage >> initColors: aStyleSheet useDrawColor: useDrawColor [
	| drawColor fillColor textColor |
	
	drawColor := aStyleSheet get: #drawColor.
	fillColor := aStyleSheet get: #fillColor.
	textColor := aStyleSheet get: #textColor.
	
	^ String streamContents: [ :code |
		useDrawColor ifTrue: [
			(fillColor greyLevel isNil)
			ifTrue: [ (fillColor red isNil) ifFalse: [ code nextPutAll: ((PDFColor formatRGB: fillColor) , ' ' , PDFByteCode fillWithColor) ] ]
			ifFalse: [ code nextPutAll: (PDFColor round: (fillColor greyLevel)) , ' ' , PDFByteCode fillWithGreyLevel ].
		]
		ifFalse: [
			(textColor greyLevel isNil)
				ifTrue: [ (textColor red isNil) ifFalse: [ code nextPutAll: ((PDFColor formatRGB: textColor) , ' rg') ] ]
				ifFalse: [ code nextPutAll: (PDFColor round: (textColor greyLevel)) , ' g' ].
		].
		code nextPutAll: String crlf.
		(drawColor greyLevel isNil) 
				ifTrue: [ (drawColor red isNil) ifFalse: [ code nextPutAll: ((PDFColor formatRGB: drawColor) , ' ' , PDFByteCode drawWithColor) ] ]
				ifFalse: [ code nextPutAll: (PDFColor round: (drawColor greyLevel)) , ' ' , PDFByteCode drawWithGreyLevel ].
		code nextPutAll: String crlf.		
	]
]

{ #category : #private }
PDFPage >> initRender [
	"prepare the render step"
	self margins: (self format margins x / self document scaleFactor) @ (self format margins y / self document scaleFactor).
	self from: margins.
	self lasth: 0.
	self buffer resetContents.
]

{ #category : #'initialize-release' }
PDFPage >> initialize [
	super initialize.
	elements := OrderedCollection new
]

{ #category : #accessing }
PDFPage >> lasth [
	"height of last cell printed"
	^ lasth
]

{ #category : #accessing }
PDFPage >> lasth: lastCellHeight [
	lasth :=  lastCellHeight
]

{ #category : #accessing }
PDFPage >> margins [
	^ margins
]

{ #category : #accessing }
PDFPage >> margins: theMargins [
	margins := theMargins
]

{ #category : #accessing }
PDFPage >> styleSheet [
	^ self document styleSheet 
]
