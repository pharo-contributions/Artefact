Class {
	#name : #PDFStyleSheet,
	#superclass : #Object,
	#instVars : [
		'attributes',
		'document'
	],
	#category : #Artefact
}

{ #category : #'initialize-release' }
PDFStyleSheet class >> defaultForDocument: aDocument [
	^ self new 
		setAttribute: #textColor value: (PDFColor new setColor:#(0 0 0)); 
		setAttribute: #fillColor value: (PDFColor new setColor: #(255 255 255)); 
		setAttribute: #drawColor value: (PDFColor new setColor:#(0 0 0)); 
		setAttribute: #thickness value: 1 point;
		setAttribute: #dotted value: nil;
		setAttribute: #font value: PDFHelveticaFont new;
		yourself
]

{ #category : #'as yet unclassified' }
PDFStyleSheet >> + aStyleSheet [
	| newStyleSheet |
	newStyleSheet := self deepCopy.
	aStyleSheet attributes keysAndValuesDo: [:aKey :aValue | newStyleSheet attributes at: aKey put: aValue ].
	^ newStyleSheet
]

{ #category : #'as yet unclassified' }
PDFStyleSheet >> attributes [
	^ attributes
]

{ #category : #accessing }
PDFStyleSheet >> document [
	^document 
]

{ #category : #accessing }
PDFStyleSheet >> document: aDocumentObject [
	document := aDocumentObject 
]

{ #category : #attributes }
PDFStyleSheet >> dotted: aPDFDotted [
	self setAttribute: #dotted value: aPDFDotted 
]

{ #category : #attributes }
PDFStyleSheet >> drawColor: aPDFColor [
	self setAttribute: #drawColor value: aPDFColor 
]

{ #category : #attributes }
PDFStyleSheet >> fillColor: aPDFColor [
	self setAttribute: #fillColor value: aPDFColor 
]

{ #category : #private }
PDFStyleSheet >> font [
	^ self get: #font
]

{ #category : #attributes }
PDFStyleSheet >> font: aFont [
	self setAttribute: #font value: aFont 
]

{ #category : #private }
PDFStyleSheet >> get: anAttribute [
	^ attributes at: anAttribute
]

{ #category : #private }
PDFStyleSheet >> get: anAttribute ifAbsentFrom: anotherStyleSheet [
	^ attributes at: anAttribute ifAbsent: [anotherStyleSheet get: anAttribute]
]

{ #category : #private }
PDFStyleSheet >> initialize [
	super initialize.
	attributes := Dictionary new.
]

{ #category : #private }
PDFStyleSheet >> setAttribute: anAttribute value: aValue [
	attributes at: anAttribute put: aValue 
]

{ #category : #attributes }
PDFStyleSheet >> textColor: aColor [
	self setAttribute: #textColor value: aColor 
]

{ #category : #attributes }
PDFStyleSheet >> thickness: aThickness [
	self setAttribute: #thickness value: aThickness 
]
