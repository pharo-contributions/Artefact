Class {
	#name : #PDFRectStyle,
	#superclass : #PDFDraw,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFRectStyle >> fillmode [
	^PDFByteCode noFilling 
]

{ #category : #render }
PDFRectStyle >> renderContentOn: aPage [
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
