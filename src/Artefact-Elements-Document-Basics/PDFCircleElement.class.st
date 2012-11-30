Class {
	#name : #PDFCircleElement,
	#superclass : #PDFDraw,
	#instVars : [
		'radius'
	],
	#category : #'Artefact-Elements-Page-Basics'
}

{ #category : #render }
PDFCircleElement >> fillmode [
	^ PDFByteCode noFilling
]

{ #category : #render }
PDFCircleElement >> producePageElementCodeOn: aPage [
	"Draw a line from xy to destination"
	
	| origin r |
	
	origin := self determinePosition: self from on: aPage.
	 	
	r := aPage document convertToPoints: self radius.
	
	^ (String streamContents: [ :s |
		s nextPutAll: (self moveTo: ((self from x + self radius) @ (self from y)) on: aPage); 
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
