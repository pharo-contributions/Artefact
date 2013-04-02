"
A PDFJpegElement is the pdf representation of an image

Instance Variables

"
Class {
	#name : #PDFJpegElement,
	#superclass : #PDFImage,
	#instVars : [
		'stream'
	],
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFJpegElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: anObject [
	| origin imageId |
	
	"Determine the vertical position of the image"
	 origin := aPDFGenerator determinePositionOnCurrentPage: (self from + (0 @ self wh y) ).

	"Determine the id of the image"
	imageId:= aPDFGenerator getImageIdFor: self.
	 			
	^  (String streamContents: [ :s |
		s nextPutAll:  'q'; space;
		nextPutAll: (aPDFGenerator convertToPoints: self wh x) asString; space;
		nextPutAll: '0 0'; space;
		nextPutAll: (aPDFGenerator convertToPoints: self wh y) asString; space;
		nextPutAll: (origin x asString); space;
		nextPutAll: (origin y asString); space;
		nextPutAll: 'cm';space; 
		nextPut: $/; nextPutAll: imageId; space;
		nextPutAll: 'Do Q'
	 ]).
]
