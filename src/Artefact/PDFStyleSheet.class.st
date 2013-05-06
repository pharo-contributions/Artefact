Class {
	#name : #PDFStyleSheet,
	#superclass : #Object,
	#instVars : [
		'attributes',
		'document',
		'substyles'
	],
	#category : #Artefact
}

{ #category : #'initialize-release' }
PDFStyleSheet class >> default [
	| default |
	default:= self new 
		at: #textColor put: (PDFColor new setColor:#(0 0 0)); 
		at: #fillColor put: (PDFColor new setColor: #(255 255 255)); 
		at: #drawColor put: (PDFColor new setColor:#(0 0 0)); 
		at: #thickness put: 1 pt;
		at: #dotted put: nil;
		at: #roundCap put: false;
		at: #font put: PDFHelveticaFont new;
		at: #rotation put: 0;
		yourself.
	default > #caption at: #fillColor put: (PDFColor new setGreyLevel: 192).
	^ default
]

{ #category : #Action }
PDFStyleSheet >> + aStyleSheet [
	| newStyleSheet |
	newStyleSheet := self copy.
	aStyleSheet attributes keysAndValuesDo: [:aKey :aValue | newStyleSheet attributes at: aKey put: aValue ].
	aStyleSheet substyles keysAndValuesDo: [:aKey :aSubStyleSheet | newStyleSheet substyles at: aKey put: aSubStyleSheet copy ].
	newStyleSheet substyles at: #default put: newStyleSheet.
	^ newStyleSheet
]

{ #category : #'as yet unclassified' }
PDFStyleSheet >> > aSymbol [
	^ self substyles at: aSymbol ifAbsentPut: [ PDFStyleSheet new ]
]

{ #category : #private }
PDFStyleSheet >> at: anAttribute put: aValue [
	attributes at: anAttribute put: aValue 
]

{ #category : #accessing }
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
	self at: #dotted put: aPDFDotted 
]

{ #category : #attributes }
PDFStyleSheet >> drawColor: aPDFColor [
	self at: #drawColor put: aPDFColor 
]

{ #category : #attributes }
PDFStyleSheet >> fillColor: aPDFColor [
	self at: #fillColor put: aPDFColor 
]

{ #category : #private }
PDFStyleSheet >> font [
	^ self get: #font
]

{ #category : #attributes }
PDFStyleSheet >> font: aFont [
	self at: #font put: aFont 
]

{ #category : #private }
PDFStyleSheet >> get: anAttribute [
	^ attributes at: anAttribute
]

{ #category : #'initialize-release' }
PDFStyleSheet >> initialize [
	super initialize.
	attributes := Dictionary new.
	self initializeSubstyles.
]

{ #category : #'initialize-release' }
PDFStyleSheet >> initializeSubstyles [
	substyles := Dictionary new.
	substyles at: #default put: self
]

{ #category : #attributes }
PDFStyleSheet >> postCopy [
	attributes := attributes copy.
	substyles := substyles copy.
	substyles at: #default put: self.
]

{ #category : #attributes }
PDFStyleSheet >> rotation: anAngle [
	self at: #rotation put: anAngle
]

{ #category : #attributes }
PDFStyleSheet >> roundCap: aBoolean [
	self at: #roundCap put: aBoolean 
]

{ #category : #accessing }
PDFStyleSheet >> substyles [
	^ substyles
]

{ #category : #accessing }
PDFStyleSheet >> substyles: anObject [
	substyles := anObject
]

{ #category : #attributes }
PDFStyleSheet >> textColor: aColor [
	self at: #textColor put: aColor 
]

{ #category : #attributes }
PDFStyleSheet >> thickness: aThickness [
	self at: #thickness put: aThickness 
]

{ #category : #'as yet unclassified' }
PDFStyleSheet >> withoutSubstyles [
	^ self copy initializeSubstyles
]
