Class {
	#name : #PDFLineElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFLineElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: anObject [
	| dest |
	
	dest := aPDFGenerator determinePositionOnCurrentPage: self to.
	 			
	^  (String streamContents: [ :s |
		s nextPutAll: (self moveTo: self from with: aPDFGenerator);
		nextPutAll: (self splitCoordinates: dest);
		space;
		nextPutAll: PDFByteCode line;
		space;
		nextPutAll: PDFByteCode noFilling
	]).
]
