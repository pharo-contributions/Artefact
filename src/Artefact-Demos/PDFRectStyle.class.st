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
	
	self out: (String streamContents: [ :s |
		s print: (self userUnitToPoints: self xy x into: aPage document);
		space;
		print: ((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document));
		space;
		print: (self userUnitToPoints: self wh x into: aPage document);
		space;
		print: ((self userUnitToPoints: self wh y into: aPage document) * -1);
		nextPutAll: ' re ';
		nextPutAll: (self fillmode)
	 ]).	
			
	^buffer
]
