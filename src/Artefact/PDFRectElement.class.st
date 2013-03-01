Class {
	#name : #PDFRectElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFRectElement >> fillmode [
	^PDFByteCode noFilling 
]

{ #category : #render }
PDFRectElement >> producePageElementCodeWith: aPage StyleSheet: anObject [
	"Draw a rectangle from xy with a specified size wh"
	
	| position |
	
	position := self determinePosition: self from on: aPage.
	 
	^(String streamContents: [ :s |
		s nextPutAll: (self splitCoordinates: position);
		space;
		print: (aPage document convertToPoints: self wh x);
		space;
		print: ((aPage document convertToPoints: self wh y) * -1);
		space;
		nextPutAll: PDFByteCode rectangle;
		space;
		nextPutAll: (self fillmode)
	 ]).	
		
]
