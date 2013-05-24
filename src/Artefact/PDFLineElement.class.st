"
A PDFLineElement is  the basic element for line.

Instance Variables

"
Class {
	#name : #PDFLineElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFLineElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: anObject [
	| dest |
	
	dest := aPDFGenerator determinePositionOnCurrentPage: self orientedTo .
	 			
	^  (String streamContents: [ :s |
		s nextPutAll: (self moveTo: self orientedFrom with: aPDFGenerator);
		nextPutAll: (self splitCoordinates: dest);
		space;
		nextPutAll: PDFByteCode line;
		space;
		nextPutAll: PDFByteCode noFilling
	]).
]

{ #category : #'as yet unclassified' }
PDFLineElement >> requiredAttributes [
	^ #( from to orientation )
]
