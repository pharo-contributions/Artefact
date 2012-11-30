Class {
	#name : #PDFTextElement,
	#superclass : #PDFText,
	#category : #'Artefact-Elements-Page-Basics'
}

{ #category : #render }
PDFTextElement >> producePageElementCodeOn: aPage [
	"Draw a text at xy position"
	| position |
	
	position := self determinePosition: self from on: aPage.
	 		
	^ (String streamContents: [ :s |
		s nextPutAll: PDFByteCode beginText; 
		space;
		nextPutAll: (self splitCoordinates: position);
		space;
		nextPutAll: PDFByteCode setTextPosition; 
		space;
		nextPutAll: ((aPage document) textString: self text);
		space;
		nextPutAll: PDFByteCode showTextString;
		space;
		nextPutAll: PDFByteCode endOfText
	]).
	

]
