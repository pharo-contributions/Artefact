"
A PDFPolygonElement is  the basic element for polygons.

Instance Variables

"
Class {
	#name : #PDFPolygonElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFPolygonElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet [
	"Draw a polygon from xy to destination (a array of positions)"
	
	| points |
	
	points := OrderedCollection new 
		addAll: (self to collect: [ :position |
			aPDFGenerator determinePositionOnCurrentPage: position
		]);
		add: (aPDFGenerator determinePositionOnCurrentPage: self from);
		yourself.
	
	^ (String streamContents: [ :s |
		s nextPutAll: (self moveTo: self from with: aPDFGenerator ).
		points do: [ :pos | 
			s nextPutAll: (self splitCoordinates: pos);
			space;
			nextPutAll: PDFByteCode line;
			space
		].
		s nextPutAll:( self fillMode: (aStyleSheet filled))
	]).
]
