Class {
	#name : #PDFDataTable,
	#superclass : #PDFComposite,
	#instVars : [
		'elements',
		'cellElement',
		'data'
	],
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFDataTable >> data [
	^data
]

{ #category : #accessing }
PDFDataTable >> data: anArray [
	data := anArray
]

{ #category : #accessing }
PDFDataTable >> dotted: aPDFDottedObject [
	self styleSheet dotted: aPDFDottedObject
]

{ #category : #accessing }
PDFDataTable >> dottedIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #dotted ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFDataTable >> drawColor: aColor [
	self styleSheet drawColor: aColor
]

{ #category : #accessing }
PDFDataTable >> drawColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #drawColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFDataTable >> fillColor: aColor [
	self styleSheet fillColor: aColor
]

{ #category : #accessing }
PDFDataTable >> fillColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #fillColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFDataTable >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #accessing }
PDFDataTable >> fontIfAbsent: aStyleSheet. [
	^ (self styleSheet get: #font ifAbsentFrom: aStyleSheet)
]

{ #category : #'initialize-release' }
PDFDataTable >> initialize [
	super initialize.
	elements := OrderedCollection new.
	cellElement := PDFCellStyle new
]

{ #category : #accessing }
PDFDataTable >> textColor: aColor [
	self styleSheet textColor: aColor
]

{ #category : #accessing }
PDFDataTable >> textColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #textColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFDataTable >> thickness: aThickness [
	self styleSheet thickness:  aThickness
]

{ #category : #accessing }
PDFDataTable >> thicknessIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #thickness ifAbsentFrom: anAlternativeStyleSheet 
]
