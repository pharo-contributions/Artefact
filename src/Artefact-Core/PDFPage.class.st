"
A PDFPage is a page of a PDFDocument. A page is composed by a collection of PDFElements.

Instance Variables
	document:		<Object>
	elements:		<Object>
	format:		<Object>
	margins:		<Object>

document
	- xxxxx

elements
	- xxxxx

format
	- xxxxx

margins
	- xxxxx

"
Class {
	#name : #PDFPage,
	#superclass : #Object,
	#instVars : [
		'document',
		'format',
		'elements',
		'margins',
		'styleSheet'
	],
	#category : #'Artefact-Core-Base'
}

{ #category : #accessing }
PDFPage class >> elements: aCollectionOfElements [
	^ self new
		elements: aCollectionOfElements;
		yourself
]

{ #category : #action }
PDFPage >> add: anElement [
	"Use this to add a new element to this page"
	self elements add: anElement.
]

{ #category : #'as yet unclassified' }
PDFPage >> defaultFormat [
	^PDFA4Format new
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
	^ format ifNil: [ format := self document ifNil: [ self defaultFormat ] ifNotNil: [self document format copy] ]
]

{ #category : #accessing }
PDFPage >> format: aPDFFormat [
	format :=  aPDFFormat
]

{ #category : #'initialize-release' }
PDFPage >> initialize [
	super initialize.
	elements := OrderedCollection new
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
	^ styleSheet ifNil: [self document styleSheet ]
]

{ #category : #accessing }
PDFPage >> styleSheet: anObject [
	styleSheet := anObject
]
