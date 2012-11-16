Class {
	#name : #PDFRectElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements'
}

{ #category : #render }
PDFRectElement >> fillmode [
	^PDFByteCode noFilling 
]

{ #category : #render }
PDFRectElement >> renderContentOn: aPage [
	"Draw a rectangle from xy with a specified size wh"
	
	| position |
	
	position := self determinePosition: self xy on: aPage.
	 
	self out: (String streamContents: [ :s |
		s nextPutAll: (self splitCoordinates: position);
		space;
		print: (self userUnitToPoints: self wh x into: aPage document);
		space;
		print: ((self userUnitToPoints: self wh y into: aPage document) * -1);
		space;
		nextPutAll: PDFByteCode rectangle;
		space;
		nextPutAll: (self fillmode)
	 ]).	
			
	^buffer
]
