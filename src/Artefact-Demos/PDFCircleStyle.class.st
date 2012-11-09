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
	
	origin := (self userUnitToPoints: self xy x into: aPage document) @ ((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document)).
	r := self userUnitToPoints: self radius into: aPage document.

	self out: (String streamContents: [ :s |
		s print: (origin x + r); space;  print: origin y; nextPutAll: ' m ';
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
