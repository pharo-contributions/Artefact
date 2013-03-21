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
	| position imageId |
	
	position := aPDFGenerator determinePositionOnCurrentPage: self from.
	
	imageId:= aPDFGenerator getImageIdFor: self.
	 			
	^  (String streamContents: [ :s |
		s nextPutAll:  'q'; space;
		nextPutAll: (aPDFGenerator convertToPoints: self wh x) asString; space;
		nextPutAll: '0 0'; space;
		nextPutAll: (aPDFGenerator convertToPoints: self wh y) asString; space;
		nextPutAll: (position x) asString; space;
		nextPutAll: (position y) asString; space;
		"ici il faut récupérer le numero de l'image"
		nextPut: $/; nextPutAll: imageId; space;
		nextPutAll: 'Do Q'
	 ]).
]
