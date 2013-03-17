"
A PDFTextElement is the basic element for text.

Instance Variables

"
Class {
	#name : #PDFTextElement,
	#superclass : #PDFText,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFTextElement >> producePageElementCodeWith: aGenerator StyleSheet: anObject [
	"Draw a text at xy position"
	| position |
	
	position := aGenerator determinePositionOnCurrentPage: self from.
	 		
	^ (String streamContents: [ :s |
		s nextPutAll: PDFByteCode beginText; 
		space;
		nextPutAll: (self splitCoordinates: position);
		space;
		nextPutAll: PDFByteCode setTextPosition; 
		space;
		nextPutAll: (self textString: self text);
		space;
		nextPutAll: PDFByteCode showTextString;
		space;
		nextPutAll: PDFByteCode endOfText
	]).
	

]
