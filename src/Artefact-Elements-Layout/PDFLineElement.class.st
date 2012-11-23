Class {
	#name : #PDFLineElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFLineElement >> produceElementCodeOn: aPage [
	| dest |
	
	dest := self determinePosition: self to on: aPage.
	 			
	^  (String streamContents: [ :s |
		s nextPutAll: (self moveTo: self from on: aPage);
		nextPutAll: (self splitCoordinates: dest);
		space;
		nextPutAll: PDFByteCode line;
		space;
		nextPutAll: PDFByteCode noFilling
	]).
]
