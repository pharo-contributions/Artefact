"
A PDFBezierCurveElement is  the basic element for bezier curve.

Instance Variables

"
Class {
	#name : #PDFBezierCurveElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #'as yet unclassified' }
PDFBezierCurveElement class >> from: aPosition to: aArrayOfPositions [ 
	^self new 
		from: aPosition;
		to: aArrayOfPositions;
		yourself
]

{ #category : #render }
PDFBezierCurveElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: anObject [
	"Draw a Bezier curve from xy to destination (3 control points)"
	
	^ (String streamContents: [ :s |
		s nextPutAll: (self moveTo: (self from) with: aPDFGenerator).
		self to do: [ :p |
			s nextPutAll: (self splitCoordinates: (aPDFGenerator determinePositionOnCurrentPage: p)); space. 
		].
		s nextPutAll: PDFByteCode curve; space; nextPutAll: PDFByteCode noFilling.
	]).
	
]
