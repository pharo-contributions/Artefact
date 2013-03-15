Class {
	#name : #PDFRectElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFRectElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet [
	"Draw a rectangle from xy with a specified size wh"
	
	| position |
	
	position := aPDFGenerator determinePositionOnCurrentPage: self from.
	 
	^(String streamContents: [ :s |
		s nextPutAll: (self splitCoordinates: position);
		space;
		print: (aPDFGenerator convertToPoints: self wh x);
		space;
		print: ((aPDFGenerator convertToPoints: self wh y) * -1);
		space;
		nextPutAll: PDFByteCode rectangle;
		space;
		nextPutAll: (self fillmode)
	 ]).	
		
]
