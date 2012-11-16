Class {
	#name : #PDFLineElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFLineElement >> renderContentOn: aPage [
	"Draw a line from xy to destination"
	
	| dest |
	
	dest := self determinePosition: self destination on: aPage.
	 			
	self out: (String streamContents: [ :s |
		s nextPutAll: (self moveTo: self xy on: aPage);
		nextPutAll: (self splitCoordinates: dest);
		space;
		nextPutAll: PDFByteCode line;
		space;
		nextPutAll: PDFByteCode noFilling
	]).
	
	^buffer
]
