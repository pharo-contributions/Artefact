Class {
	#name : #PDFTextStyle,
	#superclass : #PDFText,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFTextStyle >> renderContentOn: aPage [
	"Draw a text at xy position"
			
	self out: (String streamContents: [ :s |
		s nextPutAll: 'BT ';
		print: (self userUnitToPoints: self xy x into: aPage document);
		space;
		print: ((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document));
		nextPutAll: ' Td ';
		nextPutAll: ((aPage document) textString: self text);
		nextPutAll: ' Tj ET'
	]).

	^self buffer
	

]
