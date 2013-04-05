"
A PDFDraw is the superclass for all basics draw elements.

Instance Variables
	filled:		<Object>
	to:		<Object>

filled
	- xxxxx

to
	- xxxxx

"
Class {
	#name : #PDFDraw,
	#superclass : #PDFBasic,
	#instVars : [
		'to',
		'filled'
	],
	#category : #'Artefact-Elements-Basic'
}

{ #category : #'as yet unclassified' }
PDFDraw class >> from: aPosition wh: aDimension [
	^ self new
		from: aPosition;
		wh: aDimension;
		yourself
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
	self filled: true.
	self styleSheet fillColor: aPDFColor 
]

{ #category : #accessing }
PDFDraw >> filled [
	^ filled
]

{ #category : #accessing }
PDFDraw >> filled: anObject [
	filled := anObject
]

{ #category : #accessing }
PDFDraw >> fillmode [
	^ self filled
		ifTrue: [ PDFByteCode filling ]
		ifFalse: [ PDFByteCode noFilling ]
]

{ #category : #accessing }
PDFDraw >> initialize [
	super initialize. 
	self filled: false.
]

{ #category : #accessing }
PDFDraw >> isDrawElement [
	^ true
]

{ #category : #action }
PDFDraw >> moveTo: aPosition with: aGenerator [
	"answer the PDF code to setting the start position for drawing"
	
	| pos |
	
	pos := aGenerator determinePositionOnCurrentPage: aPosition.
	 
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
