"
A PDFCircleElement is  the basic element for circle.

Instance Variables
	radius:		<Object>

radius
	- xxxxx

"
Class {
	#name : #PDFCircleElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #'instance creation' }
PDFCircleElement class >> center: aPoint radius: aRadius [
	^ self from: aPoint - (aRadius @ aRadius) to: aPoint + (aRadius @ aRadius)
]

{ #category : #render }
PDFCircleElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet [
	"Draw a line from xy to destination"
	
	| origin r |
	
	origin := aPDFGenerator determinePositionOnCurrentPage: self center.
	 	
	r := aPDFGenerator convertToPoints: self radius.
	
	^ (String streamContents: [ :s |
		s nextPutAll: (self moveTo: ((self center x + self radius) @ (self center y)) with: aPDFGenerator); 
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
		nextPutAll:( self fillMode: (aStyleSheet filled))
	]).
 	
]

{ #category : #accessing }
PDFCircleElement >> radius [
	| box |
	box :=  self to - self from.
	^ (box x max: box y) / 2
]
