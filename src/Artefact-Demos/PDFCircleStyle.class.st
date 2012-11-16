Class {
	#name : #PDFCircleStyle,
	#superclass : #PDFDraw,
	#instVars : [
		'radius'
	],
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFCircleStyle >> fillmode [
	^ PDFByteCode noFilling
]

{ #category : #accessing }
PDFCircleStyle >> radius [
	^radius
]

{ #category : #accessing }
PDFCircleStyle >> radius: aValue [
	radius := aValue
]

{ #category : #render }
PDFCircleStyle >> renderContentOn: aPage [
	"Draw a line from xy to destination"
	| origin r |
	
	origin := self determinePosition: self xy on: aPage.
	 	
	r := self userUnitToPoints: self radius into: aPage document.
	
	self out: (String streamContents: [ :s |
		s nextPutAll: (self moveTo: ((self xy x + self radius) @ (self xy y)) on: aPage); 
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
 	
	^buffer
]
