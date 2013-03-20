Class {
	#name : #PDFJpegElement,
	#superclass : #PDFImage,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFJpegElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: anObject [
	| position |
	
	position := aPDFGenerator determinePositionOnCurrentPage: self from.
	 			
	^  (String streamContents: [ :s |
		s print: 'q'; space;
		print: (aPDFGenerator convertToPoints: self wh x); space;
		print: '0 0'; space;
		print: (aPDFGenerator convertToPoints: self wh y); space;
		print: (aPDFGenerator convertToPoints: position x); space;
		print: (aPDFGenerator convertToPoints: position y); space;
		"ici il faut récupérer le numero de l'image"
		print: '/I1';
		print: 'Do Q'
	 ]).
]

{ #category : #action }
PDFJpegElement >> readImage: aFilename [
	| stream |
	"pas très judicieux, il faut le faire au niveau du writer..."
	stream := FileStream readOnlyFileNamed:  aFilename.
	stream binary.
	self reader: (JPEGReadWriter new on: stream reset).
	self data: self reader nextImage.
	stream close.
	
]
