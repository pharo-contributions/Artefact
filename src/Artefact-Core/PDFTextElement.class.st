"
A PDFTextElement is the basic element for text.

Instance Variables

"
Class {
	#name : #PDFTextElement,
	#superclass : #PDFText,
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #render }
PDFTextElement >> minimumDimensionWith: aPDFGenerator styleSheet: aStyleSheet [
	^ ((aStyleSheet font getStringWidth: self text) + (2 * aStyleSheet margin)) @ (aStyleSheet font fontSize + (2 * aStyleSheet margin))
]

{ #category : #render }
PDFTextElement >> producePageElementCodeWith: aGenerator StyleSheet: aStyleSheet [
	"Draw a text at xy position"

	| position |
	position := aGenerator determinePositionOnCurrentPage: self from + (0 @ (aStyleSheet font fontSize * 0.8)).
	^ String
		streamContents: [ :s | 
			s
				nextPutAll: PDFByteCode beginText;
				space;
				nextPutAll: (self splitCoordinates: position);
				space;
				nextPutAll: PDFByteCode setTextPosition;
				space;
				nextPutAll: (self textString: self text);
				space;
				nextPutAll: PDFByteCode showTextString;
				space;
				nextPutAll: PDFByteCode endOfText ]
]

{ #category : #accessing }
PDFTextElement >> requiredAttributes [
	^ #( from text )
]
