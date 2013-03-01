Class {
	#name : #PDFCircleElement,
	#superclass : #PDFDraw,
	#instVars : [
		'radius'
	],
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFCircleElement >> fillmode [
	^ PDFByteCode noFilling
]

{ #category : #render }
PDFCircleElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: anObject [
	"Draw a line from xy to destination"
	
	| origin r |
	
	origin := aPDFGenerator determinePositionOnCurrentPage: self from.
	 	
	r := aPDFGenerator convertToPoints: self radius.
	
	^ (String streamContents: [ :s |
		s nextPutAll: (self moveTo: ((self from x + self radius) @ (self from y)) with: aPDFGenerator); 
		print: (origin x + r); space; print: ((r * 0.552) + origin y); space;
		print: ((r * 0.552) + origin x); space; print: (origin y + r); space;
		print: origin x; space; print: (origin y + r); nextPutAll: ' c ';
		print: ((-0.552 * r) + origin x); space; print: (origin y + r); space;
		print: (origin x - r); space; print: ((r * 0.552) + origin y); space;
		print: (origin x - r); space; print: origin y; nextPutAll: ' c ';
		print: (origin x - r); space; print: ((-0.552 * r) + origin y); space;
		print: ((-0.552 * r) + origin x); space; print:  (origin y - r); space;
		print: origin x; space; print: (origin y - r); nextPutAll: ' c ';
		print: ((0.552 * r) + origin x); space; print: (origin y - r); space;
		print: (origin x + r); space; print: ((-0.552 * r) + origin y); space;
		print: (origin x + r); space; print: origin y; nextPutAll: ' c h ';
		nextPutAll: (self fillmode)
	]).
 	
]

{ #category : #accessing }
PDFCircleElement >> radius [
	^radius
]

{ #category : #accessing }
PDFCircleElement >> radius: aValue [
	radius := aValue
]
