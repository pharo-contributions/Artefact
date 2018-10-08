"
A PDFLineElement is  the basic element for line.

Instance Variables

"
Class {
	#name : #PDFLineElement,
	#superclass : #PDFDraw,
	#traits : 'PDFAngleDirected',
	#classTraits : 'PDFAngleDirected classTrait',
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #'instance creation' }
PDFLineElement class >> from: from angle: angle length: aLength [
	^ self from: from to: from + ((angle cos * aLength) @ (angle sin * aLength))
]

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

{ #category : #accessing }
PDFLineElement >> requiredAttributes [
	^ #( from to orientation )
]
