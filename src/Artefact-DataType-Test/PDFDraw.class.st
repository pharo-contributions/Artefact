Class {
	#name : #PDFDraw,
	#superclass : #PDFBasic,
	#instVars : [
		'to'
	],
	#category : #'Artefact-Elements-Page-Basics'
}

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

{ #category : #accessing }
PDFDraw >> initialize [
	super initialize. 
	self styleSheet: PDFStyleSheet new
]

{ #category : #accessing }
PDFDraw >> isDrawElement [
	^ true
]

{ #category : #action }
PDFDraw >> moveTo: aPosition on: aPage [
	"answer the PDF code to setting the start position for drawing"
	
	| pos |
	
	pos := self determinePosition: aPosition on: aPage.
	 
	^(String streamContents: [ :s |
		s print: (pos x);
		space;
		print: (pos y);
		space;
		nextPutAll: PDFByteCode moveTo;
		space
	]) 
]

{ #category : #accessing }
PDFDraw >> thickness: anObject [
	self styleSheet thickness: anObject
]

{ #category : #accessing }
PDFDraw >> to [
	^ to
]

{ #category : #accessing }
PDFDraw >> to: anObject [
	to := anObject
]
