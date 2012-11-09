Class {
	#name : #PDFLineStyle,
	#superclass : #PDFDraw,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFLineStyle >> renderContentOn: aPage [
	"Draw a line from xy to destination"
				
	self out: (String streamContents: [ :s |
		s print: (self userUnitToPoints: self xy x into: aPage document);
		space;
		print: ((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document));
		nextPutAll: ' m ';
		print: (self userUnitToPoints: self destination x into: aPage document);
		space;
		print: ((aPage format defaultSize y) - (self userUnitToPoints: self destination y into: aPage document));
		nextPutAll: ' l S'
	]).
	
	^buffer
]
