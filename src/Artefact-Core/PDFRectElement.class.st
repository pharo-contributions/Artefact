"
A PDFRectElement is the basic element for rectangle.

Instance Variables

"
Class {
	#name : #PDFRectElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #render }
PDFRectElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet [
	"Draw a rectangle from xy with a specified dimension"
	
	| position |
	
	position := aPDFGenerator determinePositionOnCurrentPage: self from.
	 
	^(String streamContents: [ :s |
		s nextPutAll: (self splitCoordinates: position);
		space;
		print: (aPDFGenerator convertToPoints: self dimension x);
		space;
		print: ((aPDFGenerator convertToPoints: self dimension y) * -1);
		space;
		nextPutAll: PDFByteCode rectangle;
		space;
		nextPutAll:( self fillMode: (aStyleSheet filled))
	 ]).	
		
]
