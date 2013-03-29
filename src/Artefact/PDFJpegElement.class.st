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
	| positionY imageId |
	
	"Determine the vertical position of the image"
	positionY := ((aPDFGenerator convertToPoints: self from y) +(aPDFGenerator convertToPoints: self wh y)) * -1.
	
	"Determine the id of the image"
	imageId:= aPDFGenerator getImageIdFor: self.
	 			
	^  (String streamContents: [ :s |
		s nextPutAll:  'q'; space;
		nextPutAll: (aPDFGenerator convertToPoints: self wh x) asString; space;
		nextPutAll: '0 0'; space;
		nextPutAll: (aPDFGenerator convertToPoints: self wh y) asString; space;
		nextPutAll: (aPDFGenerator convertToPoints: self from x) asString; space;
		nextPutAll: positionY asString; space;
		nextPut: $/; nextPutAll: imageId; space;
		nextPutAll: 'Do Q'
	 ]).
]
