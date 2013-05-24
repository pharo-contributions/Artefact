"
A PDFLineElement is  the basic element for line.

Instance Variables

"
Class {
	#name : #PDFLineElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #'as yet unclassified' }
PDFLineElement class >> from: aPosition to:  anotherPosition [
	^self new 
		from: aPosition;
		to: anotherPosition;
		yourself
]

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
