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
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #defaults }
PDFDraw >> defaultStyle [ 
	^#draw
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
	self styleSheet fillColor: aPDFColor 
]

{ #category : #accessing }
PDFDraw >> fillMode: filled [
	^ filled
		ifTrue: [ PDFByteCode filling ]
		ifFalse: [ PDFByteCode noFilling ]
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
PDFDraw >> roundCap: aBoolean [
	self styleSheet roundCap: aBoolean
]

{ #category : #accessing }
PDFDraw >> thickness: anObject [
	self styleSheet thickness: anObject
]
