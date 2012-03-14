Class {
	#name : #PDFPage,
	#superclass : #Object,
	#instVars : [
		'document',
		'format',
		'buffer',
		'number',
		'styles',
		'xy',
		'lasth',
		'margins'
	],
	#category : #Artefact
}

{ #category : #action }
PDFPage >> add: aStyle [
	"add a style to a page"
	self styles add: aStyle.
]

{ #category : #accessing }
PDFPage >> buffer [
	"answer the content of the page"
	^ buffer ifNil: [ buffer := WriteStream on: String new ]
]

{ #category : #accessing }
PDFPage >> buffer: aString [
	buffer :=  aString
]

{ #category : #private }
PDFPage >> buildStyle: aStyle [
	"build all items of a style at the current position on the page"
	
	aStyle do: [ :item |
			(item className = 'ByteString')
				ifTrue: [ self out: item ]
				ifFalse: [ 
					self buildStyle: (item renderIn: self).					

					(item className = 'PDFLineFeed') ifTrue: [
						self xy: self margins x @ self xy y.
						(item height isNil) ifTrue: [ self xy: self xy x @ (self xy y + self lasth)] ifFalse: [ self xy: self xy x @ self xy y + item height ].
					]
				]
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
PDFPage >> format [
	^ format ifNil: [ format := self document format ]
]

{ #category : #accessing }
PDFPage >> format: aPDFFormat [
	format :=  aPDFFormat
]

{ #category : #private }
PDFPage >> initRender [
	"prepare the render step"
	self margins: (self format margins x / self document scaleFactor) @ (self format margins y / self document scaleFactor).
	self xy: margins.
	self lasth: 0.
	self buffer resetContents.
]

{ #category : #'initialize-release' }
PDFPage >> initialize [
	super initialize
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
PDFPage >> number [
	^ number ifNil: [ number := 0 ]
]

{ #category : #accessing }
PDFPage >> number: aObject [
	number := aObject
]

{ #category : #private }
PDFPage >> out: aItem [
	"append the item to the page"

	self buffer nextPutAll: (aItem, String crlf).

]

{ #category : #action }
PDFPage >> renderContent [
	"answer the content of the page"
	
	self initRender.
	
	"construct each styles"
	self styles do: [ :style | self buildStyle: (style renderIn: self) ].
	
	^buffer contents 
	


]

{ #category : #accessing }
PDFPage >> styles [
	^ styles ifNil: [ styles := OrderedCollection new ]
]

{ #category : #accessing }
PDFPage >> styles: aCollectionOfStyle [
	styles := aCollectionOfStyle
]

{ #category : #accessing }
PDFPage >> xy [
	^ xy
]

{ #category : #accessing }
PDFPage >> xy: aCurrentPosition [
	xy := aCurrentPosition
]
