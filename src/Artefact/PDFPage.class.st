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
